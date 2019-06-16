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
//using Microsoft.Ajax.Utilities;
//using PagedList;
//using System.Collections.Generic;

//namespace CRM.Web.Controllers
//{
//    public class StateTransitionsController : BaseController
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();
//        [CustomAuthentication(PageName = "StateTransitions", PermissionKey = "View")]
//        public ActionResult Index(int? page, string searchText, int resetTo = 0)
//        {
//            if (resetTo == 1)
//            {
//                page = 1;
//            }
//            var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//            var stateTransitions = _db.StateTransitionsConfigurations.Where(x => x.Status != (int)GeneralEnums.StatusEnum.Deleted).ToList();
//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                stateTransitions = stateTransitions.Where(r => r.CategoryId == int.Parse(searchText) || r.AssigneeId == int.Parse(searchText) || r.StateFrom == int.Parse(searchText) || r.StateTo == int.Parse(searchText)).ToList();
//                ViewBag.searchText = searchText;
//            }
//            var result = stateTransitions.Select(x => new StateTransitionsConfigurationViewModel
//            {
//                Id = x.Id,
//                CategoryId = x.CategoryId,
//                StateToId = x.StateTo,
//                StateFromId = x.StateFrom,
//                AssigneeId = x.AssigneeId,
//                CategoryName = LookupHelper.GetLookupDetailsById(x.CategoryId, Request.Cookies["_culture"])?.Name ?? string.Empty,
//                StateFrom = LookupHelper.GetLookupDetailsById(x.StateFrom, Request.Cookies["_culture"])?.Name ?? string.Empty,
//                StateTo = LookupHelper.GetLookupDetailsById(x.StateTo, Request.Cookies["_culture"])?.Name ?? string.Empty,
//                Assignee = x.AssigneeId != null ? LanguageFallbackHelper.GetUserProfile((int)x.AssigneeId, langId)?.FullName ?? string.Empty : string.Empty
//            });

//            var pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = page ?? 1;
//            return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "StateTransitions", PermissionKey = "Create")]
//        public JsonResult AddStateTransitionsConfigurations(StateTransitionsConfigurationViewModel stateTransitions)
//        {
//            try
//            {
//                #region Add State Transitions Configurations
//                var existConfigurations = _db.StateTransitionsConfigurations.Any(x => x.Id == stateTransitions.Id);
//                if (existConfigurations)
//                {
//                    //Configurations Already Exist
//                    return null;
//                }
//                var newConfigurations = new StateTransitionsConfiguration
//                {
//                    Id = stateTransitions.Id,
//                    CategoryId = stateTransitions.CategoryId,
//                    CategoryType = stateTransitions.CategoryType,
//                    StateFrom = stateTransitions.StateFromId,
//                    StateTo = stateTransitions.StateToId,
//                    AssigneeId = stateTransitions.AssigneeId,
//                    Status = (int)AccountEnums.AccountStatusEnum.Active,
//                    CreatedBy = User.Identity.Name,
//                    CreatedOn = DateTime.Now
//                };
//                _db.StateTransitionsConfigurations.Add(newConfigurations);
//                _db.SaveChanges();
//                #endregion
//                return Json(stateTransitions, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new state transitions configurations");
//                return null;
//            }
//        }

//        [HttpGet]
//        [CustomAuthentication(PageName = "StateTransitions", PermissionKey = "Edit")]
//        public JsonResult EditStateTransitionsConfigurations(int id)
//        {
//            try
//            {
//                var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
//                var stateTransitions = _db.StateTransitionsConfigurations.FirstOrDefault(x => x.Id == id);
//                if (stateTransitions == null || stateTransitions.Status == (int)GeneralEnums.StatusEnum.Deleted)
//                    return Json(null, JsonRequestBehavior.AllowGet);
//                var result = new StateTransitionsConfigurationViewModel
//                {
//                    Id = stateTransitions.Id,
//                    CategoryId = stateTransitions.CategoryId,
//                    CategoryType = stateTransitions.CategoryType,
//                    StateToId = stateTransitions.StateTo,
//                    StateFromId = stateTransitions.StateFrom,
//                    AssigneeId = stateTransitions.AssigneeId,
//                    CategoryName = LookupHelper.GetLookupDetailsById(stateTransitions.CategoryId, Request.Cookies["_culture"])?.Name ?? string.Empty,
//                    StateFrom = LookupHelper.GetLookupDetailsById(stateTransitions.StateFrom, Request.Cookies["_culture"])?.Name ?? string.Empty,
//                    StateTo = LookupHelper.GetLookupDetailsById(stateTransitions.StateTo, Request.Cookies["_culture"])?.Name ?? string.Empty,
//                    Assignee = stateTransitions.AssigneeId != null ? 
//                        LanguageFallbackHelper.GetUserProfile((int)stateTransitions.AssigneeId, langId)?.FullName ??
//                        string.Empty : string.Empty
//                };

