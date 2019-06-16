using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using CRM.Core.Helpers;
using CRM.Core.Models;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Controllers.APIs.Responses;
using CRM.Web.Helpers;
using CRM.Web.Models;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
namespace CRM.Web.Controllers.APIs
{
    [RoutePrefix("api/account")]
    public class AccountController : ApiController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();

        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public AccountController()
        {
        }
        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.Current.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }


        [AllowAnonymous]
        [Route("login")]
        public IHttpActionResult Login(string username, string password)
        {
            AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
                var langId = lang == "ar"
                    ? (int)GeneralEnums.LanguageEnum.Arabic
                    : (int)GeneralEnums.LanguageEnum.English;
                var user = UserManager.FindByName(username);
                var isAllowed = SignInManager.UserManager.CheckPassword(user, password);
                var roles = _db.AspNetUserRoles.Where(r => r.UserId == user.Id).ToList().Select(r => new RoleViewModel()
                {
                    Name = r.AspNetRole.Name,
                    RoleId = r.RoleId
                }).ToList();
                var allowedRoles = SettingHelper.GetOrCreate(Core.Constants.SystemSettings.AllowedRolesForMobile, "Administrator,citizen,User").Value.Split(',');
                var hasValidRole = roles.Any(r => allowedRoles.Contains(r.Name));
                if (isAllowed && hasValidRole)
                {

                    var profile =
                        _db.UserProfileTranslations.FirstOrDefault(r =>
                            r.UserProfile.Username == username &&
                            r.LanguageId == langId);
                    if (profile == null)
                    {
                        profile = _db.UserProfileTranslations.FirstOrDefault(r =>
                            r.UserProfile.Username == username && r.IsDefault);
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
                        ProfilePath = profile.UserProfile.ProfilePhoto,
                        Roles = roles
                    };
                    return Ok(result);
                }
                else
                {
                    return Content(HttpStatusCode.Forbidden, new BaseApiResponse()
                    {
                        StatusCode = HttpStatusCode.Forbidden,
                        Message = Core.Constants.Errors.Apis.ErrorLoginNoAccess
                    });
                }
            }
            catch (Exception ex)
            {
                LogHelper.LogException(Core.Constants.Users.Mobile, ex, Core.Constants.Errors.Apis.ErrorLogin);
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Core.Constants.Errors.Apis.ErrorLogin
                });
            }
        }

        [AllowAnonymous]
        [Route("getuserprofile")]
        public IHttpActionResult GetUserProfile(string username)
        {
            AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
                var langId = lang == "ar"
                    ? (int)GeneralEnums.LanguageEnum.Arabic
                    : (int)GeneralEnums.LanguageEnum.English;


                var profile =
                    _db.UserProfileTranslations.FirstOrDefault(r =>
                        r.UserProfile.Username == username &&
                        r.LanguageId == langId);
                if (profile == null)
                {
                    profile = _db.UserProfileTranslations.FirstOrDefault(r =>
                        r.UserProfile.Username == username && r.IsDefault);
                }

                var result = new ProfileViewModel
                {
                    Id = profile.UserProfileId,
                    LanguageId = profile.LanguageId,
                    IdNumber = profile.UserProfile.IdNumber ?? string.Empty,
                    PhoneNumber = profile.UserProfile.PhoneNumber ?? string.Empty,
                    GenderLookupId = profile.UserProfile.GenderLookupId,
                    ProvinceId = profile.UserProfile.ProvinceId,
                    CityId = profile.UserProfile.CityId,
                    RegionId = profile.UserProfile.RegionId,
                    MartialStatusLookupId = profile.UserProfile.MartialStatusLookupId,
                    PrefferdLanguage = profile.UserProfile.PreferedLanguageId,
                    Department = profile.UserProfile.DepartmentId,
                    ManagerId = profile.UserProfile.ManagerId,
                    FullName = profile.FullName,
                    Mobile = profile.UserProfile.Mobile ?? string.Empty,
                    Address = profile.Address ?? string.Empty,
                    Email = profile.UserProfile.Email,
                    Username = profile.UserProfile.Username,
                    CustomerId = profile.UserProfile.Username,
                    Fax = profile.UserProfile.Fax ?? string.Empty,
                    BirthDay = profile.UserProfile.Birthday,
                    ProfilePath = profile.UserProfile.ProfilePhoto
                };
                return Ok(result);

            }
            catch (Exception ex)
            {
                LogHelper.LogException(Core.Constants.Users.Mobile, ex, Core.Constants.Errors.Apis.ErrorGetProfileInfo);
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Core.Constants.Errors.Apis.ErrorGetProfileInfo
                });
            }
        }

        [AllowAnonymous]
        [Route("getuserprofiles")]
        public IHttpActionResult GetUserProfiles(string username)
        {
            AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var employees = _db.AspNetUserRoles.Where(r => r.AspNetRole.Name != Core.Constants.Roles.Citizen)
                .Select(r => r.AspNetUser.UserName).ToList();
                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
                var langId = lang == "ar"
                    ? (int)GeneralEnums.LanguageEnum.Arabic
                    : (int)GeneralEnums.LanguageEnum.English;


                var profiles =
                    _db.UserProfileTranslations.Where(r => r.LanguageId == langId);
                if (!profiles.Any())
                {
                    profiles = _db.UserProfileTranslations.Where(r => r.IsDefault);
                }
                profiles = profiles.Where(r => employees.Contains(r.UserProfile.Username));

                var result = profiles.Select(profile => new ProfileViewModel
                {
                    Id = profile.UserProfileId,
                    LanguageId = profile.LanguageId,
                    IdNumber = profile.UserProfile.IdNumber ?? string.Empty,
                    PhoneNumber = profile.UserProfile.PhoneNumber ?? string.Empty,
                    GenderLookupId = profile.UserProfile.GenderLookupId,
                    ProvinceId = profile.UserProfile.ProvinceId,
                    CityId = profile.UserProfile.CityId,
                    RegionId = profile.UserProfile.RegionId,
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
                    CustomerId = profile.UserProfile.Username
                });
                return Ok(result);

            }
            catch (Exception ex)
            {
                LogHelper.LogException(Core.Constants.Users.Mobile, ex, Core.Constants.Errors.Apis.ErrorGetProfileInfo);
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Core.Constants.Errors.Apis.ErrorGetProfileInfo
                });
            }
        }

        [AllowAnonymous]
        [Route("isaccessallowed")]
        public IHttpActionResult IsAccessAllowed(string page, string username)
        {
            AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var result = new AccountPermissionResponse
                {
                    HasAccess = false,
                    Message = Core.Constants.ApiMessages.UnSupported,
                    StatusCode = HttpStatusCode.NotFound
                };
                var userId = _db.AspNetUsers.FirstOrDefault(r => r.UserName == username)?.Id;

                var userRoles = _db.AspNetUserRoles.Where(r => r.UserId == userId)
                    .ToList().Select(r => r.RoleId).ToList();
                var accountPermission = _db.RolePermissions.Where(r => userRoles.Contains(r.RoleId) && r.Permission.PageName == page);
                if (accountPermission.Any())
                {
                    result = new AccountPermissionResponse
                    {
                        HasAccess = true,
                        AllowedPermissonsList = accountPermission.Select(r => r.Permission.PermissionKey).ToList(),
                        StatusCode = HttpStatusCode.OK
                    };
                }

                return Ok(result);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(Core.Constants.Users.Mobile, ex, "Error while getting account permission");
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Core.Constants.ApiMessages.GeneralError
                });
            }
        }

        [AllowAnonymous]
        [Route("register")]
        public IHttpActionResult Register(ProfileViewModel registerModel)
        {
            AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
                var languageId = lang == "ar"
                    ? (int)GeneralEnums.LanguageEnum.Arabic
                    : (int)GeneralEnums.LanguageEnum.English;

                var user = new ApplicationUser { UserName = registerModel.Username, Email = registerModel.Email };
                var result = UserManager.CreateAsync(user, registerModel.Password);
                if (result.Result.Succeeded)
                {
                    var roleId = _db.AspNetRoles.FirstOrDefault(r => r.Name == Core.Constants.Roles.Citizen)?.Id;
                    if (roleId != null)
                    {
                        _db.AspNetUserRoles.Add(new AspNetUserRole()
                        {
                            RoleId = roleId,
                            UserId = user.Id
                        });
                        _db.SaveChanges();
                    }

                    var city = LookupHelper.GetLookupDetailsByCode(registerModel.CityCode)?.Id;
                    var gender = LookupHelper.GetLookupDetailsByCode(registerModel.GenderCode)?.Id;
                    var martialStatus = LookupHelper.GetLookupDetailsByCode(registerModel.MartialStatusCode)?.Id;
                    var province = LookupHelper.GetLookupDetailsByCode(registerModel.ProvinceCode)?.Id;

                    var profil = new UserProfile
                    {
                        Fax = registerModel.Fax ?? string.Empty,
                        Birthday = registerModel.BirthDay,
                        CreatedOn = DateTime.Now,
                        GenderLookupId = gender,
                        ProvinceId = province,
                        CityId = city,
                        RegionId = registerModel.RegionId,
                        IdNumber = registerModel.IdNumber ?? string.Empty,
                        PhoneNumber = registerModel.PhoneNumber ?? string.Empty,
                        Mobile = registerModel.Mobile ?? string.Empty,
                        MartialStatusLookupId = martialStatus,
                        ManagerId = registerModel.ManagerId,
                        DepartmentId = registerModel.Department,
                        PreferedLanguageId = registerModel.PrefferdLanguage,
                        Status = (int)GeneralEnums.StatusEnum.Active,
                        Username = registerModel.Username,
                        Email = registerModel.Email
                    };
                    _db.UserProfiles.Add(profil);
                    _db.SaveChanges();

                    var profTrans = new UserProfileTranslation()
                    {
                        Address = registerModel.Address ?? string.Empty,
                        FullName = registerModel.FullName,
                        IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                        LanguageId = languageId,
                        UserProfileId = profil.Id
                    };
                    _db.UserProfileTranslations.Add(profTrans);
                    if (!profTrans.IsDefault)
                    {
                        var profTrans1 = new UserProfileTranslation()
                        {
                            Address = registerModel.Address ?? string.Empty,
                            FullName = registerModel.FullName,
                            IsDefault = true,
                            LanguageId = CultureHelper.GetDefaultLanguageId(),
                            UserProfileId = profil.Id

                        };
                        _db.UserProfileTranslations.Add(profTrans1);
                    }

                    _db.SaveChanges();
                    registerModel.Id = profil.Id;
                    return Ok(registerModel);
                }
                else
                {
                    return Content(HttpStatusCode.Forbidden, new BaseApiResponse()
                    {
                        StatusCode = HttpStatusCode.Forbidden,
                        Message = result.Result.Errors.FirstOrDefault()
                    });
                }
            }
            catch (Exception ex)
            {
                LogHelper.LogException(Core.Constants.Users.System, ex, Core.Constants.Errors.Apis.ErrorRegister);
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Core.Constants.Errors.Apis.ErrorRegister
                });
            }
        }

        [AllowAnonymous]
        [Route("updateprofile")]
        public IHttpActionResult UpdateProfile(ProfileViewModel registerModel)
        {
            AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
                var languageId = lang == "ar"
                    ? (int)GeneralEnums.LanguageEnum.Arabic
                    : (int)GeneralEnums.LanguageEnum.English;


                var city = LookupHelper.GetLookupDetailsByCode(registerModel.CityCode)?.Id;
                var gender = LookupHelper.GetLookupDetailsByCode(registerModel.GenderCode)?.Id;
                var martialStatus = LookupHelper.GetLookupDetailsByCode(registerModel.MartialStatusCode)?.Id;
                var province = LookupHelper.GetLookupDetailsByCode(registerModel.ProvinceCode)?.Id;


                var userProfile = _db.UserProfiles.FirstOrDefault(r => r.Username == registerModel.Username);
                if (userProfile != null)
                {
                    userProfile.Email = registerModel.Email.IsNullOrWhiteSpace() ? userProfile.Email : registerModel.Email;
                    userProfile.Fax = registerModel.Fax.IsNullOrWhiteSpace() ? userProfile.Fax : registerModel.Fax;
                    userProfile.IdNumber = registerModel.IdNumber.IsNullOrWhiteSpace() ? userProfile.IdNumber : registerModel.IdNumber;
                    userProfile.Mobile = registerModel.Mobile.IsNullOrWhiteSpace() ? userProfile.Mobile : registerModel.Mobile;
                    userProfile.PreferedLanguageId = registerModel.PrefferdLanguage ?? userProfile.PreferedLanguageId;
                    userProfile.CityId = city ?? userProfile.CityId;
                    userProfile.DepartmentId = registerModel.Department ?? userProfile.DepartmentId;
                    userProfile.GenderLookupId = gender?? userProfile.GenderLookupId;
                    userProfile.MartialStatusLookupId = martialStatus ?? userProfile.MartialStatusLookupId;
                    userProfile.ProvinceId = province ?? userProfile.ProvinceId;
                    userProfile.RegionId = registerModel.RegionId ?? userProfile.RegionId;
                    userProfile.Birthday = registerModel.BirthDay ?? userProfile.Birthday;
                    userProfile.PhoneNumber = registerModel.PhoneNumber.IsNullOrWhiteSpace() ? userProfile.PhoneNumber : registerModel.PhoneNumber;
                    userProfile.ProfilePhoto = registerModel.ProfilePath.IsNullOrWhiteSpace() ? userProfile.ProfilePhoto : registerModel.ProfilePath;
                    var userProfileTrans =
                        _db.UserProfileTranslations.FirstOrDefault(r =>
                            r.UserProfileId == userProfile.Id && r.LanguageId == languageId) ??
                        _db.UserProfileTranslations.FirstOrDefault(r => r.UserProfileId == userProfile.Id);
                    if (userProfileTrans != null)
                    {
                        userProfileTrans.FullName = registerModel.FullName.IsNullOrWhiteSpace()
                            ? userProfileTrans.FullName
                            : registerModel.FullName;
                        userProfileTrans.Address = registerModel.Address.IsNullOrWhiteSpace()
                            ? userProfileTrans.Address
                            : registerModel.Address;
                        _db.Entry(userProfileTrans).State = EntityState.Modified;
                    }
                    _db.Entry(userProfile).State = EntityState.Modified;
                    _db.SaveChanges();
                    if (!registerModel.Password.IsNullOrWhiteSpace())
                    {
                        var user = _db.AspNetUsers.FirstOrDefault(r => r.UserName == registerModel.Username);
                        if (user != null)
                        {
                            UserManager.RemovePassword(user.Id);
                            var updateResult = UserManager.AddPassword(user.Id, registerModel.Password);
                            if (updateResult.Succeeded)
                            {
                                return Ok(registerModel);
                            }
                        }
                    }
                    else
                    {
                        return Ok(registerModel);
                    }
                    return Content(HttpStatusCode.Forbidden, new BaseApiResponse()
                    {
                        StatusCode = HttpStatusCode.Forbidden,
                        Message = "General Error"
                    });
                }
                else
                {
                    var user = new ApplicationUser { UserName = registerModel.Username, Email = registerModel.Email };
                    var result = UserManager.CreateAsync(user, registerModel.Password);
                    if (result.Result.Succeeded)
                    {
                        var profil = new UserProfile
                        {
                            Fax = registerModel.Fax ?? string.Empty,
                            Birthday = registerModel.BirthDay,
                            CreatedOn = DateTime.Now,
                            GenderLookupId = gender,
                            ProvinceId = province,
                            CityId = city,
                            RegionId = registerModel.RegionId,
                            IdNumber = registerModel.IdNumber ?? string.Empty,
                            PhoneNumber = registerModel.PhoneNumber ?? string.Empty,
                            Mobile = registerModel.Mobile ?? string.Empty,
                            MartialStatusLookupId = martialStatus,
                            ManagerId = registerModel.ManagerId,
                            DepartmentId = registerModel.Department,
                            PreferedLanguageId = registerModel.PrefferdLanguage,
                            Status = (int)GeneralEnums.StatusEnum.Active,
                            Username = registerModel.Username,
                            Email = registerModel.Email
                        };
                        _db.UserProfiles.Add(profil);
                        _db.SaveChanges();

                        var profTrans = new UserProfileTranslation()
                        {
                            Address = registerModel.Address ?? string.Empty,
                            FullName = registerModel.FullName,
                            IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                            LanguageId = languageId,
                            UserProfileId = profil.Id
                        };
                        _db.UserProfileTranslations.Add(profTrans);
                        if (!profTrans.IsDefault)
                        {
                            var profTrans1 = new UserProfileTranslation()
                            {
                                Address = registerModel.Address ?? string.Empty,
                                FullName = registerModel.FullName,
                                IsDefault = true,
                                LanguageId = CultureHelper.GetDefaultLanguageId(),
                                UserProfileId = profil.Id

                            };
                            _db.UserProfileTranslations.Add(profTrans1);
                        }

                        _db.SaveChanges();
                        registerModel.Id = profil.Id;
                        return Ok(registerModel);
                    }
                    else
                    {
                        return Content(HttpStatusCode.Forbidden, new BaseApiResponse()
                        {
                            StatusCode = HttpStatusCode.Forbidden,
                            Message = result.Result.Errors.FirstOrDefault()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.LogException(Core.Constants.Users.System, ex, Core.Constants.Errors.Apis.ErrorRegister);
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Core.Constants.Errors.Apis.ErrorRegister
                });
            }
        }
    }
}
