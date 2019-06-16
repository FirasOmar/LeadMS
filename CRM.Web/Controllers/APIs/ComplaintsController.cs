//using System;
//using System.Collections.Generic;
//using System.Data.Entity;
//using System.Linq;
//using System.Net;
//using System.Net.Http;
//using System.Web;
//using System.Web.Http;
//using CRM.Core;
//using CRM.Core.Helpers;
//using CRM.Core.SystemEnums;
//using CRM.DataEntity.Models;
//using CRM.Web.Controllers.APIs.Responses;
//using CRM.Web.Helpers;
//using CRM.Web.Models;
//using CRM.Workflow;
//using Microsoft.Ajax.Utilities;
//using Newtonsoft.Json;
//using CRM.Web.Controllers.APIs.Requests;

//namespace CRM.Web.Controllers.APIs
//{
//    [RoutePrefix("api/complaints")]
//    public class ComplaintsController : ApiController
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();
//        [Route("addcomplaint")]
//        [AllowAnonymous]
//        public HttpResponseMessage AddComplaint()
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;

//                var jsonStr = httpRequest.Form.AllKeys.Any(r => r == "ComplaintInfo") ? httpRequest.Form["ComplaintInfo"] : string.Empty;
//                if (jsonStr.IsNullOrWhiteSpace())
//                {
//                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, Constants.Errors.Apis.ErrorPleaseUploadComplaintData);
//                }
//                var complaint = JsonConvert.DeserializeObject<CaseViewModel>(jsonStr);
//                var sysCase = new SystemCas()
//                {
//                    Description = complaint.Description,
//                    AssigneeId = complaint.AssigneeId,
//                    CategoryId = complaint.CategoryId,
//                    CreatedBy = complaint.CreatedBy,
//                    CreatedOn = DateTime.Now,
//                    PriorityId = complaint.PriorityId,
//                    SeverityId = complaint.SeverityId,
//                    PriorityValue = complaint.PriorityValue,
//                    SeverityValue = complaint.SeverityValue,
//                    Status = complaint.Status,
//                    Tags = complaint.Tags,
//                    Title = complaint.Title,
//                    Address = complaint.Address,
//                    Location = complaint.Location,
//                    UniqueId = Guid.NewGuid()
//                };
//                _db.SystemCases.Add(sysCase);
//                _db.SaveChanges();
//                var response = new CaseViewModel()
//                {
//                    Description = sysCase.Description,
//                    AssigneeId = sysCase.AssigneeId,
//                    CategoryId = sysCase.CategoryId,
//                    CreatedBy = sysCase.CreatedBy,
//                    CreatedOn = sysCase.CreatedOn,
//                    PriorityId = sysCase.PriorityId,
//                    SeverityId = sysCase.SeverityId,
//                    SeverityValue = sysCase.SeverityValue,
//                    PriorityValue = sysCase.PriorityValue,
//                    Address = sysCase.Address,
//                    Location = sysCase.Location,
//                    Status = sysCase.Status,
//                    Id = sysCase.Id,
//                    Tags = sysCase.Tags,
//                    Title = sysCase.Title,
//                    UniqueId = sysCase.UniqueId
//                };

//                foreach (string file in httpRequest.Files)
//                {
//                    var postedFile = httpRequest.Files[file];
//                    if (postedFile != null && postedFile.ContentLength > 0)
//                    {
//                        var maxSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.FileMaxSize, "5").Value);
//                        int maxContentLength = 1024 * 1024 * maxSize;  //Size = maxSize MB  
//                        var allowedFilesTypes = SettingHelper.GetOrCreate(Constants.SystemSettings.AllowedFilesForUpload,
//                            ".jpg,.gif,.png,.txt,.pdf").Value;
//                        IList<string> allowedFileExtensions = allowedFilesTypes.Split(',').ToList();
//                        var ext = postedFile.FileName.Substring(postedFile.FileName.LastIndexOf('.'));
//                        var extension = ext.ToLower();
//                        if (!allowedFileExtensions.Contains(extension))
//                        {
//                            var message = $"Please Upload file of type {allowedFilesTypes}";
//                            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, message);
//                        }
//                        else if (postedFile.ContentLength > maxContentLength)
//                        {
//                            var message = $"Please Upload a file up to {maxSize} MB.";
//                            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, message);
//                        }
//                        else
//                        {
//                            var sysFile = new SystemFile()
//                            {
//                                CreatedBy = User.Identity.Name,
//                                CreatedOn = DateTime.Now,
//                                Status = (int)GeneralEnums.StatusEnum.Active,
//                                TypeId = (int)GeneralEnums.FileEnum.File,
//                                FileUrl = string.Empty,
//                                ModifiedBy = User.Identity.Name,
//                                ModifiedOn = DateTime.Now
//                            };
//                            _db.SystemFiles.Add(sysFile);
//                            _db.SaveChanges();
//                            var sysFileTrans = new SystemFileTranslation()
//                            {
//                                Description = string.Empty,
//                                DisplayName = string.Empty,
//                                SystemFileId = sysFile.Id,
//                                IsDefault = true,
//                                LanguageId = CultureHelper.GetDefaultLanguageId(),
//                                AltText = string.Empty
//                            };
//                            _db.SystemFileTranslations.Add(sysFileTrans);
//                            _db.SaveChanges();
//                            var webiste = SettingHelper.GetOrCreate(Constants.SystemSettings.WebsiteUrl,
//                                "http://localhost:54222").Value;

//                            sysFile.FileUrl = $"{webiste}/Document/{sysFile.TypeId}/{sysFile.Id}{extension}";
//                            _db.Entry(sysFile).State = EntityState.Modified;
//                            _db.SaveChanges();
//                            var filePath = HttpContext.Current.Server.MapPath($"~/Document/{sysFile.TypeId}/{sysFile.Id}{extension}");
//                            postedFile.SaveAs(filePath);
//                            response.Files.Add(new FileResponse()
//                            {
//                                CreatedOn = sysFile.CreatedOn,
//                                Id = sysFile.Id,
//                                FileUrl = sysFile.FileUrl,
//                                TypeId = sysFile.TypeId
//                            });
//                            _db.SystemCaseAttachments.Add(new SystemCaseAttachment()
//                            {
//                                CaseId = sysCase.Id,
//                                FileId = sysFile.Id
//                            });
//                        }
//                    }
//                }

