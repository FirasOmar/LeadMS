//using System;
//using System.Data.Entity;
//using System.Linq;
//using System.Web.Mvc;
//using CRM.Core;
//using CRM.Core.Helpers;
//using CRM.DataEntity.Models;
//using CRM.Web.Controllers.APIs.Responses;
//using CRM.Web.Helpers;
//using CRM.Web.Models;
//using CRM.Workflow;
//using PagedList;
//using Microsoft.Ajax.Utilities;
//using System.Net;
//using CRM.Core.SystemEnums;
//using CRM.Web.Filters;
//using System.Collections.Generic;
//using System.Text;
//using System.IO;
//using Newtonsoft.Json;
//using System.Web.Script.Serialization;
//using RestSharp;
//using RestSharp.Authenticators;

//namespace CRM.Web.Controllers
//{
//    public class ManageCasesController : BaseController
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();

//        [CustomAuthentication(PageName = "Cases", PermissionKey = "View")]
//        public ActionResult Index(int? type, int? page, string searchText, DynamicChartsFilters filters, int resetTo = 0)
//        {
//            if (resetTo == 1)
//            {
//                page = 1;
//            }
//            var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//            ViewBag.typeId = type;

//            var user = _db.UserProfiles.FirstOrDefault(r => r.Username == User.Identity.Name);
//            if (user == null || user.Status != (int)GeneralEnums.StatusEnum.Active)
//            {
//                return null;
//            }

//            var result = new List<CaseViewModel>();

//            var sysCases = _db.SystemCases.Where(r => r.Status != (int)GeneralEnums.StatusEnum.Deleted && r.TypeId == type);
//            if (!User.IsInRole("Administrator"))
//            {
//                var users = _db.UserProfiles.Where(r => r.ManagerId == user.Id).Select(r => r.Id).ToList();
//                sysCases = sysCases.Where(r => r.CreatedBy == User.Identity.Name || r.AssigneeId == user.Id || users.Contains(r.AssigneeId ?? 0));
//            }

//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                sysCases = sysCases.Where(r => r.Title.Contains(searchText) || r.Tags.Contains(searchText) || r.Description.Contains(searchText));
//                ViewBag.searchText = searchText;
//            }

//            if (filters != null)
//            {
//                ViewBag.AdvanceSearchFilters = filters;
//                ViewBag.FromAdvanceSearch = filters.FromAdvanceSearch;
//                sysCases = AdvanceSearchCasesData(filters, sysCases);
//            }

//            if (type != (int)GeneralEnums.CasesType.Tenders && type != (int)GeneralEnums.CasesType.Jobs)
//            {
//                result = sysCases.ToList().Select(x =>
//                   new CaseViewModel()
//                   {
//                       Id = x.Id,
//                       Status = x.Status,
//                       Description = x.Description,
//                       CreatedOn = x.CreatedOn,
//                       DeletedOn = x.DeletedOn,
//                       CreatedBy = x.CreatedBy,
//                       Tags = x.Tags,
//                       Title = x.Title,
//                       Address = x.Address,
//                       Location = x.Location,
//                       CurrentStatus = x.StateHistories.LastOrDefault() != null ? x.StateHistories.LastOrDefault().CurrentState : (int)GeneralEnums.StateEnum.Na,
//                       CurrentStatusName = x.StateHistories.LastOrDefault() != null ? LookupHelper.GetLookupDetailsById(x.StateHistories.LastOrDefault().CurrentState, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                       TypeId = x.TypeId,
//                       AssigneeId = x.AssigneeId,
//                       AssigneeName = x.AssigneeId != null ?
//                           LanguageFallbackHelper.GetUserProfile((int)x.AssigneeId, langId)?.FullName ??
//                           string.Empty : string.Empty,
//                       CategoryId = x.CategoryId,
//                       CategoryName = x.CategoryId != null ? LookupHelper.GetLookupDetailsById((int)x.CategoryId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                       PriorityId = x.PriorityId,
//                       PriorityName = x.PriorityId != null ? LookupHelper.GetLookupDetailsById((int)x.PriorityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                       FormId = x.FormId,
//                       FormName = x.FormName,
//                       SeverityId = x.SeverityId,
//                       SeverityName = x.SeverityId != null ? LookupHelper.GetLookupDetailsById((int)x.SeverityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                       UniqueId = x.UniqueId,
//                       Files = x.SystemCaseAttachments.Select(r => new FileResponse()
//                       {
//                           Id = r.SystemFile.Id,
//                           DisplayName = r.SystemFile.SystemFileTranslations.FirstOrDefault()?.DisplayName,
//                           FileUrl = r.SystemFile.FileUrl
//                       }).ToList(),
//                       Comments = x.SysCaseComments.Select(r => new CommentsViewModel()
//                       {
//                           Id = r.Id,
//                           Comment = r.Comment,
//                           CreatedBy = r.CreatedBy,
//                           CaseId = r.CaseId,
//                           CaseName = r.SystemCas.Title,
//                           Status = r.Status,
//                           CreatedOn = r.CreatedOn
//                       }).ToList()
//                   }).OrderByDescending(r => r.Id).ToList();
//            }

//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);
//            return View(result.ToPagedList(pageNumber, pageSize));
//        }

//        [CustomAuthentication(PageName = "Cases", PermissionKey = "View")]
//        public ActionResult FormsIndex(int? type, int? page, string searchText, FormsDynamicFilters filters, int resetTo = 0)
//        {
//            if (type == (int)GeneralEnums.CasesType.Tenders || type == (int)GeneralEnums.CasesType.Jobs)
//            {
//                if (resetTo == 1)
//                {
//                    page = 1;
//                }

//                var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//                ViewBag.typeId = type;
//                ViewBag.langId = langId;

//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == User.Identity.Name);
//                if (user == null || user.Status != (int)GeneralEnums.StatusEnum.Active)
//                {
//                    return null;
//                }

//                var apiData = GetFormsAPIData(type, langId.ToString());

