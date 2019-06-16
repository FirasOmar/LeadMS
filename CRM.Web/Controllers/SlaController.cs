//using System;
//using System.Data.Entity;
//using System.Linq;
//using System.Web.Mvc;
//using CRM.Core;
//using CRM.Core.Helpers;
//using CRM.Core.SystemEnums;
//using CRM.DataEntity.Models;
//using CRM.Web.Filters;
//using CRM.Web.Helpers;
//using CRM.Web.Models;
//using PagedList;
//using Microsoft.Ajax.Utilities;

//namespace CRM.Web.Controllers
//{
//    public class SlaController : BaseController
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();
//        [CustomAuthentication(PageName = "Sla", PermissionKey = "View")]
//        public ActionResult Index(int? page, string searchText, int resetTo = 0)
//        {
//            if (resetTo == 1)
//            {
//                page = 1;
//            }

//            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

//            var slaForcurrentLan = _db.SlaTranslations
//                                  .Where(r => (r.LanguageId == currentLanguageId) &&
//                                 r.Sla.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(c => c.SlaId);
//            var slas = _db.SlaTranslations
//                          .Where(r => (r.IsDefault) &&
//                         r.Sla.Status != (int)GeneralEnums.StatusEnum.Deleted && !slaForcurrentLan.Contains(r.SlaId))
//                         .Union(
//                            _db.SlaTranslations
//                          .Where(r => r.LanguageId == currentLanguageId && r.Sla.Status != (int)GeneralEnums.StatusEnum.Deleted && slaForcurrentLan.Contains(r.SlaId)))
//                         .ToList();

//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                slas = slas.Where(r => (r.Name.Contains(searchText) || r.Description.Contains(searchText))).ToList();
//                ViewBag.searchText = searchText;
//            }
//            var result = slas.ToList().Select(x =>
//                   new SlaViewModel()
//                   {
//                       CreatedBy = x.Sla.CreatedBy,
//                       Status = x.Sla.Status,
//                       Id = x.SlaId,
//                       CreatedOn = x.Sla.CreatedOn,
//                       Name = x.Name,
//                       Description = x.Description,
//                       CcAssignee = x.Sla.CcAssignee,
//                       HoursPerState = x.Sla.HoursPerState,
//                       SendEmployee = x.Sla.Send_SMS_Employee.GetValueOrDefault(),
//                       SendCitizen = x.Sla.Send_SMS_Citizen.GetValueOrDefault(),
//                       NotificationCount = x.Sla.NotificationCount,
//                       NotifyBefore = x.Sla.NotifyBefore,
//                       PropogateToManager = x.Sla.PropogateToManager,
//                       WorkingDaysIncludingHolidays = x.Sla.WorkingDaysIncludingHolidays,
//                       IgnoredStates = _db.SlaIgnoredCaseStates.Where(s => s.SlaId == x.SlaId).ToList().Select(r => new DetailsLookupViewModel()
//                       {
//                           Id = r.IgnoredCaseStateId,
//                           Name = LookupHelper.GetLookupDetailsById(r.IgnoredCaseStateId, Request.Cookies["_culture"])?.Name
//                       }).ToList()
//                   });

//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);

//            return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Sla", PermissionKey = "Create")]
//        public JsonResult AddSla(SlaViewModel slaVm)
//        {

//            string customerId = null;
//            int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//            try
//            {
//                var sla = new Sla()
//                {
//                    CreatedBy = User.Identity.Name,
//                    Status = slaVm.Status,
//                    CreatedOn = DateTime.Now,
//                    CcAssignee = slaVm.CcAssignee,
//                    Send_SMS_Citizen = slaVm.SendCitizen,
//                    Send_SMS_Employee = slaVm.SendEmployee,
//                    HoursPerState = slaVm.HoursPerState,
//                    NotificationCount = slaVm.NotificationCount,
//                    NotifyBefore = slaVm.NotifyBefore,
//                    PropogateToManager = slaVm.PropogateToManager,
//                    WorkingDaysIncludingHolidays = slaVm.WorkingDaysIncludingHolidays
//                };
//                _db.Slas.Add(sla);
//                _db.SaveChanges();