//                _db.SaveChanges();


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
//                    var newCaseEnumValue = (int)GeneralEnums.StateEnum.New;

//                    if (sysCase.TypeId == (int)GeneralEnums.CasesType.Tenders)
//                    {
//                        newCaseEnumValue = (int)GeneralEnums.StateEnum.TenderNew;
//                    }
//                    if (sysCase.TypeId == (int)GeneralEnums.CasesType.Jobs)
//                    {
//                        newCaseEnumValue = (int)GeneralEnums.StateEnum.JobNew;
//                    }

//                    var assigneeUserId = WorkflowHelper.GetAssignedUser((int)GeneralEnums.StateEnum.Na,
//                        newCaseEnumValue, (int)sysCase.CategoryId);
//                    if (assigneeUserId != 0)
//                    {
//                        sysCase.AssigneeId = assigneeUserId;
//                        _db.Entry(sysCase).State = EntityState.Modified;
//                        _db.SaveChanges();
//                        var assigneeUser = _db.UserProfiles.Find(assigneeUserId);
//                        if (assigneeUser != null)
//                        {
//                            var complaintWorkflow = new Complaint(sysCase, assigneeUser);
//                            complaintWorkflow.Assign(assigneeUser.Email);
//                        }

//                        #region SMS and Email

//                        var smsTemplateEnumValue = SMSHelper.GetSMSStatusTemplateEnumValue(newCaseEnumValue);

//                        if (smsTemplateEnumValue.Count > 0)
//                        {
//                            try
//                            {
//                                SMSHelper.SendSMSTemplate(smsTemplateEnumValue, User, sysCase.CreatedBy, assigneeUserId, sysCase.Id);
//                            }
//                            catch (Exception ex)
//                            {
//                                LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms for case id {sysCase.Id} (API)");
//                            }
//                            try
//                            {
//                                var obj = new EmailHelper();
//                                obj.SendSMSTemplateAsEmail(smsTemplateEnumValue, sysCase, User);
//                            }
//                            catch (Exception ex)
//                            {
//                                LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms template as email for case id {sysCase.Id} (API)");
//                            }
//                        }

//                        #endregion
//                    }
//                }

                
//                return Request.CreateResponse(HttpStatusCode.OK, response);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorPostComplaints);
//                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, Constants.Errors.Apis.ErrorPostComplaints);
//            }
//        }

//        [Route("addcomplaintwithimagespathes")]
//        [AllowAnonymous]
//        public HttpResponseMessage AddComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == complaint.CreatedBy);
//                if (user == null || user.Status != (int)GeneralEnums.StatusEnum.Active)
//                {
//                    return null;
//                }
//                int? caseType = null;
//                if (!complaint.CategoryId.IsNullOrWhiteSpace())
//                {
//                    caseType = int.Parse(complaint.CategoryId ?? "");
//                }
//                var sysCase = new SystemCas()
//                {
//                    Description = complaint.Description,
//                    CategoryId = caseType,
//                    CreatedBy = complaint.CreatedBy,
//                    CreatedOn = DateTime.Now,
//                    Status = (int)GeneralEnums.StatusEnum.Active,
//                    Title = complaint.Title,
//                    Address = complaint.Address,
//                    Location = complaint.Location,
//                    FormId = complaint.FormId,
//                    FormName = complaint.FormName,
//                    UniqueId = Guid.NewGuid(),
//                    TypeId = complaint.TypeId,
//                    PriorityId = complaint.PriorityId,
//                    SeverityId = complaint.SeverityId,
//                    PriorityValue = complaint.PriorityValue,
//                    SeverityValue = complaint.SeverityValue,
//                    Tags = complaint.Tags
//                };
//                _db.SystemCases.Add(sysCase);
//                _db.SaveChanges();
//                #region Add state && assignee

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

//                if (sysCase.CategoryId != null)
//                {
//                    var newCaseEnumValue = (int)GeneralEnums.StateEnum.New;

//                    if (sysCase.TypeId == (int)GeneralEnums.CasesType.Tenders)
//                    {
//                        newCaseEnumValue = (int)GeneralEnums.StateEnum.TenderNew;
//                    }
//                    if (sysCase.TypeId == (int)GeneralEnums.CasesType.Jobs)
//                    {
//                        newCaseEnumValue = (int)GeneralEnums.StateEnum.JobNew;
//                    }

//                    var assigneeUserId = WorkflowHelper.GetAssignedUser((int)GeneralEnums.StateEnum.Na,
//                        newCaseEnumValue, (int)sysCase.CategoryId);
//                    if (assigneeUserId != 0)
//                    {
//                        sysCase.AssigneeId = assigneeUserId;
//                        _db.Entry(sysCase).State = EntityState.Modified;
//                        _db.SaveChanges();
//                        var assigneeUser = _db.UserProfiles.Find(assigneeUserId);
//                        if (assigneeUser != null)
//                        {
//                            var complaintWorkflow = new Complaint(sysCase, assigneeUser);
//                            complaintWorkflow.Assign(assigneeUser.Email);
//                        }

//                        #region SMS and Email

//                        var smsTemplateEnumValue = SMSHelper.GetSMSStatusTemplateEnumValue(newCaseEnumValue);

//                        if (smsTemplateEnumValue.Count > 0)
//                        {
//                            try
//                            {
//                                SMSHelper.SendSMSTemplate(smsTemplateEnumValue, User, sysCase.CreatedBy, assigneeUserId, sysCase.Id);
//                            }
//                            catch (Exception ex)
//                            {
//                                LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms for case id {sysCase.Id} (API)");
//                            }
//                            try
//                            {
//                                var obj = new EmailHelper();
//                                obj.SendSMSTemplateAsEmail(smsTemplateEnumValue, sysCase, User);
//                            }
//                            catch (Exception ex)
//                            {
//                                LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms template as email for case id {sysCase.Id} (API)");
//                            }
//                        }

//                        #endregion
//                    }
//                }