//                if (apiData != null)
//                {
//                    var formsData = apiData.Where(t => t.Status == (int)GeneralEnums.StatusEnum.Active || t.Status == (int)GeneralEnums.StatusEnum.Archived).AsQueryable();

//                    if (!User.IsInRole("Administrator"))
//                    {
//                        var users = _db.UserProfiles.Where(r => r.ManagerId == user.Id).Select(r => r.Id).ToList();
//                        formsData = formsData.Where(r => r.CreatedBy == User.Identity.Name);
//                    }
//                    if (!searchText.IsNullOrWhiteSpace())
//                    {
//                        formsData = formsData.Where(r => r.Title.Contains(searchText) || r.Tags.Contains(searchText) || r.Description.Contains(searchText));
//                        ViewBag.searchText = searchText;
//                    }

//                    if (filters != null)
//                    {
//                        ViewBag.AdvanceSearchFilters = filters;
//                        ViewBag.FromAdvanceSearch = filters.FromAdvanceSearch;
//                        formsData = AdvanceSearchFormsData(filters, formsData);
//                    }

//                    var result = formsData.ToList().Select(x =>
//                       new FormsViewModel()
//                       {
//                           Id = x.Id,
//                           Status = x.Status,
//                           Description = x.Description,
//                           CreatedBy = x.CreatedBy,
//                           CreatedOn = x.CreatedOn,
//                           PublishDate = x.PublishDate,
//                           DeletedOn = x.DeletedOn,
//                           EndDate = x.EndDate,
//                           Tags = x.Tags,
//                           NumberOfApplicant = _db.SystemCases.Where(t => t.FormId == x.Id + string.Empty).Count(),
//                           Title = x.Title,
//                           TypeId = x.TypeId,
//                       }).OrderByDescending(r => r.Id).ToList();

//                    int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//                    var pageNumber = (page ?? 1);
//                    return View(result.ToPagedList(pageNumber, pageSize));
//                }
//            }
//            return null;
//        }

//        [CustomAuthentication(PageName = "Cases", PermissionKey = "View")]
//        public ActionResult Details(int? id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            SystemCas cas = _db.SystemCases.Find(id);
//            if (cas == null || cas.Status == (int)GeneralEnums.StatusEnum.Deleted)
//            {
//                return HttpNotFound();
//            }

//            var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//            var result = new CaseViewModel()
//            {
//                CreatedBy = cas.CreatedBy,
//                CreatedOn = cas.CreatedOn,
//                Status = cas.Status,
//                Description = cas.Description,
//                Id = cas.Id,
//                Tags = cas.Tags,
//                Title = cas.Title,
//                Address = cas.Address,
//                Location = cas.Location,
//                TypeId = cas.TypeId,
//                AssigneeId = cas.AssigneeId,
//                AssigneeName = cas.AssigneeId != null ?
//                    LanguageFallbackHelper.GetUserProfile((int)cas.AssigneeId, langId)?.FullName ??
//                    string.Empty : string.Empty,
//                CategoryId = cas.CategoryId,
//                CategoryName = cas.CategoryId != null ? LookupHelper.GetLookupDetailsById((int)cas.CategoryId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                PriorityId = cas.PriorityId,
//                PriorityName = cas.PriorityId != null ? LookupHelper.GetLookupDetailsById((int)cas.PriorityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                SeverityId = cas.SeverityId,
//                SeverityName = cas.SeverityId != null ? LookupHelper.GetLookupDetailsById((int)cas.SeverityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                UniqueId = cas.UniqueId,
//                Files = cas.SystemCaseAttachments.Select(r => new FileResponse()
//                {
//                    Id = r.SystemFile.Id,
//                    DisplayName = r.SystemFile.SystemFileTranslations.FirstOrDefault()?.DisplayName,
//                    FileUrl = r.SystemFile.FileUrl
//                }).ToList(),
//                Comments = User.IsInRole(Constants.Roles.Citizen) ? cas.SysCaseComments.Where(t => t.ForCitizen ?? false).Select(x => new CommentsViewModel()
//                {
//                    Id = x.Id,
//                    Comment = x.Comment,
//                    CreatedByProfile = LanguageFallbackHelper.GetUserProfileByUsername(x.CreatedBy, langId),
//                    CreatedBy = x.CreatedBy,
//                    CaseId = x.CaseId,
//                    CaseName = x.SystemCas.Title,
//                    Status = x.Status,
//                    CreatedOn = x.CreatedOn
//                }).ToList() : cas.SysCaseComments.Select(x => new CommentsViewModel()
//                {
//                    Id = x.Id,
//                    Comment = x.Comment,
//                    CreatedByProfile = LanguageFallbackHelper.GetUserProfileByUsername(x.CreatedBy, langId),
//                    CreatedBy = x.CreatedBy,
//                    CaseId = x.CaseId,
//                    CaseName = x.SystemCas.Title,
//                    Status = x.Status,
//                    FilePath = x.FilePath,
//                    CreatedOn = x.CreatedOn
//                }).ToList(),
//                FlowStatus = _db.StateHistories.OrderByDescending(r => r.Id).FirstOrDefault(r => r.CaseId == id)?.CurrentState
//            };
//            result.FlowStatusName = result.FlowStatus != null
//                ? LookupHelper.GetLookupDetailsById((int)result.FlowStatus, Request.Cookies["_culture"])?.Name : string.Empty;

//            var userProfile = _db.UserProfiles.FirstOrDefault(r => r.Username == cas.CreatedBy);

//            if (userProfile != null)
//            {
//                var profile = LanguageFallbackHelper.GetUserProfile(userProfile.Id, langId);
//                if (profile != null)
//                {
//                    result.UserProfile = profile;
//                }
//            }

//            return View(result);
//        }

//        [CustomAuthentication(PageName = "Cases", PermissionKey = "View")]
//        public ActionResult FormDetails(string formId, string searchText, int? page, int resetTo = 0)
//        {

//            if (!formId.IsNotNullOrEmpty())
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }

//            if (resetTo == 1)
//            {
//                page = 1;
//            }
//            var formData = _db.SystemCases.Where(t => t.FormId == formId && t.Status != (int)GeneralEnums.StatusEnum.Deleted);

