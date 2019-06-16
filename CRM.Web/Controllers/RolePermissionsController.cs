using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Helpers;
using CRM.Web.Models;
using Microsoft.Ajax.Utilities;
using PagedList;
using CRM.Web.Filters;

namespace CRM.Web.Controllers
{
    public class RolePermissionsController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        [CustomAuthentication(PageName = "RolesPermissions", PermissionKey = "View")]
        public ActionResult Index(int? page, string searchText, int resetTo = 0)
        {
            if (resetTo == 1)
            {
                page = 1;
            }
            var statuses = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
            ViewBag.Status = new SelectList(statuses, "Id", "Name");
            ViewBag.StatusEdit = new SelectList(statuses, "Id", "Name");

            var roles = _db.AspNetRoles.ToList();
            if (!searchText.IsNullOrWhiteSpace())
            {
                roles = roles.Where(r => r.Name.Contains(searchText) || r.FriendlyName.Contains(searchText) || r.Description.Contains(searchText)).ToList();
                ViewBag.searchText = searchText;
            }
            var result = roles.Select(x => new RolePermissionsViewModel
            {
                Id = int.Parse(x.Id),
                RoleName = x.Name,
                RoleFriendlyName = x.FriendlyName,
                RoleDescription = x.Description
            });

            var pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            var pageNumber = page ?? 1;
            return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        [CustomAuthentication(PageName = "RolesPermissions", PermissionKey = "Create")]
        public JsonResult AddRole(RolePageViewModel role)
        {
            try
            {
                #region Add Role
                var existRole = _db.AspNetRoles.Any(x => x.Id == role.Id.ToString() || x.Name == role.Name);
                if (existRole)
                {
                    //Role Already Exist
                    return null;
                }
                var newRole = new AspNetRole
                {
                    Id = role.Id.ToString(),
                    Name = role.Name,
                    FriendlyName = role.FriendlyName,
                    Description = role.Description,
                };
                _db.AspNetRoles.Add(newRole);
                _db.SaveChanges();
                #endregion
                return Json(newRole, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new Role");
                return null;
            }
        }

        [HttpGet]
        [CustomAuthentication(PageName = "RolesPermissions", PermissionKey = "Edit")]
        public PartialViewResult EditPermission(int id)
        {
            try
            {
                var permissionsGroups = _db.Permissions.Where(r=> r.Status != (int)GeneralEnums.StatusEnum.Deleted).GroupBy(x => x.PageName);
                var rolePermissions = _db.RolePermissions.Where(x => x.RoleId == id.ToString() && x.Permission.Status != (int)GeneralEnums.StatusEnum.Deleted);
                var currentRole = _db.AspNetRoles.FirstOrDefault(x => x.Id == id.ToString());
                if (currentRole == null)
                {
                    //Role not exist
                    return null;
                }
                var result = new RolePermissionsViewModel
                {
                    Id = id,
                    RoleName = currentRole.Name,
                    RoleFriendlyName = currentRole.FriendlyName,
                    RoleDescription = currentRole.Description,
                    PermissionGroups = new List<PermissionGroups>()
                };
                foreach (var permissions in permissionsGroups)
                {
                    result.PermissionGroups.Add(new PermissionGroups
                    {
                        PageName = permissions.Key,
                        PermissionsKey = permissions.Select(x => new PermissionViewModel
                        {
                            Id = x.Id,
                            Status = x.Status,
                            PageUrl = x.PageUrl,
                            PermissionKey = x.PermissionKey,
                            PageName = x.PageName,
                            Description = x.Description,
                            CreatedBy = x.CreatedBy,
                            CreatedOn = x.CreatedOn,
                            DeletedOn = x.DeletedOn,
                            IsSelected = rolePermissions.Any(r => r.PermissionId == x.Id)
                        }).ToDictionary(x => x.Id)
                    });
                }
                return PartialView("_RolePermission", result);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Permission (Get)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "RolesPermissions", PermissionKey = "Edit")]
        public JsonResult EditPermission(RolePermissionsViewModel permission)
        {
            try
            {
                var role = _db.AspNetRoles.Find(permission.Id.ToString());
                var rolePermissions = _db.RolePermissions.Where(x => x.RoleId == role.Id);
                foreach (var rolePermission in rolePermissions)
                {
                    _db.RolePermissions.Remove(rolePermission);
                }
                _db.SaveChanges();
                if (role != null)
                {
                    if (!string.IsNullOrWhiteSpace(permission.RoleName))
                    {
                        role.Name = permission.RoleName;
                    }
                    if (!string.IsNullOrWhiteSpace(permission.RoleFriendlyName))
                    {
                        role.FriendlyName = permission.RoleFriendlyName;
                    }
                    if (!string.IsNullOrWhiteSpace(permission.RoleDescription))
                    {
                        role.Description = permission.RoleDescription;
                    }
                    _db.Entry(role).State = EntityState.Modified;
                    var permissions = permission.Permissions.Split(',');
                    var newRolePermission = new RolePermission();
                    foreach (var perm in permissions)
                    {
                        var permId = int.Parse(perm);
                        var existRolePermission = _db.RolePermissions.Any(x => x.RoleId == role.Id.ToString() && x.PermissionId == permId);
                        if (existRolePermission)
                        {
                            //Role Permission Already Exist
                            continue;
                        }
                        newRolePermission.RoleId = role.Id;
                        newRolePermission.PermissionId = int.Parse(perm);
                        _db.RolePermissions.Add(newRolePermission);
                        _db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While adding Role Permission (Post)");
                return null;
            }
            return Json(permission, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [CustomAuthentication(PageName = "RolesPermissions", PermissionKey = "Delete")]
        public JsonResult DeleteRole(int id)
        {
            try
            {
                var role = _db.AspNetRoles.Find(id.ToString());
                if (role == null) return Json(null, JsonRequestBehavior.AllowGet);
                var rolePermissions = _db.RolePermissions.Where(x => x.RoleId == id.ToString()).ToList();
                foreach (var permission in rolePermissions)
                {
                    _db.RolePermissions.Remove(permission);
                }
                _db.SaveChanges();
                _db.AspNetRoles.Remove(role);
                _db.SaveChanges();
                return Json(null, JsonRequestBehavior.AllowGet);
            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting role");
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