//                _db.SaveChanges();
//                #endregion
//                var response = new CaseViewModel()
//                {
//                    Description = sysCase.Description,
//                    AssigneeId = sysCase.AssigneeId,
//                    CategoryId = sysCase.CategoryId,
//                    CreatedBy = sysCase.CreatedBy,
//                    CreatedOn = sysCase.CreatedOn,
//                    PriorityId = sysCase.PriorityId,
//                    SeverityId = sysCase.SeverityId,
//                    SeverityValue = sysCase.SeverityValue,
//                    PriorityValue = sysCase.PriorityValue,
//                    Status = sysCase.Status,
//                    TypeId = sysCase.TypeId,
//                    Id = sysCase.Id,
//                    Address = sysCase.Address,
//                    Location = sysCase.Location,
//                    Tags = sysCase.Tags,
//                    Title = sysCase.Title,
//                    UniqueId = sysCase.UniqueId,
//                    FlowStatus = _db.StateHistories.OrderByDescending(r => r.Id)
//                        .FirstOrDefault(r => r.CaseId == sysCase.Id)?.CurrentState
//                };
//                response.FlowStatusName = response.FlowStatus != null
//                    ? LookupHelper.GetLookupDetailsById((int)response.FlowStatus, null)?.Name
//                    : string.Empty;
//                if (!complaint.FilePathes.IsNullOrWhiteSpace())
//                {
//                    foreach (var filePath in complaint.FilePathes.Split(',').Where(r => !r.IsNullOrWhiteSpace()))
//                    {
//                        var sysFile = new SystemFile()
//                        {
//                            CreatedBy = complaint.CreatedBy,
//                            CreatedOn = DateTime.Now,
//                            Status = (int)GeneralEnums.StatusEnum.Active,
//                            TypeId = (int)GeneralEnums.FileEnum.File,
//                            FileUrl = filePath,
//                            ModifiedBy = complaint.CreatedBy,
//                            ModifiedOn = DateTime.Now
//                        };
//                        _db.SystemFiles.Add(sysFile);
//                        _db.SaveChanges();
//                        var sysFileTrans = new SystemFileTranslation()
//                        {
//                            Description = string.Empty,
//                            DisplayName = string.Empty,
//                            SystemFileId = sysFile.Id,
//                            IsDefault = true,
//                            LanguageId = CultureHelper.GetDefaultLanguageId(),
//                            AltText = string.Empty
//                        };
//                        _db.SystemFileTranslations.Add(sysFileTrans);
//                        _db.SaveChanges();

//                        response.Files.Add(new FileResponse()
//                        {
//                            CreatedOn = sysFile.CreatedOn,
//                            Id = sysFile.Id,
//                            FileUrl = sysFile.FileUrl,
//                            TypeId = sysFile.TypeId
//                        });
//                        _db.SystemCaseAttachments.Add(new SystemCaseAttachment()
//                        {
//                            CaseId = sysCase.Id,
//                            FileId = sysFile.Id
//                        });
//                    }
//                }

//                _db.SaveChanges();
//                return Request.CreateResponse(HttpStatusCode.OK, response);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorPostComplaints);
//                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, Constants.Errors.Apis.ErrorPostComplaints);
//            }
//        }

//        [Route("updatecomplaintwithimagespathes")]
//        [AllowAnonymous]
//        public HttpResponseMessage UpdateComplaintWithImagesPathes(AddComplaintWithImagesPathesRequest complaint)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var sysCase = _db.SystemCases.Find(complaint.Id);
//                if (sysCase == null)
//                {
//                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, Constants.Errors.Apis.ErrorPleaseUploadComplaintData);
//                }
//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == sysCase.CreatedBy);
//                if (user == null || user.Status != (int)GeneralEnums.StatusEnum.Active)
//                {
//                    return null;
//                }
//                int? caseType = null;
//                if (!complaint.CategoryId.IsNullOrWhiteSpace())
//                {
//                    caseType = int.Parse(complaint.CategoryId ?? "");
//                }

//                sysCase.Description = complaint.Description;
//                sysCase.AssigneeId = complaint.AssigneeId;
//                sysCase.CategoryId = caseType;
//                sysCase.PriorityId = complaint.PriorityId;
//                sysCase.SeverityId = complaint.SeverityId;
//                sysCase.PriorityValue = complaint.PriorityValue;
//                sysCase.SeverityValue = complaint.SeverityValue;
//                sysCase.Status = complaint.Status;
//                sysCase.Tags = complaint.Tags;
//                sysCase.Title = complaint.Title;
//                sysCase.Address = complaint.Address;
//                sysCase.Location = complaint.Location;
//                _db.Entry(sysCase).State = EntityState.Modified;
//                _db.SaveChanges();

//                var response = new CaseViewModel()
//                {
//                    Description = sysCase.Description,
//                    AssigneeId = sysCase.AssigneeId,
//                    CategoryId = sysCase.CategoryId,
//                    CreatedBy = sysCase.CreatedBy,
//                    CreatedOn = sysCase.CreatedOn,
//                    PriorityId = sysCase.PriorityId,
//                    SeverityId = sysCase.SeverityId,
//                    SeverityValue = sysCase.SeverityValue,
//                    PriorityValue = sysCase.PriorityValue,
//                    Status = sysCase.Status,
//                    Id = sysCase.Id,
//                    TypeId = sysCase.TypeId,
//                    Tags = sysCase.Tags,
//                    Address = sysCase.Address,
//                    Location = sysCase.Location,
//                    Title = sysCase.Title,
//                    UniqueId = sysCase.UniqueId,
//                    FlowStatus = _db.StateHistories.OrderByDescending(r => r.Id)
//                        .FirstOrDefault(r => r.CaseId == sysCase.Id)?.CurrentState
//                };
//                response.FlowStatusName = response.FlowStatus != null
//                    ? LookupHelper.GetLookupDetailsById((int)response.FlowStatus, null)?.Name
//                    : string.Empty;
//                if (!complaint.FilePathes.IsNullOrWhiteSpace())
//                {
//                    foreach (var filePath in complaint.FilePathes.Split(',').Where(r => !r.IsNullOrWhiteSpace()))
//                    {
//                        var sysFile = new SystemFile()
//                        {
//                            CreatedBy = complaint.CreatedBy,
//                            CreatedOn = DateTime.Now,
//                            Status = (int)GeneralEnums.StatusEnum.Active,
//                            TypeId = (int)GeneralEnums.FileEnum.File,
//                            FileUrl = filePath,
//                            ModifiedBy = complaint.CreatedBy,
//                            ModifiedOn = DateTime.Now
//                        };
//                        _db.SystemFiles.Add(sysFile);
//                        _db.SaveChanges();
//                        var sysFileTrans = new SystemFileTranslation()
//                        {
//                            Description = string.Empty,
//                            DisplayName = string.Empty,
//                            SystemFileId = sysFile.Id,
//                            IsDefault = true,
//                            LanguageId = CultureHelper.GetDefaultLanguageId(),
//                            AltText = string.Empty
//                        };
//                        _db.SystemFileTranslations.Add(sysFileTrans);
//                        _db.SaveChanges();