//            ViewBag.FormId = formId;


//            var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//            var result = formData.Count() > 0 ? formData.ToList().Select(t => new CaseFormViewModel()
//            {
//                CaseId = t.Id,
//                FormId = t.FormId,
//                FormName = t.FormName,
//                CreateOn = t.CreatedOn,
//                CreatedByProfile = LanguageFallbackHelper.GetUserProfileByUsername(t.CreatedBy, langId),
//            }) : new List<CaseFormViewModel>();


//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                result = result.Where(r => r.CreatedByProfile.FullName.Contains(searchText)).ToList();
//                ViewBag.searchText = searchText;
//            }

//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);
//            return View(result.ToPagedList(pageNumber, pageSize));

//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Cases", PermissionKey = "Create")]
//        public JsonResult AddCase(CaseViewModel sysCase)
//        {
//            try
//            {
//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == User.Identity.Name);
//                if (user == null || user.Status != (int)GeneralEnums.StatusEnum.Active)
//                {
//                    return null;
//                }
//                #region Add Case

//                var cas = new SystemCas()
//                {
//                    Tags = sysCase.Tags,
//                    Title = sysCase.Title,
//                    Address = sysCase.Address,
//                    Location = sysCase.Location,
//                    AssigneeId = sysCase.AssigneeId,
//                    CategoryId = sysCase.CategoryId,
//                    PriorityId = sysCase.PriorityId,
//                    SeverityId = sysCase.SeverityId,
//                    UniqueId = Guid.NewGuid(),
//                    CreatedBy = User.Identity.Name,
//                    CreatedOn = DateTime.Now,
//                    Status = sysCase.Status,
//                    Description = sysCase.Description,
//                    TypeId = sysCase.TypeId
//                };
//                if (sysCase.PriorityId == 31)
//                    sysCase.PriorityValue = 100;

//                if (sysCase.PriorityId == 32)
//                    sysCase.PriorityValue = 50;

//                if (sysCase.PriorityId == 33)
//                    sysCase.PriorityValue = 0;

//                if (sysCase.SeverityId == 28)
//                    sysCase.SeverityValue = 100;

//                if (sysCase.SeverityId == 29)
//                    sysCase.SeverityValue = 50;

//                if (sysCase.SeverityId == 30)
//                    sysCase.SeverityValue = 0;

//                _db.SystemCases.Add(cas);
//                _db.SaveChanges();

//                foreach (var sysFile in sysCase.Files)
//                {
//                    _db.SystemCaseAttachments.Add(new SystemCaseAttachment()
//                    {
//                        CaseId = cas.Id,
//                        FileId = sysFile.Id
//                    });
//                }
//                _db.SaveChanges();

//                #region SMS And Email 

//                var smsTemplateEnumValue = SMSHelper.GetSMSStatusTemplateEnumValue((int)GeneralEnums.StateEnum.New);
//                if (smsTemplateEnumValue.Count > 0)
//                {
//                    try
//                    {
//                        SMSHelper.SendSMSTemplate(smsTemplateEnumValue, User, cas.CreatedBy, cas.AssigneeId.GetValueOrDefault(), cas.Id);
//                    }
//                    catch (Exception ex)
//                    {
//                        LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms  for case id {cas.Id}");
//                    }
//                    try
//                    {
//                        var obj = new EmailHelper();
//                        obj.SendSMSTemplateAsEmail(smsTemplateEnumValue, cas, User);
//                    }
//                    catch (Exception ex)
//                    {
//                        LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms template as email email for case id {cas.Id}");
//                    }
//                }
//                #endregion
//                #endregion

//                #region Add state

//                _db.StateHistories.Add(new StateHistory()
//                {
//                    CreatedBy = User.Identity.Name,
//                    CaseId = sysCase.Id,
//                    CreatedOn = DateTime.Now,
//                    CurrentState = (int)GeneralEnums.StateEnum.New,
//                    PreviousState = (int)GeneralEnums.StateEnum.Na,
//                    Status = (int)GeneralEnums.StatusEnum.Active
//                });
//                _db.SaveChanges();


//                #endregion

//                if (sysCase.CategoryId != null)
//                {
//                    var assigneeUserId = WorkflowHelper.GetAssignedUser((int)GeneralEnums.StateEnum.Na,
//                        (int)GeneralEnums.StateEnum.New, (int)sysCase.CategoryId);
//                    if (assigneeUserId != 0)
//                    {
//                        sysCase.AssigneeId = assigneeUserId;
//                        _db.Entry(sysCase).State = EntityState.Modified;
//                        _db.SaveChanges();
//                        var assigneeUser = _db.UserProfiles.Find(assigneeUserId);
//                        if (assigneeUser != null)
//                        {
//                            var complaintWorkflow = new Complaint(cas, assigneeUser);
//                            complaintWorkflow.Assign(assigneeUser.Email);
//                        }
//                    }
//                }

//                return Json(sysCase, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new case");
//                return null;
//            }
//        }

