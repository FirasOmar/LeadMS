using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using CRM.Core.Helpers;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Filters;
using CRM.Web.Helpers;
using CRM.Web.Models;

namespace CRM.Web.Controllers
{
    public class DetailsLookupsController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();

        [HttpGet]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "View")]
        public JsonResult Index(int MasterId, int? page, string searchTextDetails, int resetTo = 0)
        {
            if (resetTo == 1)
            {
                page = 1;
            }


            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);


            var detailsLookupForcurrentLan = _db.DetailsLookupTranslations
                                  .Where(r => (r.LanguageId == currentLanguageId) &&
                                 r.DetailsLookup.Status != (int)GeneralEnums.StatusEnum.Deleted && r.DetailsLookup.MasterId == MasterId).Select(c => c.DetailsLookupId);
            var detailsLookup = _db.DetailsLookupTranslations
                          .Where(r => (r.IsDefault) &&
                         r.DetailsLookup.Status != (int)GeneralEnums.StatusEnum.Deleted && r.DetailsLookup.MasterId == MasterId && !detailsLookupForcurrentLan.Contains(r.DetailsLookupId))
                         .Union(
                            _db.DetailsLookupTranslations
                          .Where(r => r.LanguageId == currentLanguageId && r.DetailsLookup.Status != (int)GeneralEnums.StatusEnum.Deleted && r.DetailsLookup.MasterId == MasterId && detailsLookupForcurrentLan.Contains(r.DetailsLookupId)))
                         ;

            if (!string.IsNullOrWhiteSpace(searchTextDetails))
            {
                detailsLookup = detailsLookup.Where(r => r.Value.Contains(searchTextDetails));
                ViewBag.searchText = searchTextDetails;
            }

            var result = detailsLookup.ToList().Select(r =>
              new DetailsLookupViewModel
              {
                  Id = r.DetailsLookupId,
                  Status = r.DetailsLookup.Status,
                  Name = r.Value,
                  CreatedBy = r.DetailsLookup.CreatedBy,
                  CreatedOn = r.DetailsLookup.CreatedOn,
                  DeletedOn = r.DetailsLookup.DeletedOn,
                  IsDefault = r.IsDefault,
                  LanguageId = r.LanguageId,
                  MasterId = r.DetailsLookup.MasterId,

              }
            ).OrderByDescending(r => r.Id);

            //var pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            //var pageNumber = (page ?? 1);
            ViewBag.count = result.Count();


            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Create")]
        public JsonResult AddDetailsLookup(DetailsLookupViewModel DetailsLookupViewModel)
        {
            try
            {
                int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
                var DetailsLookup = new DetailsLookup
                {
                    CreatedOn = DateTime.Now,
                    CreatedBy = User.Identity.Name,
                    Status = DetailsLookupViewModel.Status,
                    MasterId = DetailsLookupViewModel.MasterId,


                };
                _db.DetailsLookups.Add(DetailsLookup);
                _db.SaveChanges();

                var detailsLookupTran = new DetailsLookupTranslation()
                {
                    Value = DetailsLookupViewModel.Name,
                    LanguageId = languageId,
                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                    DetailsLookupId = DetailsLookup.Id,

                };
                _db.DetailsLookupTranslations.Add(detailsLookupTran);

                if (!detailsLookupTran.IsDefault)
                {

                    var detailsLookupTran1 = new DetailsLookupTranslation()
                    {
                        Value = DetailsLookupViewModel.Name,
                        LanguageId = CultureHelper.GetDefaultLanguageId(),
                        IsDefault = true,
                        DetailsLookupId = DetailsLookup.Id
                    };
                    _db.DetailsLookupTranslations.Add(detailsLookupTran1);
                }
                _db.SaveChanges();

                DetailsLookupViewModel.Id = DetailsLookup.Id;
                return Json(DetailsLookupViewModel, JsonRequestBehavior.AllowGet);

            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error while add Details lookup");
                return null;
            }

        }

        [HttpGet]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Edit")]
        public ActionResult EditDetailsLookup(int id, int languageId)
        {

            try
            {
                DetailsLookup detailsLookup = _db.DetailsLookups.Find(id);
                if (detailsLookup != null && detailsLookup.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    var Details = LanguageFallbackHelper.GetDetailsLookup(id, languageId);
                    return Json(Details, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While Editing Details Lookup (Get)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Edit")]
        public ActionResult EditDetailsLookup(DetailsLookupViewModel DetailsLookupViewModel)
        {
            try
            {
                var detailsLookup = _db.DetailsLookups.Find(DetailsLookupViewModel.Id);
                if (detailsLookup != null && detailsLookup.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    detailsLookup.Status = DetailsLookupViewModel.Status;
                    _db.Entry(detailsLookup).State = EntityState.Modified;
                    _db.SaveChanges();

                    var DetailsTran = _db.DetailsLookupTranslations.FirstOrDefault(r => r.LanguageId == DetailsLookupViewModel.LanguageId && r.DetailsLookupId == DetailsLookupViewModel.Id);
                    if (DetailsTran != null)
                    {
                        DetailsTran.Value = DetailsLookupViewModel.Name;
                        _db.Entry(DetailsTran).State = EntityState.Modified;
                    }
                    else
                    {
                        var detailsLookupTran = new DetailsLookupTranslation()
                        {
                            Value = DetailsLookupViewModel.Name,
                            LanguageId = DetailsLookupViewModel.LanguageId,
                            IsDefault = false,
                            DetailsLookupId = detailsLookup.Id
                        };
                        _db.DetailsLookupTranslations.Add(detailsLookupTran);

                    }
                    _db.SaveChanges();


                }

                return Json(DetailsLookupViewModel, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While Editing Details Lookup (Get)");
                return null;
            }

        }

        [HttpPost]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Delete")]
        public ActionResult DeleteDetailsLookup(int id)
        {
            try
            {
                var details = _db.DetailsLookups.Find(id);
                if (details != null && details.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    details.Status = (int)GeneralEnums.StatusEnum.Deleted;
                    details.DeletedOn = DateTime.Now;
                    _db.Entry(details).State = EntityState.Modified;
                    _db.SaveChanges();

                    var detailsDeleted = _db.DetailsLookupTranslations.FirstOrDefault(r => r.DetailsLookupId == id);
                    return Json(new DetailsLookupViewModel()
                    {
                        Id = detailsDeleted.DetailsLookup.Id,
                        Status = detailsDeleted.DetailsLookup.Status,
                        Name = detailsDeleted.Value,
                        CreatedBy = detailsDeleted.DetailsLookup.CreatedBy,
                        CreatedOn = detailsDeleted.DetailsLookup.CreatedOn,
                        DeletedOn = detailsDeleted.DetailsLookup.DeletedOn,
                        IsDefault = detailsDeleted.IsDefault,
                        LanguageId = detailsDeleted.LanguageId,
                        MasterId = detailsDeleted.DetailsLookup.MasterId,
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                LogHelper.LogException(User.Identity.Name, ex, "Error While Delete Details Lookup");
                return null;
            }

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