//                var slaTrans = new SlaTranslation()
//                {
//                    Description = slaVm.Description,
//                    Name = slaVm.Name,
//                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
//                    LanguageId = languageId, // TODO: check if this the correct language or we should take it from the paramater
//                    SlaId = sla.Id
//                };
//                _db.SlaTranslations.Add(slaTrans);
//                if (!slaTrans.IsDefault)
//                {
//                    var slaTrans1 = new SlaTranslation()
//                    {
//                        Description = slaVm.Description ?? string.Empty,
//                        Name = slaVm.Name,
//                        IsDefault = true,
//                        LanguageId = CultureHelper.GetDefaultLanguageId(),
//                        SlaId = sla.Id

//                    };
//                    _db.SlaTranslations.Add(slaTrans1);
//                }

//                _db.SaveChanges();

//                return Json(sla, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new sla");
//                return null;
//            }
//        }
//        [HttpGet]
//        [CustomAuthentication(PageName = "Sla", PermissionKey = "Edit")]
//        public JsonResult EditSla(int id, int languageId)
//        {
//            try
//            {

//                var sla = _db.Slas.Find(id);
//                if (sla != null && sla.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    var slaTrans =
//                        _db.SlaTranslations.FirstOrDefault(r =>
//                            r.SlaId == id && r.LanguageId == languageId);
//                    if (slaTrans == null)
//                    {
//                        slaTrans = _db.SlaTranslations.FirstOrDefault(r =>
//                            r.SlaId == id && r.IsDefault);
//                    }
//                    var result = new SlaViewModel()
//                    {
//                        Id = slaTrans.SlaId,
//                        LanguageId = slaTrans.LanguageId,
//                        Description = slaTrans.Description ?? string.Empty,
//                        Name = slaTrans.Name ?? string.Empty,
//                        Status = slaTrans.Sla.Status,
//                        CreatedBy = slaTrans.Sla.CreatedBy,
//                        CreatedOn = slaTrans.Sla.CreatedOn,
//                        CcAssignee = slaTrans.Sla.CcAssignee,
//                        SendEmployee = slaTrans.Sla.Send_SMS_Employee.GetValueOrDefault(),
//                        SendCitizen = slaTrans.Sla.Send_SMS_Citizen.GetValueOrDefault(),
//                        DeletedOn = slaTrans.Sla.DeletedOn,
//                        NotifyBefore = slaTrans.Sla.NotifyBefore,
//                        HoursPerState = slaTrans.Sla.HoursPerState,
//                        NotificationCount = slaTrans.Sla.NotificationCount,
//                        PropogateToManager = slaTrans.Sla.PropogateToManager,
//                        WorkingDaysIncludingHolidays = slaTrans.Sla.WorkingDaysIncludingHolidays,
//                        IgnoredStates = _db.SlaIgnoredCaseStates.Where(s => s.SlaId == slaTrans.SlaId).ToList().Select(r => new DetailsLookupViewModel()
//                        {
//                            Id = r.IgnoredCaseStateId,
//                            Name = LookupHelper.GetLookupDetailsById(r.IgnoredCaseStateId, Request.Cookies["_culture"])?.Name
//                        }).ToList(),
//                        Categories = _db.SlaCategories.Where(s => s.SlaId == slaTrans.SlaId).ToList().Select(r => new DetailsLookupViewModel()
//                        {
//                            Id = r.CategoryId,
//                            Name = LookupHelper.GetLookupDetailsById(r.CategoryId, Request.Cookies["_culture"])?.Name
//                        }).ToList()
//                    };

//                    return Json(result, JsonRequestBehavior.AllowGet);
//                }


//                return Json(null, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Sla (Get)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Sla", PermissionKey = "Edit")]
//        public JsonResult EditSla(SlaViewModel sla)
//        {
//            try
//            {
//                var sl = _db.Slas.Find(sla.Id);
//                if (sl != null && sl.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    sl.CcAssignee = sla.CcAssignee;
//                    sl.HoursPerState = sla.HoursPerState;
//                    sl.NotificationCount = sla.NotificationCount;
//                    sl.NotifyBefore = sla.NotifyBefore;
//                    sl.Send_SMS_Citizen = sla.SendEmployee;
//                    sl.Send_SMS_Employee = sla.SendCitizen;
//                    sl.PropogateToManager = sla.PropogateToManager;
//                    sl.Status = sla.Status;
//                    sl.WorkingDaysIncludingHolidays = sla.WorkingDaysIncludingHolidays;

//                    _db.Entry(sl).State = EntityState.Modified;
//                    _db.SaveChanges();

//                    int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

