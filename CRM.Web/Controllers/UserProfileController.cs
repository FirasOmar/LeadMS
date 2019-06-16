using System;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CRM.Core.Helpers;
using CRM.DataEntity.Models;
using CRM.Web.Filters;
using CRM.Web.Helpers;
using CRM.Web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity.Owin;
using PagedList;
using CRM.Core.SystemEnums;
using CRM.Core.Models;

namespace CRM.Web.Controllers
{
    public class UserProfileController : BaseController
    {
        private ApplicationUserManager _userManager;
        public UserProfileController()
        {
        }

        public UserProfileController(ApplicationUserManager userManager)
        {
            UserManager = userManager;
        }
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        private readonly CrmSystemEntities _db = new CrmSystemEntities();

        [CustomAuthentication(PageName = "Users", PermissionKey = "View")]
        public ActionResult Index(int? page, string searchText, int resetTo = 0)
        {

            if (resetTo == 1)
            {
                page = 1;
            }
            var genders = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Gender,
                Request.Cookies["_culture"]);
            var prefferdLanguage = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.PrefferdLanguage,
                Request.Cookies["_culture"]);
            var roles = _db.AspNetRoles.ToList();
            var departments = LookupHelper.GetDepartments(Request.Cookies["_culture"]);
            var managers = LookupHelper.GetEmployees(Request.Cookies["_culture"]);
            var martialStatuses =
                LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.MartialStatus,
                    Request.Cookies["_culture"]);
            var statuses = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
            ViewBag.Status = new SelectList(statuses, "Id", "Name");
            ViewBag.RoleList = new SelectList(roles, "Id", "Name");
            ViewBag.DepartmentsList = new SelectList(departments, "Id", "Name");
            ViewBag.DepartmentsListEdit = new SelectList(departments, "Id", "Name");
            ViewBag.StatusEdit = new SelectList(statuses, "Id", "Name");
            ViewBag.GenderLookupId = new SelectList(genders, "Id", "Name");
            ViewBag.GenderLookupIdEdit = new SelectList(genders, "Id", "Name");
            ViewBag.PrefferdLanguage = new SelectList(prefferdLanguage, "Id", "Name");
            ViewBag.PrefferdLanguageEdit = new SelectList(prefferdLanguage, "Id", "Name");

            ViewBag.ManagerId = new SelectList(managers, "Id", "FullName");
            ViewBag.ManagerIdEdit = new SelectList(managers, "Id", "FullName");
            ViewBag.MartialStatusLookupId = new SelectList(martialStatuses, "Id", "Name");
            ViewBag.MartialStatusLookupIdEdit = new SelectList(martialStatuses, "Id", "Name");

            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

            var userProfilesForcurrentLan = _db.UserProfileTranslations
                                  .Where(r => (r.LanguageId == currentLanguageId) &&
                                 r.UserProfile.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(c => c.UserProfileId);
            var userProfiles = _db.UserProfileTranslations
                          .Where(r => (r.IsDefault) &&
                         r.UserProfile.Status != (int)GeneralEnums.StatusEnum.Deleted && !userProfilesForcurrentLan.Contains(r.UserProfileId))
                         .Union(
                            _db.UserProfileTranslations
                          .Where(r => r.LanguageId == currentLanguageId && r.UserProfile.Status != (int)GeneralEnums.StatusEnum.Deleted && userProfilesForcurrentLan.Contains(r.UserProfileId)))
                         .ToList();

            if (!searchText.IsNullOrWhiteSpace())
            {
                userProfiles = userProfiles
                    .Where(r =>
                                (r.FullName.Contains(searchText) || r.FullName.Contains(searchText)
                                 || r.UserProfile.Mobile.Contains(searchText) || r.UserProfile.PhoneNumber.Contains(searchText))).ToList();
                ViewBag.searchText = searchText;
            }
            var result = userProfiles.ToList().Select(x =>
                   new ProfileViewModel()
                   {
                       Id = x.UserProfileId,
                       LanguageId = x.LanguageId,
                       IdNumber = x.UserProfile.IdNumber,
                       PhoneNumber = x.UserProfile.PhoneNumber,
                       GenderLookupId = x.UserProfile.GenderLookupId,
                       MartialStatusLookupId = x.UserProfile.MartialStatusLookupId,
                       FullName = x.FullName,
                       Address = x.Address,
                       Mobile = x.UserProfile.Mobile,
                       Username = x.UserProfile.Username,
                       Email = x.UserProfile.Email,
                       Fax = x.UserProfile.Fax,
                       BirthDay = x.UserProfile.Birthday,
                       Status = x.UserProfile.Status,
                       CityId = x.UserProfile.CityId,
                       ProvinceId = x.UserProfile.ProvinceId,
                       RegionId = x.UserProfile.RegionId,
                       LastLogin = x.UserProfile.LastLogin,
                       ManagerId = x.UserProfile.ManagerId,
                       ManagerName = x.UserProfile?.ManagerId != null ? LanguageFallbackHelper.GetUserProfile((int)x.UserProfile.ManagerId, currentLanguageId)?.FullName : string.Empty,
                       Department = x.UserProfile.DepartmentId,
                       DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, currentLanguageId)?.Name : string.Empty,
                       PrefferdLanguage = x.UserProfile.PreferedLanguageId
                   });

            int pageSize = int.Parse(SettingHelper.GetOrCreate(Core.Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            var pageNumber = (page ?? 1);

            return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Create")]
        public JsonResult AddProfile(ProfileViewModel profile)
        {
            var account = _db.UserProfiles.FirstOrDefault(r => r.Username != profile.Email && r.Status == (int)GeneralEnums.StatusEnum.Deleted);
            if (account != null && account.Status == (int)GeneralEnums.StatusEnum.Deactive)
            {
                string Msg = "تم تعطيل هذا الحساب من قبل المسؤول ";

                return Json(new { Id = 0, Msg = Msg }, JsonRequestBehavior.AllowGet);
            }

            var user = new ApplicationUser { UserName = profile.Email, Email = profile.Email };
            var result = UserManager.CreateAsync(user, profile.Password);
            int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
            if (result.Result.Succeeded)
            {
                string customerId = null;

                try
                {
                    var profil = new UserProfile()
                    {
                        Fax = profile.Fax,
                        Birthday = profile.BirthDay,
                        CreatedOn = DateTime.Now,
                        GenderLookupId = profile.GenderLookupId,
                        ProvinceId = profile.ProvinceId,
                        CityId = profile.CityId,
                        RegionId = profile.RegionId,
                        IdNumber = profile.IdNumber ?? string.Empty,
                        PhoneNumber = profile.PhoneNumber ?? string.Empty,
                        Mobile = profile.Mobile ?? string.Empty,
                        MartialStatusLookupId = profile.MartialStatusLookupId,
                        ManagerId = profile.ManagerId,
                        DepartmentId = profile.Department,
                        PreferedLanguageId = profile.PrefferdLanguage,
                        Status = (int)GeneralEnums.StatusEnum.Active,
                        Username = profile.Username,
                        Email = profile.Email
                    };
                    _db.UserProfiles.Add(profil);
                    _db.SaveChanges();

                    var profTrans = new UserProfileTranslation()
                    {
                        Address = profile.Address,
                        FullName = profile.FullName,
                        IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                        LanguageId = languageId,
                        UserProfileId = profil.Id
                    };
                    _db.UserProfileTranslations.Add(profTrans);
                    if (!profTrans.IsDefault)
                    {
                        var profTrans1 = new UserProfileTranslation()
                        {
                            Address = profile.Address ?? string.Empty,
                            FullName = profile.FullName,
                            IsDefault = true,
                            LanguageId = CultureHelper.GetDefaultLanguageId(),
                            UserProfileId = profil.Id

                        };
                        _db.UserProfileTranslations.Add(profTrans1);
                    }

                    _db.SaveChanges();

                    return Json(profile, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    LogHelper.LogException(User.Identity.Name, ex, "Error While adding new profile");
                    UserManager.Delete(user);
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Edit")]
        public JsonResult AddHoliday(UserHoliydayviewModel holiday)
        {
            try
            {
                var result = _db.UserProfileHolidays.Add(new UserProfileHoliday()
                {
                    UserProfileId = holiday.UserProfileId,
                    CreatedBy = User.Identity.Name,
                    CreatedOn = DateTime.Now,
                    Description = holiday.Description,
                    HolidayDate = holiday.HolidayDate,
                    Status = (int) GeneralEnums.StatusEnum.Active
                });
                _db.SaveChanges();
                holiday.Id = result.Id;

                var userHolidays = _db.UserProfileHolidays.Where(r => r.UserProfileId == holiday.UserProfileId && r.Status != (int)GeneralEnums.StatusEnum.Deleted);
                holiday.UserHolidays = userHolidays.ToList().Select(r => new UserHoliydayviewModel()
                {
                    Id = r.Id,
                    Description = r.Description,
                    HolidayDate = r.HolidayDate
                }).ToList();
                return Json(holiday, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new user holiday");
                return null;
            }
        }

        [HttpGet]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Edit")]
        public JsonResult EditHoliday(int id)
        {
            try
            {

                var holiday = _db.UserProfileHolidays.Find(id);
                if (holiday != null && holiday.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    var result = new UserHoliydayviewModel()
                    {
                        UserProfileId = holiday.UserProfileId,
                        Status = holiday.Status,
                        Description = holiday.Description,
                        Id = holiday.Id,
                        HolidayDate = holiday.HolidayDate
                    };

                    return Json(result, JsonRequestBehavior.AllowGet);
                }

                return Json(null, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing user holiday (Get)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Edit")]
        public JsonResult EditHoliday(UserHoliydayviewModel item)
        {
            try
            {
                var holiday = _db.UserProfileHolidays.Find(item.Id);
                if (holiday != null && holiday.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    holiday.Description = item.Description;
                    holiday.HolidayDate = item.HolidayDate;

                    _db.Entry(holiday).State = EntityState.Modified;
                    _db.SaveChanges();

                    var userHolidays = _db.UserProfileHolidays.Where(r => r.UserProfileId == holiday.UserProfileId && r.Status != (int)GeneralEnums.StatusEnum.Deleted);
                    item.UserHolidays = userHolidays.ToList().Select(r => new UserHoliydayviewModel()
                    {
                        Id = r.Id,
                        Description = r.Description,
                        HolidayDate = r.HolidayDate
                    }).ToList();
                }

                return Json(item, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing profile (Post)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Edit")]
        public JsonResult DeleteHoliday(int id)
        {
            try
            {
                var holiday = _db.UserProfileHolidays.Find(id);
                if (holiday != null && holiday.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    holiday.Status = (int)GeneralEnums.StatusEnum.Deleted;
                    _db.Entry(holiday).State = EntityState.Modified;
                    _db.SaveChanges();

                    var userHolidays = _db.UserProfileHolidays.Where(r => r.UserProfileId == holiday.UserProfileId && r.Status != (int)GeneralEnums.StatusEnum.Deleted);
                    var userHolidaysList = userHolidays.ToList().Select(r => new UserHoliydayviewModel()
                    {
                        Id = r.Id,
                        Description = r.Description,
                        HolidayDate = r.HolidayDate
                    }).ToList();

                    return Json(new UserHoliydayviewModel()
                    {
                        Id = holiday.Id,
                        UserProfileId = holiday.UserProfileId,
                        Description = holiday.Description,
                        HolidayDate = holiday.HolidayDate,
                        UserHolidays = userHolidaysList
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);
            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting profile");
                return null;
            }
        }

        [HttpGet]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Edit")]
        public JsonResult EditProfile(int id, int languageId)
        {
            try
            {

                var prof = _db.UserProfiles.Find(id);
                if (prof != null && prof.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    var aspUser = _db.AspNetUsers.FirstOrDefault(r => r.UserName == prof.Username);
                    var profile =
                        _db.UserProfileTranslations.FirstOrDefault(r =>
                            r.UserProfileId == id && r.LanguageId == languageId);
                    if (profile == null)
                    {
                        profile = _db.UserProfileTranslations.FirstOrDefault(r =>
                            r.UserProfileId == id && r.IsDefault);
                    }
                    var result = new ProfileViewModel()
                    {
                        Id = profile.UserProfileId,
                        LanguageId = profile.LanguageId,
                        IdNumber = profile.UserProfile.IdNumber ?? string.Empty,
                        PhoneNumber = profile.UserProfile.PhoneNumber ?? string.Empty,
                        GenderLookupId = profile.UserProfile.GenderLookupId,
                        ProvinceId = profile.UserProfile.ProvinceId,
                        CityId = profile.UserProfile.CityId,
                        RegionId = profile.UserProfile.RegionId,
                        StatusEditDescription = profile.UserProfile.StatusEditDescription,
                        MartialStatusLookupId = profile.UserProfile.MartialStatusLookupId,
                        PrefferdLanguage = profile.UserProfile.PreferedLanguageId,
                        Department = profile.UserProfile.DepartmentId,
                        ManagerId = profile.UserProfile.ManagerId,
                        FullName = profile.FullName,
                        Mobile = profile.UserProfile.Mobile ?? string.Empty,
                        Address = profile.Address ?? string.Empty,
                        Email = profile.UserProfile.Email,
                        Username = profile.UserProfile.Username,
                        Fax = profile.UserProfile.Fax ?? string.Empty,
                        BirthDay = profile.UserProfile.Birthday,
                        Status = profile.UserProfile.Status,
                    };

                    var userOffDays = _db.UserProfileOffDays.Where(r => r.UserProfileId == prof.Id);
                    result.WeekDaysOff = userOffDays.ToList().Select(r => int.Parse(r.WeekDay)).ToList();
                    var userRoles = aspUser?.AspNetUserRoles.ToList().Select(r =>
                        new RoleViewModel()
                        {
                            Name = r.AspNetRole.Name,
                            UserId = profile.UserProfileId,
                            RoleId = r.RoleId
                        }).ToList();

                    var userHolidays = _db.UserProfileHolidays.Where(r => r.UserProfileId == prof.Id && r.Status != (int)GeneralEnums.StatusEnum.Deleted);
                    result.UserHolidays = userHolidays.ToList().Select(r=> new UserHoliydayviewModel()
                    {
                        Id = r.Id,
                        Description = r.Description,
                        HolidayDate = r.HolidayDate
                    }).ToList();
                    result.Roles = userRoles;

                    return Json(result, JsonRequestBehavior.AllowGet);
                }


                return Json(null, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing profile (Get)");
                return null;
            }
        }
        [HttpPost]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Edit")]
        public JsonResult EditProfile(ProfileViewModel profile)
        {
            try
            {
                var prof = _db.UserProfiles.Find(profile.Id);
                if (prof != null && prof.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    prof.Birthday = profile.BirthDay;
                    prof.Fax = profile.Fax ?? string.Empty;
                    prof.GenderLookupId = profile.GenderLookupId;
                    prof.ProvinceId = profile.ProvinceId;
                    prof.CityId = profile.CityId;
                    prof.RegionId = profile.RegionId;
                    prof.Email = profile.Email;
                    prof.MartialStatusLookupId = profile.MartialStatusLookupId;
                    prof.DepartmentId = profile.Department;
                    prof.ManagerId = profile.ManagerId;
                    prof.PreferedLanguageId = profile.PrefferdLanguage;
                    prof.PhoneNumber = profile.PhoneNumber ?? string.Empty;
                    prof.Mobile = profile.Mobile ?? string.Empty;
                    prof.IdNumber = profile.IdNumber ?? string.Empty;
                    prof.Status = profile.Status;
                    prof.StatusEditDescription = profile.Status != (int)GeneralEnums.StatusEnum.Active ? profile.StatusEditDescription : string.Empty;
                    _db.Entry(prof).State = EntityState.Modified;
                    _db.SaveChanges();

                    int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

                    var profTrans = _db.UserProfileTranslations.FirstOrDefault(r => r.UserProfileId == prof.Id && r.LanguageId == profile.LanguageId);
                    if (profTrans != null)
                    {
                        profTrans.Address = profile.Address ?? string.Empty;
                        profTrans.FullName = profile.FullName;
                        _db.Entry(profTrans).State = EntityState.Modified;
                    }
                    else
                    {
                        profTrans = new UserProfileTranslation()
                        {
                            UserProfileId = prof.Id,
                            Address = profile.Address,
                            IsDefault = false,
                            LanguageId = profile.LanguageId,
                            FullName = profile.FullName
                        };
                        _db.UserProfileTranslations.Add(profTrans);
                    }

                    _db.SaveChanges();

                    var userOffDays = _db.UserProfileOffDays.Where(r => r.UserProfileId == prof.Id);
                    foreach (var day in userOffDays)
                    {
                        _db.UserProfileOffDays.Remove(day);
                    }

                    _db.SaveChanges();
                    foreach (var dayId in profile.WeekDaysOff)
                    {
                        _db.UserProfileOffDays.Add(new UserProfileOffDay()
                        {
                            UserProfileId = prof.Id,
                            CreatedOn = DateTime.Now,
                            CreatedBy = User.Identity.Name,
                            Status = (int)GeneralEnums.StatusEnum.Active,
                            WeekDay = dayId.ToString()
                        });
                    }
                    _db.SaveChanges();
                }

                return Json(profile, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing profile (Post)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Edit")]
        public JsonResult AddRole(RoleViewModel role)
        {
            try
            {
                string roleId = role.RoleId;
                var userProfile = _db.UserProfiles.Find(role.UserId);
                var aspUser = _db.AspNetUsers.FirstOrDefault(r => r.UserName == userProfile.Username);
                if (!_db.AspNetUserRoles.Any(r => r.UserId == aspUser.Id && r.RoleId == roleId))
                {
                    _db.AspNetUserRoles.Add(new AspNetUserRole()
                    {
                        RoleId = roleId,
                        UserId = aspUser.Id
                    });
                    _db.SaveChanges();
                }

                var userRoles = aspUser?.AspNetUserRoles.ToList().Select(r =>
                    new RoleViewModel()
                    {
                        Name = _db.AspNetRoles.Find(r.RoleId)?.Name,
                        UserId = role.UserId,
                        RoleId = r.RoleId
                    }).ToList();

                return Json(new UserRolesViewModel()
                {
                    UserId = role.UserId,
                    Roles = userRoles
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While adding user role (Post)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Edit")]
        public JsonResult DeleteRole(RoleViewModel role)
        {
            try
            {
                string roleId = role.RoleId.ToString();
                var userProfile = _db.UserProfiles.Find(role.UserId);
                var aspUser = _db.AspNetUsers.FirstOrDefault(r => r.UserName == userProfile.Username);
                var aspRole = _db.AspNetUserRoles.FirstOrDefault(r => r.UserId == aspUser.Id && r.RoleId == roleId);
                if (aspRole != null)
                {
                    _db.AspNetUserRoles.Remove(aspRole);
                    _db.SaveChanges();
                }

                var userRoles = aspUser?.AspNetUserRoles.ToList().Select(r =>
                    new RoleViewModel()
                    {
                        Name = r.AspNetRole.Name,
                        UserId = role.UserId,
                        RoleId = r.RoleId
                    }).ToList();

                return Json(new UserRolesViewModel()
                {
                    UserId = role.UserId,
                    Roles = userRoles
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting user role (Post)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Users", PermissionKey = "Delete")]
        public JsonResult DeleteProfile(int id)
        {
            try
            {
                var prof = _db.UserProfiles.Find(id);
                if (prof != null && prof.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    prof.Status = (int)GeneralEnums.StatusEnum.Deleted;
                    _db.Entry(prof).State = EntityState.Modified;
                    _db.SaveChanges();

                    var profile = _db.UserProfileTranslations.FirstOrDefault(r => r.UserProfileId == id);
                    return Json(new ProfileViewModel()
                    {
                        Id = profile.UserProfileId,
                        LanguageId = profile.LanguageId,
                        IdNumber = profile.UserProfile.IdNumber,
                        PhoneNumber = profile.UserProfile.PhoneNumber,
                        GenderLookupId = profile.UserProfile.GenderLookupId,
                        ProvinceId = profile.UserProfile.ProvinceId,
                        CityId = profile.UserProfile.CityId,
                        RegionId = profile.UserProfile.RegionId,
                        MartialStatusLookupId = profile.UserProfile.MartialStatusLookupId,
                        Department = profile.UserProfile.DepartmentId,
                        ManagerId = profile.UserProfile.ManagerId,
                        PrefferdLanguage = profile.UserProfile.PreferedLanguageId,
                        FullName = profile.FullName,
                        Address = profile.Address,
                        Username = profile.UserProfile.Username,
                        Email = profile.UserProfile.Email,
                        Fax = profile.UserProfile.Fax,
                        BirthDay = profile.UserProfile.Birthday,
                        Status = profile.UserProfile.Status
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);
            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting profile");
                return null;
            }
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _db.Dispose();

                if (_userManager != null)
                {
                    _userManager.Dispose();
                    _userManager = null;
                }
            }
            base.Dispose(disposing);
        }
    }
}