//        [HttpGet]
//        [CustomAuthentication(PageName = "Cases", PermissionKey = "Edit")]
//        public JsonResult EditCase(int id)
//        {
//            try
//            {
//                var cas = _db.SystemCases.Find(id);
//                var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//                if (cas != null && cas.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    var casVm = new CaseViewModel()
//                    {
//                        CreatedBy = cas.CreatedBy,
//                        CreatedOn = cas.CreatedOn,
//                        Status = cas.Status,
//                        Description = cas.Description,
//                        Id = cas.Id,
//                        Tags = cas.Tags,
//                        Title = cas.Title,
//                        Address = cas.Address,
//                        Location = cas.Location,
//                        AssigneeId = cas.AssigneeId,
//                        AssigneeName = cas.AssigneeId != null ?
//                            LanguageFallbackHelper.GetUserProfile((int)cas.AssigneeId, langId)?.FullName ??
//                            string.Empty : string.Empty,
//                        CategoryId = cas.CategoryId,
//                        CategoryName = cas.CategoryId != null ? LookupHelper.GetLookupDetailsById((int)cas.CategoryId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                        PriorityId = cas.PriorityId,
//                        PriorityName = cas.PriorityId != null ? LookupHelper.GetLookupDetailsById((int)cas.PriorityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                        SeverityId = cas.SeverityId,
//                        SeverityName = cas.SeverityId != null ? LookupHelper.GetLookupDetailsById((int)cas.SeverityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                        UniqueId = cas.UniqueId,
//                        Files = cas.SystemCaseAttachments.Select(r => new FileResponse()
//                        {
//                            Id = r.SystemFile.Id,
//                            DisplayName = r.SystemFile.SystemFileTranslations.FirstOrDefault()?.DisplayName,
//                            FileUrl = r.SystemFile.FileUrl
//                        }).ToList(),
//                        Comments = cas.SysCaseComments.Select(x => new CommentsViewModel()
//                        {
//                            Id = x.Id,
//                            Comment = x.Comment,
//                            CreatedBy = x.CreatedBy,
//                            CaseId = x.CaseId,
//                            CaseName = x.SystemCas.Title,
//                            Status = x.Status,
//                            CreatedOn = x.CreatedOn
//                        }).ToList()
//                    };
//                    return Json(casVm, JsonRequestBehavior.AllowGet);
//                }


//                return Json(null, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Case (Get)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Cases", PermissionKey = "Edit")]
//        public JsonResult EditCase(CaseViewModel sysCase)
//        {
//            try
//            {
//                var cas = _db.SystemCases.Find(sysCase.Id);
//                var sendSMSForNewAssigne = false;

//                if (cas.AssigneeId != sysCase.AssigneeId)
//                {
//                    sendSMSForNewAssigne = true;
//                }

//                if (cas != null && cas.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    cas.Status = sysCase.Status;
//                    cas.Description = sysCase.Description;
//                    cas.AssigneeId = sysCase.AssigneeId;
//                    cas.CategoryId = sysCase.CategoryId;
//                    cas.Tags = sysCase.Tags;
//                    cas.Title = sysCase.Title;
//                    cas.Address = sysCase.Address;
//                    cas.Location = sysCase.Location;
//                    cas.PriorityId = sysCase.PriorityId;
//                    cas.SeverityId = sysCase.SeverityId;

//                    _db.Entry(cas).State = EntityState.Modified;
//                    _db.SaveChanges();

//                    foreach (var sysFile in sysCase.Files)
//                    {
//                        _db.SystemCaseAttachments.Add(new SystemCaseAttachment()
//                        {
//                            CaseId = cas.Id,
//                            FileId = sysFile.Id
//                        });
//                    }
//                    _db.SaveChanges();

//                    #region Send SMS for new Assignee 

//                    if (sendSMSForNewAssigne)
//                    {
//                        var smsTemplateEnumValue = SMSHelper.GetSMSStatusTemplateEnumValue((int)GeneralEnums.StateEnum.NewAssignee);
//                        if (smsTemplateEnumValue.Count > 0)
//                        {
//                            try
//                            {
//                                SMSHelper.SendSMSTemplate(smsTemplateEnumValue, User, cas.CreatedBy, cas.AssigneeId.GetValueOrDefault(), cas.Id);
//                            }
//                            catch (Exception ex)
//                            {
//                                LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms for case id {cas.Id} (New Assignee)");
//                            }
//                        }

//                    }
//                    #endregion
//                }


//                return Json(sysCase, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Case (Post)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Cases", PermissionKey = "Delete")]
//        public JsonResult DeleteCase(int id)
//        {
//            try
//            {
//                var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//                var cas = _db.SystemCases.Find(id);
//                if (cas != null && cas.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    cas.Status = (int)GeneralEnums.StatusEnum.Deleted;
//                    _db.Entry(cas).State = EntityState.Modified;
//                    _db.SaveChanges();

//                    return Json(new CaseViewModel()
//                    {
//                        Id = cas.Id,
//                        Status = cas.Status,
//                        Description = cas.Description,
//                        CreatedOn = cas.CreatedOn,
//                        DeletedOn = cas.DeletedOn,
//                        CreatedBy = cas.CreatedBy,
//                        Tags = cas.Tags,
//                        Title = cas.Title,
//                        Address = cas.Location,
//                        Location = cas.Title,
//                        AssigneeId = cas.AssigneeId,
//                        AssigneeName = cas.AssigneeId != null ?
//                            LanguageFallbackHelper.GetUserProfile((int)cas.AssigneeId, langId)?.FullName ??
//                            string.Empty : string.Empty,
//                        CategoryId = cas.CategoryId,
//                        CategoryName = cas.CategoryId != null ? LookupHelper.GetLookupDetailsById((int)cas.CategoryId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                        PriorityId = cas.PriorityId,
//                        PriorityName = cas.PriorityId != null ? LookupHelper.GetLookupDetailsById((int)cas.PriorityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                        SeverityId = cas.SeverityId,
//                        SeverityName = cas.SeverityId != null ? LookupHelper.GetLookupDetailsById((int)cas.SeverityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                        UniqueId = cas.UniqueId
//                    }, JsonRequestBehavior.AllowGet);
//                }
//                return Json(null, JsonRequestBehavior.AllowGet);
//            }

//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting Case");
//                return null;
//            }
//        }

//        [CustomAuthentication(PageName = "Cases", PermissionKey = "Comment")]
//        public ActionResult AddComment(CommentsViewModel commentData)
//        {
//            try
//            {
//                if (User.IsInRole(Constants.Roles.Citizen))
//                {
//                    commentData.ForCitizen = true;
//                }

//                _db.SysCaseComments.Add(new SysCaseComment()
//                {
//                    CreatedBy = User.Identity.Name,
//                    Status = (int)GeneralEnums.StatusEnum.Active,
//                    CaseId = commentData.CaseId,
//                    Comment = commentData.Comment,
//                    CreatedOn = DateTime.Now,
//                    ForCitizen = commentData.ForCitizen,
//                    FilePath = (commentData.FilePath != null && commentData.FilePath.IsNotNullOrEmpty()) ? commentData.FilePath : string.Empty
//                });
//                _db.SaveChanges();
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, $"Error while adding comment {commentData.Comment} for case id {commentData.CaseId}");
//            }