//                        response.Files.Add(new FileResponse()
//                        {
//                            CreatedOn = sysFile.CreatedOn,
//                            Id = sysFile.Id,
//                            FileUrl = sysFile.FileUrl,
//                            TypeId = sysFile.TypeId
//                        });
//                        _db.SystemCaseAttachments.Add(new SystemCaseAttachment()
//                        {
//                            CaseId = sysCase.Id,
//                            FileId = sysFile.Id
//                        });
//                    }
//                }


//                _db.SaveChanges();
//                return Request.CreateResponse(HttpStatusCode.OK, response);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorPostComplaints);
//                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, Constants.Errors.Apis.ErrorPostComplaints);
//            }
//        }

//        [Route("updatecomplaint")]
//        [AllowAnonymous]
//        public HttpResponseMessage UpdateComplaint(int id)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;

//                var jsonStr = httpRequest.Form.AllKeys.Any(r => r == "ComplaintInfo") ? httpRequest.Form["ComplaintInfo"] : string.Empty;
//                if (jsonStr.IsNullOrWhiteSpace())
//                {
//                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, Constants.Errors.Apis.ErrorPleaseUploadComplaintData);
//                }
//                var complaint = JsonConvert.DeserializeObject<CaseViewModel>(jsonStr);

//                var sysCase = _db.SystemCases.Find(id);
//                if (sysCase == null)
//                {
//                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, Constants.Errors.Apis.ErrorPleaseUploadComplaintData);
//                }
//                sysCase.Description = complaint.Description;
//                sysCase.AssigneeId = complaint.AssigneeId;
//                sysCase.CategoryId = complaint.CategoryId;
//                sysCase.CreatedBy = complaint.CreatedBy;
//                sysCase.PriorityId = complaint.PriorityId;
//                sysCase.SeverityId = complaint.SeverityId;
//                sysCase.PriorityValue = complaint.PriorityValue;
//                sysCase.SeverityValue = complaint.SeverityValue;
//                sysCase.Status = complaint.Status;
//                sysCase.Tags = complaint.Tags;
//                sysCase.Title = complaint.Title;
//                sysCase.Address = complaint.Address;
//                sysCase.Location = complaint.Location;
//                _db.Entry(sysCase).State = EntityState.Modified;
//                _db.SaveChanges();
//                complaint.UniqueId = sysCase.UniqueId;
//                complaint.TypeId = sysCase.TypeId;
//                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
//                var langId = lang == "ar"
//                    ? (int)GeneralEnums.LanguageEnum.Arabic
//                    : (int)GeneralEnums.LanguageEnum.English;
//                complaint.Comments = sysCase.SysCaseComments.OrderByDescending(r => r.Id).ToList().Select(c => new CommentsViewModel()
//                {
//                    Id = c.Id,
//                    Comment = c.Comment,
//                    CreatedBy = LanguageFallbackHelper.GetUserProfileByUsername(c.CreatedBy, langId)?.FullName ?? "UnKnown",
//                    CaseId = c.CaseId,
//                    CaseName = c.SystemCas.Title,
//                    Status = c.Status,
//                    CreatedOn = c.CreatedOn
//                }).ToList();
//                complaint.FlowStatus = _db.StateHistories.OrderByDescending(r => r.Id)
//                    .FirstOrDefault(r => r.CaseId == sysCase.Id)?.CurrentState;
//                complaint.AssigneeName = sysCase.AssigneeId != null
//                    ? LanguageFallbackHelper
//                          .GetUserProfile((int)sysCase.AssigneeId, CultureHelper.GetDefaultLanguageId())?.FullName ??
//                      string.Empty
//                    : string.Empty;
//                complaint.CategoryName = sysCase.CategoryId != null
//                    ? LookupHelper.GetLookupDetailsById((int)sysCase.CategoryId, httpRequest.Cookies["_culture"])
//                          ?.Name ?? string.Empty
//                    : string.Empty;
//                complaint.PriorityName = sysCase.PriorityId != null
//                    ? LookupHelper.GetLookupDetailsById((int)sysCase.PriorityId, httpRequest.Cookies["_culture"])
//                          ?.Name ?? string.Empty
//                    : string.Empty;
//                complaint.SeverityName = sysCase.SeverityId != null
//                    ? LookupHelper.GetLookupDetailsById((int)sysCase.SeverityId, httpRequest.Cookies["_culture"])
//                          ?.Name ?? string.Empty
//                    : string.Empty;
//                foreach (string file in httpRequest.Files)
//                {
//                    var postedFile = httpRequest.Files[file];
//                    if (postedFile != null && postedFile.ContentLength > 0)
//                    {
//                        var maxSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.FileMaxSize, "5").Value);
//                        int maxContentLength = 1024 * 1024 * maxSize;  //Size = maxSize MB  
//                        var allowedFilesTypes = SettingHelper.GetOrCreate(Constants.SystemSettings.AllowedFilesForUpload,
//                            ".jpg,.gif,.png,.txt,.pdf").Value;
//                        IList<string> allowedFileExtensions = allowedFilesTypes.Split(',').ToList();
//                        var ext = postedFile.FileName.Substring(postedFile.FileName.LastIndexOf('.'));
//                        var extension = ext.ToLower();
//                        if (!allowedFileExtensions.Contains(extension))
//                        {
//                            var message = $"Please Upload file of type {allowedFilesTypes}";
//                            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, message);
//                        }
//                        else if (postedFile.ContentLength > maxContentLength)
//                        {
//                            var message = $"Please Upload a file up to {maxSize} MB.";
//                            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, message);
//                        }
//                        else
//                        {
//                            var sysFile = new SystemFile()
//                            {
//                                CreatedBy = User.Identity.Name,
//                                CreatedOn = DateTime.Now,
//                                Status = (int)GeneralEnums.StatusEnum.Active,
//                                TypeId = (int)GeneralEnums.FileEnum.File,
//                                FileUrl = string.Empty,
//                                ModifiedBy = User.Identity.Name,
//                                ModifiedOn = DateTime.Now
//                            };
//                            _db.SystemFiles.Add(sysFile);
//                            _db.SaveChanges();
//                            var sysFileTrans = new SystemFileTranslation()
//                            {
//                                Description = string.Empty,
//                                DisplayName = string.Empty,
//                                SystemFileId = sysFile.Id,
//                                IsDefault = true,
//                                LanguageId = CultureHelper.GetDefaultLanguageId(),
//                                AltText = string.Empty
//                            };
//                            _db.SystemFileTranslations.Add(sysFileTrans);
//                            _db.SaveChanges();
//                            var webiste = SettingHelper.GetOrCreate(Constants.SystemSettings.WebsiteUrl,
//                                "http://localhost:54222").Value;

