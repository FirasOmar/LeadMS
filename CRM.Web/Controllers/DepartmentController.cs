using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.Core.Models;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Filters;
using CRM.Web.Helpers;
using CRM.Web.Models;
using Microsoft.Ajax.Utilities;
using PagedList;

namespace CRM.Web.Controllers
{
    public class DepartmentController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        [CustomAuthentication(PageName = "Settings", PermissionKey = "View")]
        public ActionResult Index(int? page, string searchText, int resetTo = 0)
        {

            if (resetTo == 1)
            {
                page = 1;
            }
            var statuses = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
            ViewBag.Status = new SelectList(statuses, "Id", "Name");
            ViewBag.StatusEdit = new SelectList(statuses, "Id", "Name");
            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

            var departmentForcurrentLan = _db.DepartmentTranslations
                                  .Where(r => (r.LanguageId == currentLanguageId) &&
                                 r.Department.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(c => c.DepartmentId);
            var departments = _db.DepartmentTranslations
                          .Where(r => (r.IsDefault) &&
                         r.Department.Status != (int)GeneralEnums.StatusEnum.Deleted && !departmentForcurrentLan.Contains(r.DepartmentId))
                         .Union(
                            _db.DepartmentTranslations
                          .Where(r => r.LanguageId == currentLanguageId && r.Department.Status != (int)GeneralEnums.StatusEnum.Deleted && departmentForcurrentLan.Contains(r.DepartmentId)))
                         .ToList();

            if (!searchText.IsNullOrWhiteSpace())
            {
                departments = departments
                    .Where(r =>
                                (r.Name.Contains(searchText) || r.Description.Contains(searchText))).ToList();
                ViewBag.searchText = searchText;
            }
            var result = departments.ToList().Select(x =>
                   new DepartmentViewModel()
                   {
                       Id = x.DepartmentId,
                       Name = x.Name,
                       Status = x.Department.Status,
                       Description = x.Description,
                       CreatedOn = x.Department.CreatedOn,
                       DeletedOn = x.Department.DeletedOn,
                       CreatedBy = x.Department.CreatedBy
                   });

            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            var pageNumber = (page ?? 1);
            return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Create")]
        public JsonResult AddDepartment(DepartmentViewModel department)
        {
            try
            {
                int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

                #region Add Department
                var men = new Department()
                {
                    CreatedBy = User.Identity.Name,
                    CreatedOn = DateTime.Now,
                    Status = department.Status
                };
                _db.Departments.Add(men);
                _db.SaveChanges();

                var menTrans = new DepartmentTranslation()
                {
                    DepartmentId = men.Id,
                    Description = department.Description,
                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                    LanguageId = languageId,
                    Name = department.Name

                };
                _db.DepartmentTranslations.Add(menTrans);
                if (!menTrans.IsDefault)
                {
                    var menTrans1 = new DepartmentTranslation()
                    {
                        DepartmentId = men.Id,
                        Description = department.Description,
                        IsDefault = true,
                        LanguageId = CultureHelper.GetDefaultLanguageId(),
                        Name = department.Name
                        
                    };
                    _db.DepartmentTranslations.Add(menTrans1);
                }

                _db.SaveChanges();


                #endregion


                return Json(department, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new Department");
                return null;
            }
        }

        [HttpGet]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Edit")]
        public JsonResult EditDepartment(int id, int languageId)
        {
            try
            {

                var men = _db.Departments.Find(id);
                if (men != null && men.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    var department = LanguageFallbackHelper.GetDepartment(id, languageId);
                    return Json(department, JsonRequestBehavior.AllowGet);
                }


                return Json(null, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Department (Get)");
                return null;
            }
        }
        [HttpPost]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Edit")]
        public JsonResult EditDepartment(DepartmentViewModel department)
        {
            try
            {
                var depa = _db.Departments.Find(department.Id);
                if (depa != null && depa.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    depa.Status = department.Status;
                    _db.Entry(depa).State = EntityState.Modified;
                    _db.SaveChanges();


                    var depTrans = _db.DepartmentTranslations.FirstOrDefault(r => r.DepartmentId == depa.Id && r.LanguageId == department.LanguageId);
                    if (depTrans != null)
                    {
                        depTrans.Name = department.Name;
                        depTrans.Description = department.Description;
                        _db.Entry(depTrans).State = EntityState.Modified;
                    }
                    else
                    {
                        depTrans = new DepartmentTranslation()
                        {
                            DepartmentId = depa.Id,
                            Description = department.Description,
                            IsDefault = false,
                            LanguageId = department.LanguageId,
                            Name = department.Name
                        };
                        _db.DepartmentTranslations.Add(depTrans);
                    }

                    _db.SaveChanges();
                }


                return Json(department, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Department (Post)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Settings", PermissionKey = "Delete")]
        public JsonResult DeleteDepartment(int id)
        {
            try
            {
                var depa = _db.Departments.Find(id);
                if (depa != null && depa.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    depa.Status = (int)GeneralEnums.StatusEnum.Deleted;
                    _db.Entry(depa).State = EntityState.Modified;
                    _db.SaveChanges();

                    var department = _db.DepartmentTranslations.FirstOrDefault(r => r.DepartmentId == id);
                    return Json(new DepartmentViewModel()
                    {
                        Id = department.DepartmentId,
                        Name = department.Name,
                        Status = department.Department.Status,
                        Description = department.Description,
                        CreatedOn = department.Department.CreatedOn,
                        DeletedOn = department.Department.DeletedOn,
                        LanguageId = department.LanguageId,
                        CreatedBy = department.Department.CreatedBy
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);
            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting Department");
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