//            return RedirectToAction("Details", new { id = commentData.CaseId });
//        }

//        [CustomAuthentication(PageName = "Cases", PermissionKey = "Assign")]
//        public ActionResult ChangeState(int caseId, int stateId, int prevState)
//        {
//            try
//            {
//                var cas = _db.SystemCases.Find(caseId);
//                if (cas?.CategoryId != null)
//                {

//                    var user = _db.UserProfiles.FirstOrDefault(r => r.Username == User.Identity.Name);
//                    var assigneeUserId = WorkflowHelper.GetAssignedUser(prevState,
//                        stateId, (int)cas.CategoryId);
//                    var complaintWorkflow = new Complaint(cas, user);
//                    if (assigneeUserId != 0 && assigneeUserId != cas.AssigneeId)
//                    {
//                        complaintWorkflow.OnDeassigned();

//                        cas.AssigneeId = assigneeUserId;
//                        _db.Entry(cas).State = EntityState.Modified;
//                        _db.SaveChanges();
//                    }
//                    switch (stateId)
//                    {
//                        case (int)GeneralEnums.StateEnum.New:
//                            complaintWorkflow.Assign(user.Email);
//                            break;
//                        case (int)GeneralEnums.StateEnum.Resolved:
//                            complaintWorkflow.Resolve();
//                            break;
//                        case (int)GeneralEnums.StateEnum.Rejected:
//                            complaintWorkflow.Reject();
//                            break;
//                        case (int)GeneralEnums.StateEnum.Duplicated:
//                            complaintWorkflow.Duplicate();
//                            break;
//                        case (int)GeneralEnums.StateEnum.Closed:
//                            complaintWorkflow.Close();
//                            break;
//                        case (int)GeneralEnums.StateEnum.InProgress:
//                            complaintWorkflow.InProgress();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderNew:
//                            complaintWorkflow.TenderNew();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderRecieved:
//                            complaintWorkflow.TenderRecieved();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderInProgress:
//                            complaintWorkflow.TenderInProgress();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderWinner:
//                            complaintWorkflow.TenderWinner();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderLoser:
//                            complaintWorkflow.TenderLoser();
//                            break;
//                        case (int)GeneralEnums.StateEnum.JobNew:
//                            complaintWorkflow.JobNew();
//                            break;
//                        case (int)GeneralEnums.StateEnum.JobRecieved:
//                            complaintWorkflow.JobRecieved();
//                            break;
//                        case (int)GeneralEnums.StateEnum.JobInProgress:
//                            complaintWorkflow.JobInProgress();
//                            break;
//                        case (int)GeneralEnums.StateEnum.JobWinner:
//                            complaintWorkflow.JobWinner();
//                            break;
//                    }

//                    #region Email and SMS 

//                    var smsTemplateEnumValue = SMSHelper.GetSMSStatusTemplateEnumValue(stateId);
//                    if (smsTemplateEnumValue.Count > 0)
//                    {
//                        try
//                        {
//                            SMSHelper.SendSMSTemplate(smsTemplateEnumValue, User, cas.CreatedBy, cas.AssigneeId.GetValueOrDefault(), caseId);
//                        }
//                        catch (Exception ex)
//                        {
//                            LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms  for case id {caseId}");
//                        }
//                        try
//                        {
//                            var obj = new EmailHelper();
//                            obj.SendSMSTemplateAsEmail(smsTemplateEnumValue, cas, User);
//                        }
//                        catch (Exception ex)
//                        {
//                            LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms template as email email for case id {cas.Id}");
//                        }
//                    }

//                    #endregion
//                }
//                _db.StateHistories.Add(new StateHistory()
//                {
//                    CreatedBy = User.Identity.Name,
//                    Status = (int)GeneralEnums.StatusEnum.Active,
//                    CaseId = caseId,
//                    CurrentState = stateId,
//                    PreviousState = prevState,
//                    CreatedOn = DateTime.Now
//                });
//                _db.SaveChanges();
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, $"Error while Changing State {stateId} for case id {caseId}");
//            }

//            return RedirectToAction("Details", new { id = caseId });
//        }

//        [CustomAuthentication(PageName = "Cases", PermissionKey = "Assign")]
//        public ActionResult ChangeStateKampanPanel(int caseId, int stateId, int prevState)
//        {
//            try
//            {
//                var cas = _db.SystemCases.Find(caseId);
//                if (cas?.CategoryId != null)
//                {

//                    var user = _db.UserProfiles.FirstOrDefault(r => r.Username == User.Identity.Name);
//                    var assigneeUserId = WorkflowHelper.GetAssignedUser(prevState,
//                        stateId, (int)cas.CategoryId);
//                    var complaintWorkflow = new Complaint(cas, user);
//                    if (assigneeUserId != 0 && assigneeUserId != cas.AssigneeId)
//                    {
//                        complaintWorkflow.OnDeassigned();

