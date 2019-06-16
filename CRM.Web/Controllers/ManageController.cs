using System;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using CRM.Core.Helpers;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Helpers;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using CRM.Web.Models;
using CRM.Core.Models;

namespace CRM.Web.Controllers
{
    [Authorize]
    public class ManageController : BaseController
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        private readonly CrmSystemEntities _db = new CrmSystemEntities();

        public ManageController()
        {
        }

        public ManageController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
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
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        //
        // GET: /Manage/Index
        public ActionResult Index()
        {
            int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

            var userProfile = _db.UserProfiles.FirstOrDefault(r => r.Username == User.Identity.Name);
            if (userProfile == null)
            {
                return HttpNotFound();
            }
            var userProfileTrans = _db.UserProfileTranslations.FirstOrDefault(r => r.UserProfileId == userProfile.Id);


            if (userProfileTrans == null)
            {
                return HttpNotFound();
            }
            var model = new ProfileViewModel()
            {
                Id = userProfile.Id,
                IdNumber = userProfile.IdNumber,
                PhoneNumber = userProfile.PhoneNumber,
                GenderLookupId = userProfile.GenderLookupId,
                GenderLookupName = LookupHelper.GetLookupDetailsById(userProfile?.GenderLookupId ?? 0, Request.Cookies["_culture"])?.Name,
                MartialStatusLookupId = userProfile.MartialStatusLookupId,
                MartialStatusLookupName= LookupHelper.GetLookupDetailsById(userProfile?.MartialStatusLookupId ?? 0, Request.Cookies["_culture"])?.Name,
                FullName = userProfileTrans.FullName,
                PrefferdLanguage = userProfile.PreferedLanguageId,
                PrefferdLanguageName = LookupHelper.GetLookupDetailsById(userProfile?.PreferedLanguageId ?? 0, Request.Cookies["_culture"])?.Name,
                Email = userProfile.Username,
                Address = userProfileTrans.Address,
                Fax = userProfile.Fax,
                BirthDay = userProfile.Birthday,
                Mobile = userProfile.Mobile,
                LastLogin = userProfile.LastLogin,
                ProfilePath = userProfile.ProfilePhoto,
                ProvinceId = userProfile.ProvinceId,
                RegionId = userProfile.RegionId,
                CityId = userProfile.CityId,
                 
            };

            var prefferdLanguage = LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.PrefferdLanguage,
                Request.Cookies["_culture"]);
            ViewBag.PrefferdLanguage = new SelectList(prefferdLanguage, "Id", "Name", model.PrefferdLanguage);
            ViewBag.GenderLookupId =
                new SelectList(
                    LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Gender,
                        Request.Cookies["_culture"]), "Id", "Name");
            ViewBag.MartialStatusLookupId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.MartialStatus, Request.Cookies["_culture"]), "Id", "Name", userProfile.MartialStatusLookupId);
            ViewBag.ProvinceId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Province, Request.Cookies["_culture"]), "Id", "Name", userProfile.ProvinceId);
            ViewBag.RegionId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Region, Request.Cookies["_culture"]), "Id", "Name", userProfile.RegionId);
            ViewBag.CityId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.City, Request.Cookies["_culture"]), "Id", "Name", userProfile.CityId);

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(ProfileViewModel profile)
        {
            bool result = false;
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

                    int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
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
                result = true;
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
                        Request.Cookies["_culture"]), "Id", "Name", profile.GenderLookupId);
            ViewBag.MartialStatusLookupId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.MartialStatus, Request.Cookies["_culture"]), "Id", "Name", profile.MartialStatusLookupId);
            ViewBag.ProvinceId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Province, Request.Cookies["_culture"]), "Id", "Name", profile.ProvinceId);
            ViewBag.RegionId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.Region, Request.Cookies["_culture"]), "Id", "Name", profile.RegionId);
            ViewBag.CityId = new SelectList(LookupHelper.GetLookupDetailsByMasterId((int)GeneralEnums.MasterLookupEnums.City, Request.Cookies["_culture"]), "Id", "Name", profile.CityId);
            TempData["UpdateProfileResult"] =
                result ? Core.Constants.Messages.UpdateProfileSuccess : Core.Constants.Messages.UpdateProfileError;

          
            return View(profile);
        }

        //
        // POST: /Manage/RemoveLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> RemoveLogin(string loginProvider, string providerKey)
        {
            ManageMessageId? message;
            var result = await UserManager.RemoveLoginAsync(User.Identity.GetUserId(), new UserLoginInfo(loginProvider, providerKey));
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                message = ManageMessageId.RemoveLoginSuccess;
            }
            else
            {
                message = ManageMessageId.Error;
            }
            return RedirectToAction("ManageLogins", new { Message = message });
        }

        //
        // GET: /Manage/AddPhoneNumber
        public ActionResult AddPhoneNumber()
        {
            return View();
        }

        //
        // POST: /Manage/AddPhoneNumber
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> AddPhoneNumber(AddPhoneNumberViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            // Generate the token and send it
            var code = await UserManager.GenerateChangePhoneNumberTokenAsync(User.Identity.GetUserId(), model.Number);
            if (UserManager.SmsService != null)
            {
                var message = new IdentityMessage
                {
                    Destination = model.Number,
                    Body = "Your security code is: " + code
                };
                await UserManager.SmsService.SendAsync(message);
            }
            return RedirectToAction("VerifyPhoneNumber", new { PhoneNumber = model.Number });
        }

        //
        // POST: /Manage/EnableTwoFactorAuthentication
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EnableTwoFactorAuthentication()
        {
            await UserManager.SetTwoFactorEnabledAsync(User.Identity.GetUserId(), true);
            var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
            if (user != null)
            {
                await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
            }
            return RedirectToAction("Index", "Manage");
        }

        //
        // POST: /Manage/DisableTwoFactorAuthentication
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DisableTwoFactorAuthentication()
        {
            await UserManager.SetTwoFactorEnabledAsync(User.Identity.GetUserId(), false);
            var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
            if (user != null)
            {
                await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
            }
            return RedirectToAction("Index", "Manage");
        }

        //
        // GET: /Manage/VerifyPhoneNumber
        public async Task<ActionResult> VerifyPhoneNumber(string phoneNumber)
        {
            var code = await UserManager.GenerateChangePhoneNumberTokenAsync(User.Identity.GetUserId(), phoneNumber);
            // Send an SMS through the SMS provider to verify the phone number
            return phoneNumber == null ? View("Error") : View(new VerifyPhoneNumberViewModel { PhoneNumber = phoneNumber });
        }

        //
        // POST: /Manage/VerifyPhoneNumber
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> VerifyPhoneNumber(VerifyPhoneNumberViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var result = await UserManager.ChangePhoneNumberAsync(User.Identity.GetUserId(), model.PhoneNumber, model.Code);
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                return RedirectToAction("Index", new { Message = ManageMessageId.AddPhoneSuccess });
            }
            // If we got this far, something failed, redisplay form
            ModelState.AddModelError("", "Failed to verify phone");
            return View(model);
        }

        //
        // POST: /Manage/RemovePhoneNumber
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> RemovePhoneNumber()
        {
            var result = await UserManager.SetPhoneNumberAsync(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return RedirectToAction("Index", new { Message = ManageMessageId.Error });
            }
            var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
            if (user != null)
            {
                await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
            }
            return RedirectToAction("Index", new { Message = ManageMessageId.RemovePhoneSuccess });
        }

        //
        // GET: /Manage/ChangePassword
        public ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Manage/ChangePassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }

                return RedirectToAction("Index", new { Message = ManageMessageId.ChangePasswordSuccess });
            }
            AddErrors(result);
            return View(model);
        }

        //
        // GET: /Manage/SetPassword
        public ActionResult SetPassword()
        {
            return View();
        }

        //
        // POST: /Manage/SetPassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SetPassword(SetPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await UserManager.AddPasswordAsync(User.Identity.GetUserId(), model.NewPassword);
                if (result.Succeeded)
                {
                    var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
                    if (user != null)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                    }
                    return RedirectToAction("Index", new { Message = ManageMessageId.SetPasswordSuccess });
                }
                AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Manage/ManageLogins
        public async Task<ActionResult> ManageLogins(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
                : message == ManageMessageId.Error ? "An error has occurred."
                : "";
            var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
            if (user == null)
            {
                return View("Error");
            }
            var userLogins = await UserManager.GetLoginsAsync(User.Identity.GetUserId());
            var otherLogins = AuthenticationManager.GetExternalAuthenticationTypes().Where(auth => userLogins.All(ul => auth.AuthenticationType != ul.LoginProvider)).ToList();
            ViewBag.ShowRemoveButton = user.PasswordHash != null || userLogins.Count > 1;
            return View(new ManageLoginsViewModel
            {
                CurrentLogins = userLogins,
                OtherLogins = otherLogins
            });
        }

        //
        // POST: /Manage/LinkLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LinkLogin(string provider)
        {
            // Request a redirect to the external login provider to link a login for the current user
            return new AccountController.ChallengeResult(provider, Url.Action("LinkLoginCallback", "Manage"), User.Identity.GetUserId());
        }

        //
        // GET: /Manage/LinkLoginCallback
        public async Task<ActionResult> LinkLoginCallback()
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync(XsrfKey, User.Identity.GetUserId());
            if (loginInfo == null)
            {
                return RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
            }
            var result = await UserManager.AddLoginAsync(User.Identity.GetUserId(), loginInfo.Login);
            return result.Succeeded ? RedirectToAction("ManageLogins") : RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && _userManager != null)
            {
                _userManager.Dispose();
                _userManager = null;
            }

            base.Dispose(disposing);
        }

#region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private bool HasPassword()
        {
            var user = UserManager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                return user.PasswordHash != null;
            }
            return false;
        }

        private bool HasPhoneNumber()
        {
            var user = UserManager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                return user.PhoneNumber != null;
            }
            return false;
        }

        public enum ManageMessageId
        {
            AddPhoneSuccess,
            ChangePasswordSuccess,
            SetTwoFactorSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            RemovePhoneSuccess,
            Error
        }

#endregion
    }
}