using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using CRM.Core.Helpers;
using CRM.DataEntity.Models;
using CRM.Web.Helpers;
using PagedList;
using CRM.Core;
using CRM.Core.Models;
using CRM.Core.SystemEnums;
using CRM.Web.Filters;

namespace CRM.Web.Controllers
{
    public class SystemSettingsController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();

        // GET: SystemSettings
        [CustomAuthentication(PageName = "Settings", PermissionKey = "View")]
        public ActionResult Index(int? page, string searchText, int resetTo = 0)
        {
            if (resetTo == 1)
            {
                page = 1;
            }

            var status = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
            ViewBag.Status = new SelectList(status, "Id", "Name");
            ViewBag.StatusEdit = new SelectList(status, "Id", "Name");

            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

            var settingTranForcurrentLan = _db.SystemSettingTranslations
                                  .Where(r => (r.LanguageId == currentLanguageId) &&
                                 r.SystemSetting.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(c => c.SettingId);

            var settingTran = _db.SystemSettingTranslations
                          .Where(r => (r.IsDefault) &&
                         r.SystemSetting.Status != (int)GeneralEnums.StatusEnum.Deleted && !settingTranForcurrentLan.Contains(r.SettingId))
                         .Union(
                            _db.SystemSettingTranslations
                          .Where(r => r.LanguageId == currentLanguageId && r.SystemSetting.Status != (int)GeneralEnums.StatusEnum.Deleted && settingTranForcurrentLan.Contains(r.SettingId)))
                         .ToList();


            if (!string.IsNullOrWhiteSpace(searchText))
            {
                settingTran = settingTran.Where(r => r.Name.Contains(searchText) || r.Value.Contains(searchText)).ToList();
                ViewBag.searchText = searchText;
            }

            var result = settingTran.Select(r =>
              new SettingViewModel
              {
                  Id = r.SystemSetting.Id,
                  Status = r.SystemSetting.Status,
                  Name = r.Name,
                  CreatedBy = r.SystemSetting.CreatedBy,
                  CreatedOn = r.SystemSetting.CreatedOn,
                  DeletedOn = r.SystemSetting.DeletedOn,
                  LanguageId = r.LanguageId,
                  Value=r.Value

              }
            );

            var pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            var pageNumber = (page ?? 1);


            return View(result.OrderByDescending(r => r.Id).ToPagedList(pageNumber, pageSize));

        }


        [HttpPost]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Create")]
        public ActionResult AddSystemSetting(SettingViewModel Setting)
        {
            try
            {
                int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
                var systemSetting = new SystemSetting
                {
                    CreatedOn = DateTime.Now,
                    CreatedBy = User.Identity.Name,
                    Status = Setting.Status,
                    DeletedOn = Setting.DeletedOn,
                };
                _db.SystemSettings.Add(systemSetting);
                _db.SaveChanges();

                var systemSettingTran = new SystemSettingTranslation()
                {
                    Name = Setting.Name,
                    LanguageId = languageId,
                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                    SettingId = systemSetting.Id,
                    Value = Setting.Value
                };
                _db.SystemSettingTranslations.Add(systemSettingTran);

                if (!systemSettingTran.IsDefault)
                {

                    var systemSettingTran1 = new SystemSettingTranslation()
                    {
                        Name = Setting.Name,
                        LanguageId = CultureHelper.GetDefaultLanguageId(),
                        IsDefault = true,
                        SettingId = systemSetting.Id,
                        Value = Setting.Value
                    };
                    _db.SystemSettingTranslations.Add(systemSettingTran1);
                }
                _db.SaveChanges();

                return Json(Setting, JsonRequestBehavior.AllowGet);

            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error while add System Settings");
                return null;
            }

        }

        [HttpGet]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Edit")]
        public ActionResult EditSystemSetting(int id, int languageId)
        {

            try
            {
                SystemSetting systemSetting = _db.SystemSettings.Find(id);
                if (systemSetting != null && systemSetting.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    var system = LanguageFallbackHelper.GetSystemSetting(id, languageId);
                    return Json(system, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While Editing System Settings (Get)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Edit")]
        public ActionResult EditSystemSetting(SettingViewModel systemSettingViewModel)
        {
            try
            {
                var systemSetting = _db.SystemSettings.Find(systemSettingViewModel.Id);
                if (systemSetting != null && systemSetting.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    systemSetting.Status = systemSettingViewModel.Status;
                    _db.Entry(systemSetting).State = EntityState.Modified;
                    _db.SaveChanges();

                    var systemSettingTran = _db.SystemSettingTranslations.FirstOrDefault(r => r.LanguageId == systemSettingViewModel.LanguageId && r.SettingId == systemSettingViewModel.Id);
                    if (systemSettingTran != null)
                    {
                        systemSettingTran.Value = systemSettingViewModel.Value;
                        _db.Entry(systemSettingTran).State = EntityState.Modified;
                    }
                    else
                    {
                        var systemTran = new SystemSettingTranslation()
                        {
                            Name = systemSettingViewModel.Name,
                            Value = systemSettingViewModel.Value,
                            LanguageId = systemSettingViewModel.LanguageId,
                            IsDefault = false,
                            SettingId = systemSetting.Id,
                        };
                        _db.SystemSettingTranslations.Add(systemTran);

                    }
                    _db.SaveChanges();
                }
                return Json(systemSettingViewModel, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While Editing System Settings (Post)");
                return null;
            }

        }

        [HttpPost]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Delete")]
        public ActionResult DeleteSystemSetting(int id)
        {
            try
            {
                var systemSetting = _db.SystemSettings.Find(id);
                if (systemSetting != null && systemSetting.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    systemSetting.Status = (int)GeneralEnums.StatusEnum.Deleted;
                    systemSetting.DeletedOn = DateTime.Now;
                    _db.Entry(systemSetting).State = EntityState.Modified;
                    _db.SaveChanges();

                    var systemSettingDeleted = _db.SystemSettingTranslations.FirstOrDefault(r => r.SettingId == id);
                    return Json(new SettingViewModel()
                    {
                        Id = systemSettingDeleted.SystemSetting.Id,
                        Status = systemSettingDeleted.SystemSetting.Status,
                        Name = systemSettingDeleted.Name,
                        CreatedBy = systemSettingDeleted.SystemSetting.CreatedBy,
                        CreatedOn = systemSettingDeleted.SystemSetting.CreatedOn,
                        DeletedOn = systemSettingDeleted.SystemSetting.DeletedOn,
                        LanguageId = systemSettingDeleted.LanguageId,
                        Value = systemSettingDeleted.Value
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                LogHelper.LogException(User.Identity.Name, ex, "Error While Delete SystemSetting");
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