//                        cas.AssigneeId = assigneeUserId;
//                        _db.Entry(cas).State = EntityState.Modified;
//                        _db.SaveChanges();
//                    }
//                    switch (stateId)
//                    {
//                        case (int)GeneralEnums.StateEnum.New:
//                            complaintWorkflow.Assign(user.Email);
//                            break;
//                        case (int)GeneralEnums.StateEnum.Resolved:
//                            complaintWorkflow.Resolve();
//                            break;
//                        case (int)GeneralEnums.StateEnum.Rejected:
//                            complaintWorkflow.Reject();
//                            break;
//                        case (int)GeneralEnums.StateEnum.Duplicated:
//                            complaintWorkflow.Duplicate();
//                            break;
//                        case (int)GeneralEnums.StateEnum.Closed:
//                            complaintWorkflow.Close();
//                            break;
//                        case (int)GeneralEnums.StateEnum.InProgress:
//                            complaintWorkflow.InProgress();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderNew:
//                            complaintWorkflow.TenderNew();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderRecieved:
//                            complaintWorkflow.TenderRecieved();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderInProgress:
//                            complaintWorkflow.TenderInProgress();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderWinner:
//                            complaintWorkflow.TenderWinner();
//                            break;
//                        case (int)GeneralEnums.StateEnum.TenderLoser:
//                            complaintWorkflow.TenderLoser();
//                            break;
//                        case (int)GeneralEnums.StateEnum.JobNew:
//                            complaintWorkflow.JobNew();
//                            break;
//                        case (int)GeneralEnums.StateEnum.JobRecieved:
//                            complaintWorkflow.JobRecieved();
//                            break;
//                        case (int)GeneralEnums.StateEnum.JobInProgress:
//                            complaintWorkflow.JobInProgress();
//                            break;
//                        case (int)GeneralEnums.StateEnum.JobWinner:
//                            complaintWorkflow.JobWinner();
//                            break;
//                    }

//                    #region Email and SMS 

//                    var smsTemplateEnumValue = SMSHelper.GetSMSStatusTemplateEnumValue(stateId);
//                    if (smsTemplateEnumValue.Count > 0 && false)
//                    {
//                        try
//                        {
//                            SMSHelper.SendSMSTemplate(smsTemplateEnumValue, User, cas.CreatedBy, cas.AssigneeId.GetValueOrDefault(), caseId);
//                        }
//                        catch (Exception ex)
//                        {
//                            LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms  for case id {caseId}");
//                        }
//                        try
//                        {
//                            var obj = new EmailHelper();
//                            obj.SendSMSTemplateAsEmail(smsTemplateEnumValue, cas, User);
//                        }
//                        catch (Exception ex)
//                        {
//                            LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms template as email email for case id {cas.Id}");
//                        }
//                    }

//                    #endregion
//                }
//                _db.StateHistories.Add(new StateHistory()
//                {
//                    CreatedBy = User.Identity.Name,
//                    Status = (int)GeneralEnums.StatusEnum.Active,
//                    CaseId = caseId,
//                    CurrentState = stateId,
//                    PreviousState = prevState,
//                    CreatedOn = DateTime.Now
//                });
//                _db.SaveChanges();
//                return Json("Success", JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, $"Error while Changing State {stateId} for case id {caseId}");
//                return null;
//            }
//        }

//        [CustomAuthentication(PageName = "Cases", PermissionKey = "Comment")]
//        public ActionResult DeleteComment(int id)
//        {
//            try
//            {
//                var comment = _db.SysCaseComments.Find(id);
//                if (comment != null && comment.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    _db.SysCaseComments.Remove(comment);
//                    _db.SaveChanges();
//                }
//                return RedirectToAction("Details", new { id = comment?.CaseId });
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, $"Error while deleting comment {id}");
//            }

//            return RedirectToAction("Index");
//        }

//        [CustomAuthentication(PageName = "Cases", PermissionKey = "SendByEmail")]
//        public ActionResult SendCaseAsEmail(int caseId, string emailDescription, string emails)
//        {
//            try
//            {
//                if (emails.IsNotNullOrEmpty() && emailDescription.IsNotNullOrEmpty() && caseId > 0)
//                {
//                    var caseData = _db.SystemCases.Find(caseId);
//                    var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//                    var emailsList = emails.Split(',').ToList();

//                    if (caseData != null && emailsList.Count > 0)
//                    {
//                        var root = Server.MapPath(Constants.TempaltesPathes.Case.SendCaseByEmailFolder);
//                        if (!Directory.Exists(root))
//                        {
//                            Directory.CreateDirectory(root);
//                        }

//                        var filename = (caseData.Title + DateTime.Now).RemoveSpecialCharacters() + ".pdf";

//                        var path = Path.GetFullPath(Path.Combine(root, filename));

//                        var result = new CaseViewModel()
//                        {
//                            Id = caseData.Id,
//                            Status = caseData.Status,
//                            Description = caseData.Description,
//                            CreatedOn = caseData.CreatedOn,
//                            DeletedOn = caseData.DeletedOn,
//                            CreatedBy = caseData.CreatedBy,
//                            Tags = caseData.Tags,
//                            Title = caseData.Title,
//                            Address = caseData.Address,
//                            Location = caseData.Location,
//                            CurrentStatus = caseData.StateHistories.LastOrDefault() != null ? caseData.StateHistories.LastOrDefault().CurrentState : (int)GeneralEnums.StateEnum.Na,
//                            CurrentStatusName = caseData.StateHistories.LastOrDefault() != null ? LookupHelper.GetLookupDetailsById(caseData.StateHistories.LastOrDefault().CurrentState, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                            TypeId = caseData.TypeId,
//                            AssigneeId = caseData.AssigneeId,
//                            AssigneeName = caseData.AssigneeId != null ?
//                              LanguageFallbackHelper.GetUserProfile((int)caseData.AssigneeId, langId)?.FullName ??
//                              string.Empty : string.Empty,
//                            CategoryId = caseData.CategoryId,
//                            CategoryName = caseData.CategoryId != null ? LookupHelper.GetLookupDetailsById((int)caseData.CategoryId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                            PriorityId = caseData.PriorityId,
//                            PriorityName = caseData.PriorityId != null ? LookupHelper.GetLookupDetailsById((int)caseData.PriorityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                            FormId = caseData.FormId,
//                            FormName = caseData.FormName,
//                            SeverityId = caseData.SeverityId,
//                            SeverityName = caseData.SeverityId != null ? LookupHelper.GetLookupDetailsById((int)caseData.SeverityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                            UniqueId = caseData.UniqueId,
//                            Files = caseData.SystemCaseAttachments.Select(r => new FileResponse()
//                            {
//                                Id = r.SystemFile.Id,
//                                DisplayName = r.SystemFile.SystemFileTranslations.FirstOrDefault()?.DisplayName,
//                                FileUrl = r.SystemFile.FileUrl
//                            }).ToList(),
//                            Comments = caseData.SysCaseComments.Select(r => new CommentsViewModel()
//                            {
//                                Id = r.Id,
//                                Comment = r.Comment,
//                                CreatedBy = r.CreatedBy,
//                                CaseId = r.CaseId,
//                                CaseName = r.SystemCas.Title,
//                                Status = r.Status,
//                                CreatedOn = r.CreatedOn
//                            }).ToList()
//                        };

