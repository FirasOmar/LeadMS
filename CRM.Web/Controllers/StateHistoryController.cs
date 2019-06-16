//using System.Data.Entity;
//using System.Linq;
//using System.Net;
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

//namespace CRM.Web.Controllers
//{
//    public class StateHistoryController : BaseController
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();
//        // GET: StateHistory
//        [CustomAuthentication(PageName = "StateHistory", PermissionKey = "View")]
//        public ActionResult Index(int? page, string searchText, int resetTo = 0)
//        {
//            if (resetTo == 1)
//            {
//                page = 1;
//            }
//            var history = _db.StateHistories.Where(r => r.Status != (int) GeneralEnums.StatusEnum.Deleted);

//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                history = history
//                    .Where(r =>
//                                (r.SystemCas.Description.Contains(searchText) || r.SystemCas.Title.Contains(searchText)));
//                ViewBag.searchText = searchText;
//            }
//            var result = history.ToList().Select(x =>
//                   new StateHistoryViewModel()
//                   {
//                      Id = x.Id,
//                      CreatedBy = x.CreatedBy,
//                      Status = x.Status,
//                      CreatedOn = x.CreatedOn,
//                      CaseId = x.CaseId,
//                      PreviousState = x.PreviousState,
//                      CurrentState = x.CurrentState,
//                      CaseName = x.SystemCas.Title,
//                      CurrentStateName = LookupHelper.GetLookupDetailsById((int)x.CurrentState, Request.Cookies["_culture"])?.Name ?? string.Empty,
//                      StatusName = x.SystemCas.Title,
//                       PreviousStateName = LookupHelper.GetLookupDetailsById((int)x.CurrentState, Request.Cookies["_culture"])?.Name ?? string.Empty
//                   });

//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);
//            return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
//        }
//        // GET: /StateHistory/Details/5
//        [CustomAuthentication(PageName = "StateHistory", PermissionKey = "View")]
//        public ActionResult Details(int? id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            StateHistory state = _db.StateHistories.Find(id);
//            if (state == null || state.Status == (int)GeneralEnums.StatusEnum.Deleted)
//            {
//                return HttpNotFound();
//            }
//            var result = new StateHistoryViewModel()
//            {
//                Id = state.Id,
//                CreatedBy = state.CreatedBy,
//                Status = state.Status,
//                CreatedOn = state.CreatedOn,
//                CaseId = state.CaseId,
//                PreviousState = state.PreviousState,
//                CurrentState = state.CurrentState,
//                CaseName = state.SystemCas.Title,
//                CurrentStateName = LookupHelper.GetLookupDetailsById((int)state.CurrentState, Request.Cookies["_culture"])?.Name ?? string.Empty,
//                StatusName = state.SystemCas.Title,
//                PreviousStateName = LookupHelper.GetLookupDetailsById((int)state.CurrentState, Request.Cookies["_culture"])?.Name ?? string.Empty

//            };
//            return View(result);
//        }

//        // GET: /StateHistory/Delete/5
//        [CustomAuthentication(PageName = "StateHistory", PermissionKey = "Delete")]
//        public ActionResult Delete(int? id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            StateHistory state = _db.StateHistories.Find(id);
//            if (state == null || state.Status == (int)GeneralEnums.StatusEnum.Deleted)
//            {
//                return HttpNotFound();
//            }
//            var result = new StateHistoryViewModel()
//            {
//                Id = state.Id,
//                CreatedBy = state.CreatedBy,
//                Status = state.Status,
//                CreatedOn = state.CreatedOn,
//                CaseId = state.CaseId,
//                PreviousState = state.PreviousState,
//                CurrentState = state.CurrentState,
//                CaseName = state.SystemCas.Title,
//                CurrentStateName = LookupHelper.GetLookupDetailsById((int)state.CurrentState, Request.Cookies["_culture"])?.Name ?? string.Empty,
//                StatusName = state.SystemCas.Title,
//                PreviousStateName = LookupHelper.GetLookupDetailsById((int)state.CurrentState, Request.Cookies["_culture"])?.Name ?? string.Empty

//            };
//            return View(result);
//        }

//        // POST: /Curricula/Delete/5
//        [HttpPost, ActionName("Delete")]
//        [ValidateAntiForgeryToken]
//        [CustomAuthentication(PageName = "StateHistory", PermissionKey = "Delete")]
//        public ActionResult DeleteConfirmed(int id)
//        {
//            StateHistory state = _db.StateHistories.Find(id);
//            if (state != null)
//            {
//                state.Status = (int)GeneralEnums.StatusEnum.Deleted;
//                _db.Entry(state).State = EntityState.Modified;
//            }

//            _db.SaveChanges();
//            return RedirectToAction("Index");
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