//                    var slaTrans = _db.SlaTranslations.FirstOrDefault(r => r.SlaId == sl.Id && r.LanguageId == sla.LanguageId);
//                    if (slaTrans != null)
//                    {
//                        slaTrans.Name = sla.Name ?? string.Empty;
//                        slaTrans.Description = sla.Description;
//                        _db.Entry(slaTrans).State = EntityState.Modified;
//                    }
//                    else
//                    {
//                        slaTrans = new SlaTranslation()
//                        {
//                            SlaId = sl.Id,
//                            Name = sla.Name,
//                            IsDefault = false,
//                            LanguageId = sla.LanguageId,
//                            Description = sla.Description
//                        };
//                        _db.SlaTranslations.Add(slaTrans);
//                    }

//                    _db.SaveChanges();

//                    var ignoredStates = _db.SlaIgnoredCaseStates.Where(r => r.SlaId == sl.Id);
//                    foreach (var state in ignoredStates)
//                    {
//                        _db.SlaIgnoredCaseStates.Remove(state);
//                    }

//                    _db.SaveChanges();
//                    if (sla?.IgnoredStates != null)
//                    {
//                        foreach (var ignoredState in sla.IgnoredStates)
//                        {
//                            _db.SlaIgnoredCaseStates.Add(new SlaIgnoredCaseState()
//                            {
//                                SlaId = sl.Id,
//                                IgnoredCaseStateId = ignoredState.Id
//                            });
//                        }
//                        _db.SaveChanges();
//                    }


//                    var categories = _db.SlaCategories.Where(r => r.SlaId == sl.Id);
//                    foreach (var cat in categories)
//                    {
//                        _db.SlaCategories.Remove(cat);
//                    }

//                    _db.SaveChanges();
//                    if (sla?.Categories != null)
//                    {
//                        foreach (var category in sla.Categories)
//                        {
//                            _db.SlaCategories.Add(new SlaCategory()
//                            {
//                                SlaId = sl.Id,
//                                CategoryId = category.Id
//                            });
//                        }

//                        _db.SaveChanges();
//                    }
//                }


//                return Json(sla, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Sla (Post)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Sla", PermissionKey = "Delete")]
//        public JsonResult DeleteSla(int id)
//        {
//            try
//            {
//                var sla = _db.Slas.Find(id);
//                if (sla != null && sla.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    sla.Status = (int)GeneralEnums.StatusEnum.Deleted;
//                    _db.Entry(sla).State = EntityState.Modified;
//                    _db.SaveChanges();

//                    var slaTrans = _db.SlaTranslations.FirstOrDefault(r => r.SlaId == id);
//                    return Json(new SlaViewModel()
//                    {
//                        Id = slaTrans.SlaId,
//                        LanguageId = slaTrans.LanguageId,
//                        Description = slaTrans.Description ?? string.Empty,
//                        Name = slaTrans.Name ?? string.Empty,
//                        Status = slaTrans.Sla.Status,
//                        CreatedBy = slaTrans.Sla.CreatedBy,
//                        CreatedOn = slaTrans.Sla.CreatedOn,
//                        CcAssignee = slaTrans.Sla.CcAssignee,
//                        SendEmployee = slaTrans.Sla.Send_SMS_Employee.GetValueOrDefault(),
//                        SendCitizen = slaTrans.Sla.Send_SMS_Citizen.GetValueOrDefault(),
//                        DeletedOn = slaTrans.Sla.DeletedOn,
//                        NotifyBefore = slaTrans.Sla.NotifyBefore,
//                        HoursPerState = slaTrans.Sla.HoursPerState,
//                        NotificationCount = slaTrans.Sla.NotificationCount,
//                        PropogateToManager = slaTrans.Sla.PropogateToManager,
//                        WorkingDaysIncludingHolidays = slaTrans.Sla.WorkingDaysIncludingHolidays,
//                        IgnoredStates = _db.SlaIgnoredCaseStates.Where(s => s.SlaId == slaTrans.SlaId).ToList().Select(r => new DetailsLookupViewModel()
//                        {
//                            Id = r.IgnoredCaseStateId,
//                            Name = LookupHelper.GetLookupDetailsById(r.IgnoredCaseStateId, Request.Cookies["_culture"])?.Name
//                        }).ToList()
//                    }, JsonRequestBehavior.AllowGet);
//                }
//                return Json(null, JsonRequestBehavior.AllowGet);
//            }

//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting sla");
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