using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Filters;
using CRM.Web.Helpers;
using CRM.Web.Models;
using Microsoft.Ajax.Utilities;
using PagedList;

namespace CRM.Web.Controllers
{
    public class PermissionsController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        [CustomAuthentication(PageName = "Roles", PermissionKey = "View")]
        public ActionResult Index(int? page, string searchText, int resetTo = 0)
        {

            if (resetTo == 1)
            {
                page = 1;
            }
            var statuses = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
            ViewBag.Status = new SelectList(statuses, "Id", "Name");
            ViewBag.StatusEdit = new SelectList(statuses, "Id", "Name");

            var permissions = _db.Permissions
                                  .Where(r=> r.Status != (int)GeneralEnums.StatusEnum.Deleted);

            if (!searchText.IsNullOrWhiteSpace())
            {
                permissions = permissions
                    .Where(r => r.PageUrl.Contains(searchText) || r.PageName.Contains(searchText)
                                || r.PermissionKey.Contains(searchText) || r.Description.Contains(searchText));
                ViewBag.searchText = searchText;
            }
            var result = permissions.ToList().Select(x =>
                   new PermissionViewModel()
                   {
                       Id = x.Id,
                       PageUrl = x.PageUrl,
                       PageName = x.PageName,
                       PermissionKey = x.PermissionKey,
                       Status = x.Status,
                       Description = x.Description,
                       CreatedOn = x.CreatedOn,
                       DeletedOn = x.DeletedOn,
                       CreatedBy = x.CreatedBy
                   });

            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            var pageNumber = (page ?? 1);
            return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Roles", PermissionKey = "Create")]
        public JsonResult AddPermission(PermissionViewModel permission)
        {
            try
            {
                #region Add Permission
                var permis = new Permission()
                {
                    CreatedBy = User.Identity.Name,
                    CreatedOn = DateTime.Now,
                    Status = permission.Status,
                    PageUrl = permission.PageUrl ?? String.Empty,
                    Description = permission.Description,
                    PageName = permission.PageName,
                    PermissionKey = permission.PermissionKey
                };
                _db.Permissions.Add(permis);
                _db.SaveChanges();

                
                _db.SaveChanges();


                #endregion


                return Json(permission, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new Permission");
                return null;
            }
        }

        [HttpGet]
        [CustomAuthentication(PageName = "Roles", PermissionKey = "Edit")]
        public JsonResult EditPermission(int id)
        {
            try
            {

                var permis = _db.Permissions.Find(id);
                if (permis != null && permis.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    var permission = new PermissionViewModel()
                    {
                        CreatedBy = permis.CreatedBy,
                        CreatedOn = permis.CreatedOn,
                        Status = permis.Status,
                        PageUrl = permis.PageUrl ?? String.Empty,
                        Description = permis.Description,
                        PageName = permis.PageName,
                        PermissionKey = permis.PermissionKey
                    };
                    return Json(permission, JsonRequestBehavior.AllowGet);
                }


                return Json(null, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Permission (Get)");
                return null;
            }
        }
        [HttpPost]
        [CustomAuthentication(PageName = "Roles", PermissionKey = "Edit")]
        public JsonResult EditPermission(PermissionViewModel permission)
        {
            try
            {
                var permiss = _db.Permissions.Find(permission.Id);
                if (permiss != null && permiss.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    permiss.Status = permission.Status;
                    permiss.PageUrl = permission.PageUrl ?? string.Empty;
                    permiss.Description = permission.Description;
                    permiss.PageName = permission.PageName;
                    permiss.PermissionKey = permission.PermissionKey;
                    _db.Entry(permiss).State = EntityState.Modified;
                    _db.SaveChanges();

                    _db.SaveChanges();
                }


                return Json(permission, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Permission (Post)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Roles", PermissionKey = "Delete")]
        public JsonResult DeletePermission(int id)
        {
            try
            {
                var permiss = _db.Permissions.Find(id);
                if (permiss != null && permiss.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    permiss.Status = (int)GeneralEnums.StatusEnum.Deleted;
                    _db.Entry(permiss).State = EntityState.Modified;
                    _db.SaveChanges();
                    
                    return Json(new PermissionViewModel()
                    {
                        Id = permiss.Id,
                        PageUrl = permiss.PageUrl,
                        Description = permiss.Description,
                        PageName = permiss.PageName,
                        PermissionKey = permiss.PermissionKey,
                        Status = permiss.Status,
                        CreatedOn = permiss.CreatedOn,
                        DeletedOn = permiss.DeletedOn,
                        CreatedBy = permiss.CreatedBy
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);
            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting Permission");
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