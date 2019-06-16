using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.DataEntity.Models;
using CRM.Web.Filters;
using CRM.Web.Helpers;
using CRM.Web.Models;
using PagedList;
using CRM.Core.SystemEnums;

namespace CRM.Web.Controllers
{
    public class MasterLookupsController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();

        // GET: MasterLookups
        [CustomAuthentication(PageName = "MasterLookups", PermissionKey = "View")]
        public ActionResult Index(int? page, string searchText, int resetTo = 0)
        {
            if (resetTo == 1)
            {
                page = 1;
            }
            var status = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
            ViewBag.Status = new SelectList(status, "Id", "Name");
            ViewBag.StatusEdit = new SelectList(status, "Id", "Name");
            ViewBag.StatusDetails = new SelectList(status, "Id", "Name");
            ViewBag.StatusEditDetails = new SelectList(status, "Id", "Name");

            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);



            var masterLookupsForcurrentLan = _db.MasterLookupTranslations
                                  .Where(r => (r.LanguageId == currentLanguageId) &&
                                 r.MasterLookup.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(c => c.MasterLookupId);
            var masterLookup = _db.MasterLookupTranslations
                          .Where(r => (r.IsDefault) &&
                         r.MasterLookup.Status != (int)GeneralEnums.StatusEnum.Deleted && !masterLookupsForcurrentLan.Contains(r.MasterLookupId))
                         .Union(
                            _db.MasterLookupTranslations
                          .Where(r => r.LanguageId == currentLanguageId && r.MasterLookup.Status != (int)GeneralEnums.StatusEnum.Deleted && masterLookupsForcurrentLan.Contains(r.MasterLookupId)))
                         .ToList();


            if (!string.IsNullOrWhiteSpace(searchText))
            {
                masterLookup = masterLookup.Where(r => r.Name.Contains(searchText)).ToList();
                ViewBag.searchText = searchText;
            }

            var result = masterLookup.ToList().Select(r =>
              new MasterLookupViewModel
              {
                  Id = r.MasterLookup.Id,
                  Status = r.MasterLookup.Status,
                  Name = r.Name,
                  CreatedBy = r.MasterLookup.CreatedBy,
                  CreatedOn = r.MasterLookup.CreatedOn,
                  DeletedOn = r.MasterLookup.DeletedOn,
                  IsDefault = r.IsDefault,
                  LanguageId = r.LanguageId

              }
            );

            var pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            var pageNumber = (page ?? 1);


            return View(result.OrderByDescending(r => r.Id).ToPagedList(pageNumber, pageSize));
        }
        
        [HttpPost]
        [CustomAuthentication(PageName = "MasterLookups", PermissionKey = "Create")]
        public JsonResult AddMasterLookup(MasterLookupViewModel masterLookupViewModel)
        {
            try
            {
                int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
                var masterLookup = new MasterLookup
                {
                    CreatedOn = DateTime.Now,
                    CreatedBy = User.Identity.Name,
                    Status = masterLookupViewModel.Status

                };
                _db.MasterLookups.Add(masterLookup);
                _db.SaveChanges();

                var masterLookupTran = new MasterLookupTranslation()
                {
                    Name = masterLookupViewModel.Name,
                    LanguageId = languageId,
                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                    MasterLookupId = masterLookup.Id
                };
                _db.MasterLookupTranslations.Add(masterLookupTran);

                if (!masterLookupTran.IsDefault)
                {

                    var masterLookupTran1 = new MasterLookupTranslation()
                    {
                        Name = masterLookupViewModel.Name,
                        LanguageId = CultureHelper.GetDefaultLanguageId(),
                        IsDefault = true,
                        MasterLookupId = masterLookup.Id
                    };
                    _db.MasterLookupTranslations.Add(masterLookupTran1);
                }
                _db.SaveChanges();

                return Json(masterLookupViewModel, JsonRequestBehavior.AllowGet);

            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error while add master lookup");
                return null;
            }

        }

        [HttpGet]
        [CustomAuthentication(PageName = "MasterLookups", PermissionKey = "Edit")]
        public ActionResult EditMasterLookup(int id, int languageId)
        {

            try
            {
                MasterLookup masterLookup = _db.MasterLookups.Find(id);
                if (masterLookup != null && masterLookup.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    var master = LanguageFallbackHelper.GetMasterLookup(id, languageId);
                    return Json(master, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While Editing Master Lookup (Get)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "MasterLookups", PermissionKey = "Edit")]
        public ActionResult EditMasterLookup(MasterLookupViewModel masterLookupViewModel)
        {
            try
            {
                var masterLookup = _db.MasterLookups.Find(masterLookupViewModel.Id);
                if (masterLookup != null && masterLookup.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    masterLookup.Status = masterLookupViewModel.Status;
                    _db.Entry(masterLookup).State = EntityState.Modified;
                    _db.SaveChanges();

                    var masterTran = _db.MasterLookupTranslations.FirstOrDefault(r => r.LanguageId == masterLookupViewModel.LanguageId && r.MasterLookupId == masterLookupViewModel.Id);
                    if (masterTran != null)
                    {
                        masterTran.Name = masterLookupViewModel.Name;
                        _db.Entry(masterTran).State = EntityState.Modified;
                    }
                    else
                    {
                        var masterLookupTran = new MasterLookupTranslation()
                        {
                            Name = masterLookupViewModel.Name,
                            LanguageId = masterLookupViewModel.LanguageId,
                            IsDefault = false,
                            MasterLookupId = masterLookup.Id
                        };
                        _db.MasterLookupTranslations.Add(masterLookupTran);

                    }
                    _db.SaveChanges();


                }

                return Json(masterLookupViewModel, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While Editing Master Lookup (Get)");
                return null;
            }

        }

        [HttpPost]
        [CustomAuthentication(PageName = "MasterLookups", PermissionKey = "Delete")]
        public ActionResult DeleteMasterLookup(int id)
        {
            try
            {
                var master = _db.MasterLookups.Find(id);
                if (master != null && master.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    master.Status = (int)GeneralEnums.StatusEnum.Deleted;
                    master.DeletedOn = DateTime.Now;
                    _db.Entry(master).State = EntityState.Modified;
                    _db.SaveChanges();

                    var masterDeleted = _db.MasterLookupTranslations.FirstOrDefault(r => r.MasterLookupId == id);
                    return Json(new MasterLookupViewModel()
                    {
                        Id = masterDeleted.MasterLookup.Id,
                        Status = masterDeleted.MasterLookup.Status,
                        Name = masterDeleted.Name,
                        CreatedBy = masterDeleted.MasterLookup.CreatedBy,
                        CreatedOn = masterDeleted.MasterLookup.CreatedOn,
                        DeletedOn = masterDeleted.MasterLookup.DeletedOn,
                        IsDefault = masterDeleted.IsDefault,
                        LanguageId = masterDeleted.LanguageId,
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                LogHelper.LogException(User.Identity.Name, ex, "Error While Delete Master Lookup");
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
