using System;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using CRM.Core;
using CRM.Core.SystemEnums;
using CRM.Web.Controllers.APIs.Responses;
using CRM.Web.Helpers;
using CRM.Web.Models;
using CRM.DataEntity.Models;
using CRM.Core.Helpers;
using CRM.Core.Models;

namespace CRM.Web.Controllers.APIs
{
    [RoutePrefix("api/lookups")]
    public class LookupsController : ApiController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();

        [Route("getlookupsbymasterid")]
        [AllowAnonymous]
        // api/lookups/getlookupsbymasterid? username = salam - cs@hotmail.com&lookupId=2
        public IHttpActionResult GetLookupsByMasterId(string username, int lookupId)
        {
            AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var httpRequest = HttpContext.Current.Request;
                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
                var languageId = lang == "ar"
                    ? (int)GeneralEnums.LanguageEnum.Arabic
                    : (int)GeneralEnums.LanguageEnum.English;

                var lookups = _db.DetailsLookups.Where(r =>
                        r.DetailsLookupTranslations.Any(x => x.LanguageId == languageId)
                        && r.MasterId == lookupId && r.Status == (int)GeneralEnums.StatusEnum.Active)
                    .SelectMany(r =>
                        r.DetailsLookupTranslations.Where(x => x.LanguageId == languageId)).Select(
                        x => new DetailsLookupViewModel()
                        {
                            Id = x.DetailsLookupId,
                            Name = x.Value
                        }).ToList();
                if (!lookups.Any())
                {
                    lookups = LanguageFallbackHelper.GetDefaultLookupDetailsByMasterId(lookupId);
                }

                return Ok(lookups);

            }
            catch (Exception ex)
            {
                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorGetLookups);
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Constants.Errors.Apis.ErrorGetLookups
                });
            }
        }

        [Route("getdepartments")]
        [AllowAnonymous]
        // api/lookups/getdepartments?username=salam-cs@hotmail.com
        public IHttpActionResult GetDepartments(string username)
        {
            AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
                var languageId = lang == "ar"
                    ? (int)GeneralEnums.LanguageEnum.Arabic
                    : (int)GeneralEnums.LanguageEnum.English;


                var departments = _db.Departments.Where(r =>
                        r.DepartmentTranslations.Any(x => x.LanguageId == languageId)
                        && r.Status == (int)GeneralEnums.StatusEnum.Active)
                    .SelectMany(r => r.DepartmentTranslations.Where(x => x.LanguageId == languageId)).Select(x => new DepartmentViewModel()
                    {
                        Id = x.DepartmentId,
                        Name = x.Name,
                        Description = x.Description,
                        LanguageId = x.LanguageId,
                        CreatedBy = x.Department.CreatedBy,
                        CreatedOn = x.Department.CreatedOn
                    }).ToList();

                if (!departments.Any())
                {
                    departments = LanguageFallbackHelper.GetDefaultDepartments();
                }
                return Ok(departments);

            }
            catch (Exception ex)
            {
                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorGetDepatments);
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Constants.Errors.Apis.ErrorGetDepatments
                });
            }
        }

        [Route("getsettingbyname")]
        [AllowAnonymous]
        // api/lookups/getsettingbyname?name=System_CRM_ForgetPasswordLink
        public IHttpActionResult GetSettingByName(string name)
        {
            AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var lang = Request?.Headers?.AcceptLanguage?.FirstOrDefault()?.Value ?? "ar";
                var languageId = lang == "ar"
                    ? (int)GeneralEnums.LanguageEnum.Arabic
                    : (int)GeneralEnums.LanguageEnum.English;
                var result = new SettingViewModel();
                switch (name)
                {
                    case Constants.SystemSettings.ForgetPasswordLink:
                        result = SettingHelper.GetOrCreate(name, "http://crm.smsm-it.com/Account/ForgotPassword", languageId);
                        break;
                    case Constants.SystemSettings.RegistrationLink:
                        result = SettingHelper.GetOrCreate(name, "http://crm.smsm-it.com/Account/Register", languageId);
                        break;
                }

                return Ok(result);

            }
            catch (Exception ex)
            {
                LogHelper.LogException(Constants.Users.Mobile, ex, Constants.Errors.Apis.ErrorGettingCustomSetting);
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Constants.Errors.Apis.ErrorGettingCustomSetting
                });
            }
        }
    }
}