//                        var fileData = new Rotativa.MVC.ViewAsPdf(Constants.TempaltesPathes.Case.SendCaseByEmailTemplate, result)
//                        { FileName = filename, SaveOnServerPath = path };

//                        var byteArray = fileData.BuildPdf(ControllerContext);
//                        var fileStream = new FileStream(path, FileMode.Create, FileAccess.Write);
//                        fileStream.Write(byteArray, 0, byteArray.Length);
//                        fileStream.Close();

//                        var obj = new EmailHelper();

//                        var subject = caseData.Title;
//                        obj.SendFileAsEmail(emailsList, path, caseData.Title, emailDescription);

//                        var saveLog = new CasesByEmail()
//                        {
//                            CreatedBy = User.Identity.Name,
//                            CreatedOn = DateTime.Now,
//                            Status = (int)GeneralEnums.StatusEnum.Active,
//                            EmailDescription = emailDescription,
//                            SentTo = emails,
//                            FilePath = Constants.TempaltesPathes.Case.SendCaseByEmailFolder.Substring(1) + filename
//                        };

//                        _db.CasesByEmails.Add(saveLog);
//                        _db.SaveChanges();

//                        return Json(new { result = "Success" });
//                    }
//                }

//                return null;
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, $"Error While sending Case Data as Email for Case Id {caseId}.");
//                return null;
//            }
//        }

//        [NonAction]
//        public IQueryable<SystemCas> AdvanceSearchCasesData(DynamicChartsFilters filters, IQueryable<SystemCas> data)
//        {
//            if (filters.EmployeeIdSearch > 0)
//            {
//                data = data.Where(t => t.AssigneeId == filters.EmployeeIdSearch);
//            }
//            if (filters.CategoryIdSearch > 0)
//            {
//                data = data.Where(t => t.CategoryId == filters.CategoryIdSearch);
//            }
//            if (filters.PriorityIdSearch > 0)
//            {
//                data = data.Where(t => t.PriorityId == filters.PriorityIdSearch);
//            }
//            if (filters.SeverityIdSearch > 0)
//            {
//                data = data.Where(t => t.SeverityId == filters.SeverityIdSearch);
//            }
//            if (filters.ComplainId > 0)
//            {
//                data = data.Where(t => t.Id == filters.ComplainId);
//            }
//            if (filters.TitleSearch.IsNotNullOrEmpty())
//            {
//                data = data.Where(t => (t.Title ?? string.Empty).ToLower().Contains(filters.TitleSearch.ToLower()));
//            }
//            if (filters.TagsSearch.IsNotNullOrEmpty())
//            {
//                data = data.Where(t => (t.Tags ?? string.Empty).ToLower().Contains(filters.TagsSearch.ToLower()));
//            }
//            if (filters.CitizenId > 0)
//            {
//                var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//                var citizenData = LanguageFallbackHelper.GetUserProfile(filters.CitizenId, currentLanguageId);
//                data = data.Where(t => t.CreatedBy == citizenData.Username);
//            }
//            if (filters.CitizenSearch.IsNotNullOrEmpty())
//            {
//                var citizensUsernames = LookupHelper.GetCitizens(Request.Cookies["_culture"])
//                    .Where(t => ((t.FullName ?? string.Empty).ToLower().Contains(filters.CitizenSearch.ToLower()))
//                    || ((t.IdNumber ?? string.Empty).ToLower().Contains(filters.CitizenSearch.ToLower()))
//                    || ((t.PhoneNumber ?? string.Empty).ToLower().Contains(filters.CitizenSearch.ToLower()))).Select(t => t.Email).ToList();
//                data = data.Where(t => citizensUsernames.Contains(t.CreatedBy));
//            }
//            if (filters.StatusId > 0)
//            {
//                var casesIdsForStatus = _db.StateHistories.GroupBy(t => t.CaseId).ToList().Select(t => new
//                {
//                    casesId = t.LastOrDefault().CaseId,
//                    CurrentStatus = t.LastOrDefault().CurrentState
//                }).ToDictionary(a => a.casesId, a => a.CurrentStatus)
//                .Where(t => t.Value == filters.StatusId).Select(t => t.Key);

//                data = data.Where(t => casesIdsForStatus.Contains(t.Id));
//            }
//            if (filters.FromDate.IsNotNullOrEmpty())
//            {
//                var fromDate = filters.FromDate.ConvertToDateTime();
//                data = data.Where(t => DbFunctions.TruncateTime(t.CreatedOn) >= DbFunctions.TruncateTime(fromDate));
//            }
//            if (filters.ToDate.IsNotNullOrEmpty())
//            {
//                var toDate = filters.ToDate.ConvertToDateTime();
//                data = data.Where(t => DbFunctions.TruncateTime(t.CreatedOn) <= DbFunctions.TruncateTime(toDate));
//            }
//            if (filters.FromTime.IsNotNullOrEmpty())
//            {
//                var fromTime = TimeSpan.Parse(filters.FromTime);
//                data = data.Where(t => DbFunctions.CreateTime(t.CreatedOn.Hour
//                    , t.CreatedOn.Minute,
//                    t.CreatedOn.Second) >= fromTime);
//            }
//            if (filters.ToTime.IsNotNullOrEmpty())
//            {
//                var toTime = TimeSpan.Parse(filters.ToTime);
//                data = data.Where(t => DbFunctions.CreateTime(t.CreatedOn.Hour
//                    , t.CreatedOn.Minute,
//                    t.CreatedOn.Second) <= toTime);
//            }