//                            sysFile.FileUrl = $"{webiste}/Document/{sysFile.TypeId}/{sysFile.Id}{extension}";
//                            _db.Entry(sysFile).State = EntityState.Modified;
//                            _db.SaveChanges();
//                            var filePath = HttpContext.Current.Server.MapPath($"~/Document/{sysFile.TypeId}/{sysFile.Id}{extension}");
//                            postedFile.SaveAs(filePath);
//                            complaint.Files.Add(new FileResponse()
//                            {
//                                CreatedOn = sysFile.CreatedOn,
//                                Id = sysFile.Id,
//                                FileUrl = sysFile.FileUrl
//                            });
//                            _db.SystemCaseAttachments.Add(new SystemCaseAttachment()
//                            {
//                                CaseId = sysCase.Id,
//                                FileId = sysFile.Id
//                            });
//                        }
//                    }
//                }

//                _db.SaveChanges();
//                return Request.CreateResponse(HttpStatusCode.Created, complaint);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorPostComplaints);
//                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, Constants.Errors.Apis.ErrorPostComplaints);
//            }
//        }

//        [Route("getcomplaints")]
//        [AllowAnonymous]
//        public IHttpActionResult GetComplaints(string username)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;
//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == username);
//                if (user == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorUserNotfound
//                    });
//                }
//                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
//                var langId = lang == "ar"
//                    ? (int)GeneralEnums.LanguageEnum.Arabic
//                    : (int)GeneralEnums.LanguageEnum.English;
//                var cases = _db.SystemCases.Where(r =>
//                    r.Status != (int)GeneralEnums.StatusEnum.Deleted &&
//                    (r.CreatedBy == username || r.AssigneeId == user.Id)).ToList();
//                var caseList = new List<CaseViewModel>();
//                foreach (var x in cases)
//                {
//                    var cas = new CaseViewModel()
//                    {
//                        Id = x.Id,
//                        Status = x.Status,
//                        Description = x.Description,
//                        CreatedOn = x.CreatedOn,
//                        DeletedOn = x.DeletedOn,
//                        CreatedBy = x.CreatedBy,
//                        TypeId = x.TypeId,
//                        Tags = x.Tags,
//                        Title = x.Title,
//                        Address = x.Address,
//                        Location = x.Location,
//                        AssigneeId = x.AssigneeId,
//                        AssigneeName = x.AssigneeId != null
//                            ? LanguageFallbackHelper.GetUserProfile((int)x.AssigneeId, langId)?.FullName ??
//                              string.Empty
//                            : string.Empty,
//                        CategoryId = x.CategoryId,
//                        CategoryName =
//                            x.CategoryId != null
//                                ? LookupHelper.GetLookupDetailsById((int)x.CategoryId, httpRequest.Cookies["_culture"])
//                                      ?.Name ?? string.Empty
//                                : string.Empty,
//                        PriorityId = x.PriorityId,
//                        PriorityName =
//                            x.PriorityId != null
//                                ? LookupHelper.GetLookupDetailsById((int)x.PriorityId, httpRequest.Cookies["_culture"])
//                                      ?.Name ?? string.Empty
//                                : string.Empty,
//                        SeverityId = x.SeverityId,
//                        SeverityName =
//                            x.SeverityId != null
//                                ? LookupHelper.GetLookupDetailsById((int)x.SeverityId, httpRequest.Cookies["_culture"])
//                                      ?.Name ?? string.Empty
//                                : string.Empty,
//                        UniqueId = x.UniqueId,
//                        SeverityValue = x.SeverityValue,
//                        PriorityValue = x.PriorityValue,
//                        Files = x.SystemCaseAttachments.Select(r => new FileResponse()
//                        {
//                            Id = r.Id,
//                            DisplayName = r.SystemFile.SystemFileTranslations.FirstOrDefault()?.DisplayName,
//                            FileUrl = r.SystemFile.FileUrl
//                        }).ToList(),
//                        Comments = x.SysCaseComments.OrderByDescending(r => r.Id).ToList().Select(c => new CommentsViewModel()
//                        {
//                            Id = c.Id,
//                            Comment = c.Comment,
//                            CreatedBy = LanguageFallbackHelper.GetUserProfileByUsername(c.CreatedBy, langId)?.FullName ?? "UnKnown",
//                            CaseId = c.CaseId,
//                            CaseName = c.SystemCas.Title,
//                            Status = c.Status,
//                            CreatedOn = c.CreatedOn
//                        }).ToList(),
//                        FlowStatus = _db.StateHistories.OrderByDescending(r => r.Id)
//                            .FirstOrDefault(r => r.CaseId == x.Id)?.CurrentState
//                    };
//                    cas.FlowStatusName = cas.FlowStatus != null
//                        ? LookupHelper.GetLookupDetailsById((int)cas.FlowStatus, httpRequest.Cookies["_culture"])?.Name
//                        : string.Empty;
//                    caseList.Add(cas);
//                }

//                return Ok(caseList.OrderByDescending(r => r.Id).ToList());
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorGetComplaints);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorGetComplaints
//                });
//            }
//        }

