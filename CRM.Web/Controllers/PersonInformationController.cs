using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.Core.Models;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Filters;
using CRM.Web.Helpers;
using CRM.Web.Models;
using PagedList;

namespace CRM.Web.Controllers
{
    public class PersonInformationController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        [CustomAuthentication(PageName = "PersonInformation", PermissionKey = "List")]
        public ActionResult Index(int? page, int? typeId, string searchText, int resetTo = 0)
        {
            if (resetTo == 1)
            {
                page = 1;
            }
            ViewBag.SearchText = searchText;
            ViewBag.TypeId = typeId;
            var citizens = _db.AspNetUserRoles.Where(r => r.AspNetRole.Name == Constants.Roles.Citizen)
                .Select(r => r.AspNetUser.UserName).ToList();
            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
            var userProfilesForcurrentLan = _db.UserProfileTranslations
                .Where(r => (r.LanguageId == currentLanguageId) &&
                            r.UserProfile.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(c => c.UserProfileId);
            var userProfiles = _db.UserProfileTranslations
                .Where(r => (r.IsDefault) &&
                            r.UserProfile.Status != (int) GeneralEnums.StatusEnum.Deleted &&
                            !userProfilesForcurrentLan.Contains(r.UserProfileId))
                .Union(
                    _db.UserProfileTranslations
                        .Where(r => r.LanguageId == currentLanguageId &&
                                    r.UserProfile.Status != (int) GeneralEnums.StatusEnum.Deleted &&
                                    userProfilesForcurrentLan.Contains(r.UserProfileId)));
            userProfiles = userProfiles.Where(r => citizens.Contains(r.UserProfile.Username));
            

            if (typeId != null)
            {
                switch (typeId)
                {
                    case (int) GeneralEnums.PersonInformationTypeEnum.Name:
                        userProfiles = userProfiles.Where(r => r.FullName.Contains(searchText));
                        break;
                    case (int)GeneralEnums.PersonInformationTypeEnum.Email:
                        userProfiles = userProfiles.Where(r => r.UserProfile.Email.Contains(searchText));
                        break;
                    case (int)GeneralEnums.PersonInformationTypeEnum.Mobile:
                        userProfiles = userProfiles.Where(r =>
                            r.UserProfile.Mobile.Contains(searchText) ||
                            r.UserProfile.PhoneNumber.Contains(searchText) || r.UserProfile.Fax.Contains(searchText));
                        break;
                    case (int)GeneralEnums.PersonInformationTypeEnum.Identity:
                        userProfiles = userProfiles.Where(r => r.UserProfile.IdNumber.Contains(searchText));
                        break;
                }
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

            var pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            var pageNumber = page ?? 1;
            return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
        }
        [CustomAuthentication(PageName = "PersonInformation", PermissionKey = "View")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var langId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
            var profile = LanguageFallbackHelper.GetUserProfile((int) id, langId);
            if (profile == null || profile.Status == (int)GeneralEnums.StatusEnum.Deleted)
            {
                return HttpNotFound();
            }

            var systemCases = _db.SystemCases.Where(x => x.CreatedBy == profile.Username).ToList().Where(x => x.CreatedBy == profile.Username).ToList().Select(x => new CaseViewModel
            {
                Id = x.Id,
                Status = x.Status,
                Description = x.Description,
                CreatedOn = x.CreatedOn,
                DeletedOn = x.DeletedOn,
                CreatedBy = x.CreatedBy,
                Tags = x.Tags,
                Title = x.Title,
                Address = x.Address,
                Location = x.Location,
                TypeId = x.TypeId,
                AssigneeId = x.AssigneeId,
                AssigneeName = x.AssigneeId != null ?
                           LanguageFallbackHelper.GetUserProfile((int)x.AssigneeId, langId)?.FullName ??
                           string.Empty : string.Empty,
                CategoryId = x.CategoryId,
                CategoryName = x.CategoryId != null ? LookupHelper.GetLookupDetailsById((int)x.CategoryId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
                PriorityId = x.PriorityId,
                PriorityName = x.PriorityId != null ? LookupHelper.GetLookupDetailsById((int)x.PriorityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
                SeverityId = x.SeverityId,
                SeverityName = x.SeverityId != null ? LookupHelper.GetLookupDetailsById((int)x.SeverityId, Request.Cookies["_culture"])?.Name ?? string.Empty : string.Empty,
                UniqueId = x.UniqueId
                    }).ToList();
            
           var result = new CitizenProfileViewModel()
           {
               Status = profile.Status,
               Address = profile.Address,
               Id = profile.Id,
               ManagerId = profile.ManagerId,
               Department = profile.Department,
               PrefferdLanguage = profile.PrefferdLanguage,
               Username = profile.Username,
               FullName = profile.FullName,
               Email = profile.Email,
               WeekDaysOff = profile.WeekDaysOff,
               LanguageId = profile.LanguageId,
               LastLogin = profile.LastLogin,
               CityId = profile.CityId,
               ManagerName = profile.ManagerName,
               UserHolidays = profile.UserHolidays,
               Password = profile.Password,
               DepartmentName = profile.DepartmentName,
               IdNumber = profile.IdNumber,
               BirthDay = profile.BirthDay,
               CityCode = profile.CityCode,
               CityName = profile.CityName,
               ConfirmPassword = profile.ConfirmPassword,
               CustomerId = profile.CustomerId,
               Fax = profile.Fax,
               GenderCode = profile.GenderCode,
               GenderLookupId = profile.GenderLookupId,
               GenderLookupName = profile.GenderLookupName,
               MartialStatusCode = profile.MartialStatusCode,
               MartialStatusLookupId = profile.MartialStatusLookupId,
               MartialStatusLookupName = profile.MartialStatusLookupName,
               Mobile = profile.Mobile,
               PhoneNumber = profile.PhoneNumber,
               PrefferdLanguageName = profile.PrefferdLanguageName,
               ProfilePath = profile.ProfilePath,
               ProvinceCode = profile.ProvinceCode,
               ProvinceId = profile.ProvinceId,
               ProvinceName = profile.ProvinceName,
               RegionId = profile.RegionId,
               RegionName = profile.RegionName,
               Roles = profile.Roles,
               Cases = systemCases
           };
            var prefferdLanguage = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.PrefferdLanguage,
                Request.Cookies["_culture"]);
            ViewBag.PrefferdLanguage = new SelectList(prefferdLanguage, "Id", "Name", profile.PrefferdLanguage);
            ViewBag.GenderLookupId =
                new SelectList(
                    LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Gender,
                        Request.Cookies["_culture"]), "Id", "Name");
            ViewBag.MartialStatusLookupId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.MartialStatus, Request.Cookies["_culture"]), "Id", "Name", profile.MartialStatusLookupId);
            ViewBag.ProvinceId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Province, Request.Cookies["_culture"]), "Id", "Name", profile.ProvinceId);
            ViewBag.RegionId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Region, Request.Cookies["_culture"]), "Id", "Name", profile.RegionId);
            ViewBag.CityId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.City, Request.Cookies["_culture"]), "Id", "Name", profile.CityId);

            return View(result);
        }
        [HttpPost]
        [CustomAuthentication(PageName = "PersonInformation", PermissionKey = "Edit")]
        public ActionResult Details(CitizenProfileViewModel profile)
        {
            int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
            try
            {
                if (profile.LanguageId == 0)
                    profile.LanguageId = CultureHelper.GetDefaultLanguageId();

                var userProfile = _db.UserProfiles.Find(profile.Id);

                if (userProfile != null)
                {
                    userProfile.GenderLookupId = profile.GenderLookupId;
                    userProfile.PreferedLanguageId = profile.PrefferdLanguage;
                    userProfile.Birthday = profile.BirthDay;
                    userProfile.Fax = profile.Fax;
                    userProfile.IdNumber = profile.IdNumber;
                    userProfile.PhoneNumber = profile.PhoneNumber;
                    userProfile.RegionId = profile.RegionId;
                    userProfile.CityId = profile.CityId;
                    userProfile.ProvinceId = profile.ProvinceId;
                    userProfile.MartialStatusLookupId = profile.MartialStatusLookupId;
                    userProfile.ProfilePhoto = profile.ProfilePath;
                    userProfile.Mobile = profile.Mobile;

                    _db.Entry(userProfile).State = EntityState.Modified;
                    _db.SaveChanges();
                    
                    var userProfileTrans = _db.UserProfileTranslations.FirstOrDefault(r =>
                        r.UserProfileId == userProfile.Id && r.LanguageId == profile.LanguageId);
                    if (userProfileTrans != null)
                    {
                        userProfileTrans.FullName = profile.FullName;
                        userProfileTrans.Address = profile.Address;
                        _db.Entry(userProfileTrans).State = EntityState.Modified;
                    }
                    else
                    {
                        userProfileTrans = new UserProfileTranslation()
                        {
                            UserProfileId = userProfile.Id,
                            IsDefault = false,
                            LanguageId = profile.LanguageId,
                            FullName = profile.FullName,
                            Address = profile.Address,
                        };
                        _db.UserProfileTranslations.Add(userProfileTrans);
                    }
                }

                _db.SaveChanges();
                return RedirectToAction("Details", new {id = profile.Id});
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While Updating profile");
            }
            var prefferdLanguage = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.PrefferdLanguage,
                Request.Cookies["_culture"]);
            ViewBag.PrefferdLanguage = new SelectList(prefferdLanguage, "Id", "Name", profile.PrefferdLanguage);
            ViewBag.GenderLookupId =
                new SelectList(
                    LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Gender,
                        Request.Cookies["_culture"]), "Id", "Name");
            ViewBag.MartialStatusLookupId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.MartialStatus, Request.Cookies["_culture"]), "Id", "Name", profile.MartialStatusLookupId);
            ViewBag.ProvinceId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Province, Request.Cookies["_culture"]), "Id", "Name", profile.ProvinceId);
            ViewBag.RegionId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Region, Request.Cookies["_culture"]), "Id", "Name", profile.RegionId);
            ViewBag.CityId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.City, Request.Cookies["_culture"]), "Id", "Name", profile.CityId);

            return View(profile);
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