//            if (filters.ElapseTimeFrom > 0 || filters.ElapseTimeTo > 0)
//            {
//                var casesIds = data.Select(t => t.Id).ToList();
//                var statusHistories = _db.StateHistories.Where(t => casesIds.Contains(t.CaseId)).GroupBy(t => t.CaseId).ToList()
//                      .Select(t => new
//                      {
//                          CaseId = t.LastOrDefault().CaseId,
//                          TimeElapse = Math.Round((t.LastOrDefault().CreatedOn - t.LastOrDefault().SystemCas.CreatedOn).TotalHours, 2)
//                      }).ToDictionary(a => a.CaseId, a => a.TimeElapse);

//                if (filters.ElapseTimeFrom > 0)
//                {
//                    var dataFromTimeElapse = statusHistories.Where(t => t.Value >= filters.ElapseTimeFrom).Select(t => t.Key).ToList();
//                    data = data.Where(t => dataFromTimeElapse.Contains(t.Id));
//                }
//                if (filters.ElapseTimeTo > 0)
//                {
//                    var dataFromTimeElapse = statusHistories.Where(t => t.Value <= filters.ElapseTimeTo).Select(t => t.Key).ToList();
//                    data = data.Where(t => dataFromTimeElapse.Contains(t.Id));
//                }
//            }
//            return data;
//        }

//        [NonAction]
//        public IQueryable<FormsViewModel> AdvanceSearchFormsData(FormsDynamicFilters filters, IQueryable<FormsViewModel> data)
//        {
//            if (filters.ComplainId > 0)
//            {
//                data = data.Where(t => t.Id == filters.ComplainId);
//            }
//            if (filters.TitleSearch.IsNotNullOrEmpty())
//            {
//                data = data.Where(t => (t.Title ?? string.Empty).ToLower().Contains(filters.TitleSearch.ToLower()));
//            }
//            if (filters.TagsSearch.IsNotNullOrEmpty())
//            {
//                data = data.Where(t => (t.Tags ?? string.Empty).ToLower().Contains(filters.TagsSearch.ToLower()));
//            }
//            if (filters.StatusId > 0)
//            {
//                var formsIds = data.Select(t => t.Id + string.Empty).ToList();
//                var casesIds = _db.SystemCases.Where(t => formsIds.Contains(t.FormId)).Select(t => t.Id).ToList();
//                var casesIdsForStatus = _db.StateHistories.Where(t => casesIds.Contains(t.CaseId))
//                    .GroupBy(t => t.CaseId).ToList().Select(t => new
//                    {
//                        casesId = t.LastOrDefault().CaseId,
//                        CurrentStatus = t.LastOrDefault().CurrentState
//                    }).ToDictionary(a => a.casesId, a => a.CurrentStatus)
//                .Where(t => t.Value == filters.StatusId).Select(t => t.Key);

//                var formsIdsForStatus = _db.SystemCases.Where(t => casesIdsForStatus.Contains(t.Id)).Select(t => t.FormId ?? string.Empty).Distinct().ToList();

//                data = data.Where(t => formsIdsForStatus.Contains(t.Id + string.Empty));
//            }
//            if (filters.FromDate.IsNotNullOrEmpty())
//            {
//                var fromDate = filters.FromDate.ConvertToDateTime();
//                data = data.Where(t => t.CreatedOn.Date >= fromDate.Date);
//            }
//            if (filters.ToDate.IsNotNullOrEmpty())
//            {
//                var toDate = filters.ToDate.ConvertToDateTime();
//                data = data.Where(t => t.CreatedOn.Date <= toDate.Date);
//            }
//            if (filters.PublishDateFrom.IsNotNullOrEmpty())
//            {
//                var publishDateFrom = filters.PublishDateFrom.ConvertToDateTime();
//                data = data.Where(t => t.PublishDate.HasValue && t.PublishDate.Value.Date >= publishDateFrom.Date);
//            }
//            if (filters.PublishDateTo.IsNotNullOrEmpty())
//            {
//                var publishDateTo = filters.PublishDateTo.ConvertToDateTime();
//                data = data.Where(t => t.PublishDate.HasValue && t.PublishDate.Value.Date <= publishDateTo.Date);
//            }
//            if (filters.EndDateFrom.IsNotNullOrEmpty())
//            {
//                var endDateFrom = filters.EndDateFrom.ConvertToDateTime();
//                data = data.Where(t => t.EndDate.HasValue && t.EndDate.Value.Date >= endDateFrom.Date);
//            }
//            if (filters.EndDateTo.IsNotNullOrEmpty())
//            {
//                var endDateTo = filters.EndDateTo.ConvertToDateTime();
//                data = data.Where(t => t.EndDate.HasValue && t.EndDate.Value.Date <= endDateTo.Date);
//            }
//            return data;
//        }

//        private static List<FormsViewModel> GetFormsAPIData(int? type, string langId)
//        {
//            try
//            {
//                string username = SettingHelper.GetOrCreate(Constants.SystemSettings.CMSIntegrationUsernmae, "Integration").Value;
//                string password = SettingHelper.GetOrCreate(Constants.SystemSettings.CMSIntegrationPassword, "C@ms@123").Value;
//                string url = SettingHelper.GetOrCreate(Constants.SystemSettings.CMSApiFormsUrl, "http://cms-ilut.smsm-it.com/api/FormsInfo/GetCaseByTypeId/").Value + type;

//                var client = new RestClient(url) { Authenticator = new HttpBasicAuthenticator(username, password) };
//                var request = new RestRequest(Method.GET);
//                request.AddHeader("Content-Type", "application/json");
//                request.AddHeader("accept-language", langId);

//                IRestResponse response = client.Execute(request);
//                if (response.StatusCode == HttpStatusCode.OK)
//                {
//                    return JsonConvert.DeserializeObject<List<FormsViewModel>>(response.Content);
//                }

//                return null;
//            }
//            catch (Exception ex)
//            {
//                return null;
//            }
//        }

//        protected override void Dispose(bool disposing)
//        {
//            if (disposing)
//            {
//                _db.Dispose();
//            }
//            base.Dispose(disposing);
//        }
//    }
//}