//        [Route("getcomplaintsbytype")]
//        [AllowAnonymous]
//        public IHttpActionResult GetComplaintsByType(string username, int typeId)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;
//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == username);
//                if (user == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorUserNotfound
//                    });
//                }
//                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
//                var langId = lang == "ar"
//                    ? (int)GeneralEnums.LanguageEnum.Arabic
//                    : (int)GeneralEnums.LanguageEnum.English;
//                var cases = _db.SystemCases.Where(r =>
//                    r.Status != (int)GeneralEnums.StatusEnum.Deleted && r.TypeId == typeId &&
//                    (r.CreatedBy == username || r.AssigneeId == user.Id)).ToList();
//                var caseList = new List<CaseViewModel>();
//                foreach (var x in cases)
//                {
//                    var cas = new CaseViewModel()
//                    {
//                        Id = x.Id,
//                        Status = x.Status,
//                        Description = x.Description,
//                        CreatedOn = x.CreatedOn,
//                        DeletedOn = x.DeletedOn,
//                        CreatedBy = x.CreatedBy,
//                        Tags = x.Tags,
//                        TypeId = x.TypeId,
//                        Title = x.Title,
//                        Address = x.Address,
//                        Location = x.Location,
//                        AssigneeId = x.AssigneeId,
//                        AssigneeName = x.AssigneeId != null
//                            ? LanguageFallbackHelper.GetUserProfile((int)x.AssigneeId, langId)?.FullName ??
//                              string.Empty
//                            : string.Empty,
//                        CategoryId = x.CategoryId,
//                        CategoryName =
//                            x.CategoryId != null
//                                ? LookupHelper.GetLookupDetailsById((int)x.CategoryId, httpRequest.Cookies["_culture"])
//                                      ?.Name ?? string.Empty
//                                : string.Empty,
//                        PriorityId = x.PriorityId,
//                        PriorityName =
//                            x.PriorityId != null
//                                ? LookupHelper.GetLookupDetailsById((int)x.PriorityId, httpRequest.Cookies["_culture"])
//                                      ?.Name ?? string.Empty
//                                : string.Empty,
//                        SeverityId = x.SeverityId,
//                        SeverityValue = x.SeverityValue,
//                        PriorityValue = x.PriorityValue,
//                        SeverityName =
//                            x.SeverityId != null
//                                ? LookupHelper.GetLookupDetailsById((int)x.SeverityId, httpRequest.Cookies["_culture"])
//                                      ?.Name ?? string.Empty
//                                : string.Empty,
//                        UniqueId = x.UniqueId,
//                        Files = x.SystemCaseAttachments.Select(r => new FileResponse()
//                        {
//                            Id = r.SystemFile.Id,
//                            DisplayName = r.SystemFile.SystemFileTranslations.FirstOrDefault()?.DisplayName,
//                            FileUrl = r.SystemFile.FileUrl
//                        }).ToList(),
//                        Comments = x.SysCaseComments.OrderByDescending(r => r.Id).ToList().Select(c => new CommentsViewModel()
//                        {
//                            Id = c.Id,
//                            Comment = c.Comment,
//                            CreatedBy = LanguageFallbackHelper.GetUserProfileByUsername(c.CreatedBy, langId)?.FullName ?? "UnKnown",
//                            CaseId = c.CaseId,
//                            CaseName = c.SystemCas.Title,
//                            Status = c.Status,
//                            CreatedOn = c.CreatedOn
//                        }).ToList(),
//                        FlowStatus = _db.StateHistories.OrderByDescending(r => r.Id)
//                            .FirstOrDefault(r => r.CaseId == x.Id)?.CurrentState
//                    };
//                    cas.FlowStatusName = cas.FlowStatus != null
//                        ? LookupHelper.GetLookupDetailsById((int)cas.FlowStatus, httpRequest.Cookies["_culture"])?.Name
//                        : string.Empty;
//                    caseList.Add(cas);
//                }

//                return Ok(caseList);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorGetComplaints);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorGetComplaints
//                });
//            }
//        }

//        [Route("getcomplaint")]
//        [AllowAnonymous]
//        public IHttpActionResult GetComplaint(int id, string username)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;
//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == username);
//                if (user == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorUserNotfound
//                    });
//                }
//                var sysCase = _db.SystemCases.Find(id);
//                if (sysCase == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorComplaintNotfound
//                    });
//                }
//                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
//                var langId = lang == "ar"
//                    ? (int)GeneralEnums.LanguageEnum.Arabic
//                    : (int)GeneralEnums.LanguageEnum.English;
//                var cas = new CaseViewModel()
//                {
//                    CreatedBy = sysCase.CreatedBy,
//                    CreatedOn = sysCase.CreatedOn,
//                    Status = sysCase.Status,
//                    Description = sysCase.Description,
//                    Id = sysCase.Id,
//                    Tags = sysCase.Tags,
//                    Title = sysCase.Title,
//                    Address = sysCase.Address,
//                    Location = sysCase.Location,
//                    AssigneeId = sysCase.AssigneeId,
//                    AssigneeName = sysCase.AssigneeId != null ?
//                        LanguageFallbackHelper.GetUserProfile((int)sysCase.AssigneeId, langId)?.FullName ??
//                        string.Empty : string.Empty,
//                    CategoryId = sysCase.CategoryId,
//                    CategoryName = sysCase.CategoryId != null ? LookupHelper.GetLookupDetailsById((int)sysCase.CategoryId, httpRequest.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                    PriorityId = sysCase.PriorityId,
//                    PriorityName = sysCase.PriorityId != null ? LookupHelper.GetLookupDetailsById((int)sysCase.PriorityId, httpRequest.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                    SeverityId = sysCase.SeverityId,
//                    SeverityName = sysCase.SeverityId != null ? LookupHelper.GetLookupDetailsById((int)sysCase.SeverityId, httpRequest.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
//                    UniqueId = sysCase.UniqueId,
//                    Files = sysCase.SystemCaseAttachments.Select(r => new FileResponse()
//                    {
//                        Id = r.Id,
//                        DisplayName = r.SystemFile.SystemFileTranslations.FirstOrDefault()?.DisplayName,
//                        FileUrl = r.SystemFile.FileUrl
//                    }).ToList(),
//                    Comments = sysCase.SysCaseComments.OrderByDescending(r => r.Id).ToList().Select(c => new CommentsViewModel()
//                    {
//                        Id = c.Id,
//                        Comment = c.Comment,
//                        CreatedBy = LanguageFallbackHelper.GetUserProfileByUsername(c.CreatedBy, langId)?.FullName ?? "UnKnown",
//                        CaseId = c.CaseId,
//                        CaseName = c.SystemCas.Title,
//                        Status = c.Status,
//                        CreatedOn = c.CreatedOn
//                    }).ToList(),
//                    SeverityValue = sysCase.SeverityValue,
//                    PriorityValue = sysCase.PriorityValue,
//                    FlowStatus = _db.StateHistories.OrderByDescending(r => r.Id).FirstOrDefault(r => r.CaseId == sysCase.Id)?.CurrentState
//                };
//                return Ok(cas);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorGetComplaint);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorGetComplaint
//                });
//            }
//        }