//                var categoryEnumValue = (int)GeneralEnums.MasterLookupEnums.CaseCategory;
//                var workFlowEnumValue = (int)GeneralEnums.MasterLookupEnums.WorkFlowStates;
//                switch (result.CategoryType)
//                {
//                    case (int)GeneralEnums.MasterLookupEnums.TenderCategories:
//                        categoryEnumValue = (int)GeneralEnums.MasterLookupEnums.TenderCategories;
//                        workFlowEnumValue = (int)GeneralEnums.MasterLookupEnums.TenderStates;
//                        break;
//                    case (int)GeneralEnums.MasterLookupEnums.JobCategories:
//                        categoryEnumValue = (int)GeneralEnums.MasterLookupEnums.TenderCategories;
//                        workFlowEnumValue = (int)GeneralEnums.MasterLookupEnums.TenderStates;
//                        break;
//                }

//                var categories = LookupHelper.GetLookupDetailsByMasterId(categoryEnumValue, Request.Cookies["_culture"]);
//                var workFlowStates = LookupHelper.GetLookupDetailsByMasterId(workFlowEnumValue, Request.Cookies["_culture"]);

//                return Json(new { recordData = result, categories = categories, workFlowStates = workFlowStates }, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing state transitions configurations (Get)");
//                return null;
//            }
//        }

//        [HttpGet]
//        [CustomAuthentication(PageName ="Cases",PermissionKey ="Create")]
//        public JsonResult GetCategoryTypeData(int categoryType)
//        {
//            try
//            {
//                if(categoryType > 0)
//                {
//                    var categories = LookupHelper.GetLookupDetailsByMasterId(categoryType, Request.Cookies["_culture"]);
//                    var workFlowStatesEnumValue = (int)GeneralEnums.MasterLookupEnums.WorkFlowStates;
//                    switch (categoryType)
//                    {
//                        case (int)GeneralEnums.MasterLookupEnums.TenderCategories:
//                            workFlowStatesEnumValue = (int)GeneralEnums.MasterLookupEnums.TenderStates;
//                            break;
//                        case (int)GeneralEnums.MasterLookupEnums.JobCategories:
//                            workFlowStatesEnumValue = (int)GeneralEnums.MasterLookupEnums.JobStates;
//                            break;
//                    }
//                    var workFlowStates = LookupHelper.GetLookupDetailsByMasterId(workFlowStatesEnumValue, Request.Cookies["_culture"]);
//                    return Json(new { categories = categories, workFlowStates = workFlowStates }, JsonRequestBehavior.AllowGet);
//                }
//                return null;
//            }
//            catch(Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While Getting Category Type Data (Get)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "StateTransitions", PermissionKey = "Edit")]
//        public JsonResult EditStateTransitionsConfigurations(StateTransitionsConfigurationViewModel stateTransitions)
//        {
//            try
//            {
//                var stateConfigurations = _db.StateTransitionsConfigurations.FirstOrDefault(x => x.Id == stateTransitions.Id);
//                if (stateConfigurations != null)
//                {
//                    stateConfigurations.CategoryId = stateTransitions.CategoryId;
//                    stateConfigurations.StateFrom = stateTransitions.StateFromId;
//                    stateConfigurations.StateTo = stateTransitions.StateToId;
//                    stateConfigurations.AssigneeId = stateTransitions.AssigneeId;
//                    _db.Entry(stateConfigurations).State = EntityState.Modified;
//                    _db.SaveChanges();
//                }
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing state transitions configurations (Post)");
//                return null;
//            }
//            return Json(stateTransitions, JsonRequestBehavior.AllowGet);
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "StateTransitions", PermissionKey = "Delete")]
//        public JsonResult DeleteStateTransitionsConfigurations(int id)
//        {
//            try
//            {
//                var stateTransitionsConfigurations = _db.StateTransitionsConfigurations.FirstOrDefault(x => x.Id == id);
//                if (stateTransitionsConfigurations == null) return Json(null, JsonRequestBehavior.AllowGet);
//                stateTransitionsConfigurations.Status = (int)GeneralEnums.StatusEnum.Deleted;
//                stateTransitionsConfigurations.DeletedOn = DateTime.Now;
//                _db.SaveChanges();
//                var result = new StateTransitionsConfigurationViewModel
//                {
//                    Id = stateTransitionsConfigurations.Id,
//                    CategoryId = stateTransitionsConfigurations.CategoryId,
//                    StateToId = stateTransitionsConfigurations.StateTo,
//                    StateFromId = stateTransitionsConfigurations.StateFrom,
//                    AssigneeId = stateTransitionsConfigurations.AssigneeId,
//                };
//                return Json(result, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting state transitions configurations");
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