//        [Route("deletecomplaint")]
//        [AllowAnonymous]
//        public IHttpActionResult DeleteComplaint(int id, string username)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;
//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == username);
//                if (user == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorUserNotfound
//                    });
//                }
//                var sysCase = _db.SystemCases.Find(id);
//                if (sysCase == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorComplaintNotfound
//                    });
//                }

//                sysCase.Status = (int)GeneralEnums.StatusEnum.Deleted;
//                _db.Entry(sysCase).State = EntityState.Modified;
//                _db.SaveChanges();

//                return Ok();
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorDeleteComplaint);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorDeleteComplaint
//                });
//            }
//        }

//        [Route("deletecomplaintattachment")]
//        [AllowAnonymous]
//        public IHttpActionResult DeleteComplaintAttachment(int id, string username)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;
//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == username);
//                if (user == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorUserNotfound
//                    });
//                }
//                var attchement = _db.SystemCaseAttachments.Find(id);
//                if (attchement == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorComplaintNotfound
//                    });
//                }

//                _db.SystemCaseAttachments.Remove(attchement);
//                _db.SaveChanges();

//                return Ok();
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorDeleteComplaintAttachment);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorDeleteComplaintAttachment
//                });
//            }
//        }

//        [Route("addcomplaintcomment")]
//        [AllowAnonymous]
//        public IHttpActionResult AddComplaintComment(CommentsViewModel comment)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var com = new SysCaseComment()
//                {
//                    CreatedBy = comment.CreatedBy,
//                    Status = (int)GeneralEnums.StatusEnum.Active,
//                    CaseId = comment.CaseId,
//                    Comment = comment.Comment,
//                    CreatedOn = DateTime.Now
//                };
//                _db.SysCaseComments.Add(com);
//                _db.SaveChanges();
//                comment.Id = com.Id;
//                return Ok(comment);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorAddComplaintComment);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorAddComplaintComment
//                });
//            }
//        }

//        [Route("addcategory")]
//        [AllowAnonymous]
//        public IHttpActionResult AddCategory(DetailsLookupViewModel category)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
//                var languageId = lang == "ar"
//                    ? (int)GeneralEnums.LanguageEnum.Arabic
//                    : (int)GeneralEnums.LanguageEnum.English;

//                var detailsLookup = new DetailsLookup
//                {
//                    CreatedOn = DateTime.Now,
//                    CreatedBy = User.Identity.Name,
//                    Status = (int)GeneralEnums.StatusEnum.Active,
//                    MasterId = (int)GeneralEnums.MasterLookupEnums.CaseCategory,


//                };
//                _db.DetailsLookups.Add(detailsLookup);
//                _db.SaveChanges();

//                var detailsLookupTran = new DetailsLookupTranslation()
//                {
//                    Value = category.Name,
//                    LanguageId = languageId,
//                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
//                    DetailsLookupId = detailsLookup.Id,

//                };
//                _db.DetailsLookupTranslations.Add(detailsLookupTran);

//                if (!detailsLookupTran.IsDefault)
//                {

//                    var detailsLookupTran1 = new DetailsLookupTranslation()
//                    {
//                        Value = category.Name,
//                        LanguageId = CultureHelper.GetDefaultLanguageId(),
//                        IsDefault = true,
//                        DetailsLookupId = detailsLookup.Id
//                    };
//                    _db.DetailsLookupTranslations.Add(detailsLookupTran1);
//                }
//                _db.SaveChanges();

//                category.Id = detailsLookup.Id;
//                return Ok(category);

//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorAddCategory);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorAddCategory
//                });
//            }
//        }

//        [Route("deletecomplaintcomment")]
//        [AllowAnonymous]
//        public IHttpActionResult DeleteComplaintComment(int id, string username)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;
//                var user = _db.UserProfiles.FirstOrDefault(r => r.Username == username);
//                if (user == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorUserNotfound
//                    });
//                }
//                var sysCase = _db.SysCaseComments.Find(id);
//                if (sysCase == null)
//                {
//                    return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                    {
//                        StatusCode = HttpStatusCode.InternalServerError,
//                        Message = Constants.Errors.Apis.ErrorComplaintNotfound
//                    });
//                }

//                _db.SysCaseComments.Remove(sysCase);
//                _db.SaveChanges();

//                return Ok();
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorDeleteComplaintComment);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorDeleteComplaintComment
//                });
//            }
//        }


//        [Route("changecomplaintstate")]
//        [AllowAnonymous]
//        public IHttpActionResult ChangeComplaintState(int caseId, int stateId, int prevState)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var cas = _db.SystemCases.Find(caseId);
//                if (cas?.CategoryId != null)
//                {
//                    var user = _db.UserProfiles.FirstOrDefault(r => r.Username == User.Identity.Name);
//                    var assigneeUserId = WorkflowHelper.GetAssignedUser(prevState,
//                        stateId, (int)cas.CategoryId);
//                    if (assigneeUserId != 0 && assigneeUserId != cas.AssigneeId)
//                    {
//                        var complaintWorkflow = new Complaint(cas, user);
//                        complaintWorkflow.OnDeassigned();

//                        cas.AssigneeId = assigneeUserId;
//                        _db.Entry(cas).State = EntityState.Modified;
//                        _db.SaveChanges();

//                        switch (stateId)
//                        {
//                            case (int)GeneralEnums.StateEnum.New:
//                                complaintWorkflow.Assign(user.Email);
//                                break;
//                            case (int)GeneralEnums.StateEnum.Resolved:
//                                complaintWorkflow.Resolve();
//                                break;
//                            case (int)GeneralEnums.StateEnum.Rejected:
//                                complaintWorkflow.Reject();
//                                break;
//                            case (int)GeneralEnums.StateEnum.Duplicated:
//                                complaintWorkflow.Duplicate();
//                                break;
//                            case (int)GeneralEnums.StateEnum.Closed:
//                                complaintWorkflow.Close();
//                                break;
//                            case (int)GeneralEnums.StateEnum.InProgress:
//                                complaintWorkflow.Close();
//                                break;
//                        }

//                    }
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

//                #region SMS and Email

//                var smsTemplateEnumValue = SMSHelper.GetSMSStatusTemplateEnumValue(stateId);

//                if (smsTemplateEnumValue.Count > 0)
//                {
//                    try
//                    {
//                        SMSHelper.SendSMSTemplate(smsTemplateEnumValue, User, cas.CreatedBy, cas.AssigneeId.GetValueOrDefault(), cas.Id);
//                    }
//                    catch (Exception ex)
//                    {
//                        LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms for case id {cas.Id} (Update Status API)");
//                    }
//                    try
//                    {
//                        var obj = new EmailHelper();
//                        obj.SendSMSTemplateAsEmail(smsTemplateEnumValue, cas, User);
//                    }
//                    catch (Exception ex)
//                    {
//                        LogHelper.LogException(User.Identity.Name, ex, $"Error while sending sms template as email for case id {cas.Id} (Update Status API)");
//                    }
//                }

//                #endregion

//                return Ok();
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorChangeComplaintState);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorChangeComplaintState
//                });
//            }
//        }

//        [Route("getcustomercmsformbycustomeridandformsids")]
//        [AllowAnonymous]
//        [HttpPost]
//        public IHttpActionResult GetCustomerCmsFormByCustomerIdAndFormsIds(GetCustomerCmsFormByCustomerIdAndFormsIdsRequest request)
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;
//                var response = new List<GetCustomerCmsFormByCustomerIdAndFormsIdsResponse>();
//                foreach (var formId in request.CustomerCmsFormIdList.Split(','))
//                {
//                    var cas = _db.SystemCases.FirstOrDefault(r => r.FormId == formId);
//                    var status = _db.StateHistories.OrderByDescending(r => r.Id)
//                        .FirstOrDefault(r => r.CaseId == cas.Id);
//                    response.Add(new GetCustomerCmsFormByCustomerIdAndFormsIdsResponse()
//                    {
//                        FormId = formId,
//                        StatusId = status?.CurrentState ?? 0,
//                        StatusName = status?.CurrentState != null
//                ? LookupHelper.GetLookupDetailsById((int)status.CurrentState, httpRequest.Cookies["_culture"])?.Name : string.Empty
//                    });
//                }

//                return Ok(response);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorGetComplaint);
//                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
//                {
//                    StatusCode = HttpStatusCode.InternalServerError,
//                    Message = Constants.Errors.Apis.ErrorGetComplaint
//                });
//            }
//        }

//        [Route("postfile")]
//        [AllowAnonymous]
//        public HttpResponseMessage PostFile()
//        {
//            AuthenticationHelper.ApiAuthorizationCheck(Request);
//            try
//            {
//                var httpRequest = HttpContext.Current.Request;
//                if (httpRequest.Files.Count == 0)
//                {
//                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, Constants.Errors.Apis.ErrorPleaseUploadFile);
//                }
//                var sysFiles = new List<FileResponse>();
//                foreach (string file in httpRequest.Files)
//                {
//                    var postedFile = httpRequest.Files[file];
//                    if (postedFile != null && postedFile.ContentLength > 0)
//                    {
//                        var maxSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.FileMaxSize, "5").Value);
//                        int maxContentLength = 1024 * 1024 * maxSize;  //Size = maxSize MB  
//                        var allowedImagesTypes = SettingHelper.GetOrCreate(Constants.SystemSettings.AllowedFilesForUpload,
//                            ".jpg,.gif,.png").Value;
//                        IList<string> allowedFileExtensions = allowedImagesTypes.Split(',').ToList();
//                        var ext = postedFile.FileName.Substring(postedFile.FileName.LastIndexOf('.'));
//                        var extension = ext.ToLower();
//                        if (!allowedFileExtensions.Contains(extension))
//                        {
//                            var message = $"Please Upload file of type {allowedImagesTypes}";
//                            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, message);
//                        }
//                        else if (postedFile.ContentLength > maxContentLength)
//                        {
//                            var message = $"Please Upload a file up to {maxSize} MB.";
//                            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, message);
//                        }
//                        else
//                        {
//                            var fileType = (int)GeneralEnums.FileEnum.File;

//                            var sysFile = new SystemFile
//                            {
//                                CreatedBy = User.Identity.Name,
//                                CreatedOn = DateTime.Now,
//                                Status = (int)GeneralEnums.StatusEnum.Active,
//                                TypeId = fileType,
//                                FileUrl = string.Empty,
//                                ModifiedBy = User.Identity.Name,
//                                ModifiedOn = DateTime.Now
//                            };
//                            _db.SystemFiles.Add(sysFile);
//                            _db.SaveChanges();
//                            var setting =
//                                SettingHelper.GetOrCreate(Constants.SystemSettings.WebsiteUrl, "http://localhost:61712/");
//                            var url = $"{setting.Value}/Document/{fileType}/{sysFile.Id}{extension}";

//                            var filePath = HttpContext.Current.Server.MapPath($"~/Document/{fileType}/{sysFile.Id}{extension}");
//                            postedFile.SaveAs(filePath);
//                            sysFiles.Add(new FileResponse()
//                            {
//                                Id = sysFile.Id,
//                                CreatedOn = sysFile.CreatedOn,
//                                TypeId = sysFile.TypeId,
//                                FileUrl = url,
//                                StatusCode = HttpStatusCode.OK,
//                                Message = Constants.ApiMessages.Success
//                            });
//                            sysFile.FileUrl = url;
//                            _db.Entry(sysFile).State = EntityState.Modified;
//                            _db.SaveChanges();

//                            var sysFileTrans = new SystemFileTranslation()
//                            {
//                                Description = string.Empty,
//                                DisplayName = string.Empty,
//                                IsDefault = true,
//                                LanguageId = CultureHelper.GetDefaultLanguageId(),
//                                SystemFileId = sysFile.Id
//                            };
//                            _db.SystemFileTranslations.Add(sysFileTrans);
//                            _db.SaveChanges();

//                        }
//                    }
//                }
//                return Request.CreateResponse(HttpStatusCode.Created, sysFiles);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorUploadingfiles);
//                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, Constants.Errors.Apis.ErrorUploadingfiles);
//            }
//        }


//    }
//}
