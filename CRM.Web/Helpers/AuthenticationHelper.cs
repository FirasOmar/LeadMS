using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Principal;
using System.Text;
using System.Web.Http;
using CRM.Core.Helpers;
using CRM.Core.Models;
using CRM.DataEntity.Models;
using CRM.Web.Models;

namespace CRM.Web.Helpers
{
    public class AuthenticationHelper
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        public bool CheckAuthentication(string pageName, string permissionKey, string userName)
        {
            try
            {
                var user = _db.AspNetUsers.FirstOrDefault(x => x.UserName == userName);
                if (user == null)
                {
                    //User Not Exist
                    return false;
                }

                var userRoles = _db.AspNetUserRoles.Where(x => x.UserId == user.Id);
                foreach (var role in userRoles)
                {
                    var permission = _db.Permissions.FirstOrDefault(x => x.PageName.Equals(pageName) && x.PermissionKey.Equals(permissionKey));
                    if (permission == null || role == null)
                    {
                        return false;
                    }
                    var userHasPermissions = _db.RolePermissions.Any(x => x.RoleId == role.RoleId.ToString() && x.PermissionId == permission.Id);
                    if (userHasPermissions)
                    {
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                LogHelper.LogException(userName, ex, "Error while check authentication!");
                return false;
            }
        }

        public static ProfileViewModel GetUserInfo(IPrincipal user, int langId)
        {
            using (var db = new CrmSystemEntities())
            {
                var userProf = db.UserProfiles.FirstOrDefault(r => r.Username == user.Identity.Name);
                if (userProf != null && userProf.UserProfileTranslations.Any())
                {
                    var trans = userProf.UserProfileTranslations.FirstOrDefault(r => r.LanguageId == langId);
                    if (trans != null)
                    {

                        return new ProfileViewModel { FullName = trans.FullName, ProfilePath = trans.UserProfile.ProfilePhoto };
                    }
                    else
                    {
                        trans = userProf.UserProfileTranslations.FirstOrDefault();
                        if (trans != null)
                        {
                            return new ProfileViewModel { FullName = trans.FullName, ProfilePath = trans.UserProfile.ProfilePhoto };
                        }
                    }
                }

                return new ProfileViewModel { FullName = user.Identity.Name, ProfilePath = "" };
            }
        }

        public static void ApiAuthorizationCheck(HttpRequestMessage request)
        {
            var headers = request.Headers;
            if (headers.Authorization == null)
                throw new HttpResponseException(HttpStatusCode.Unauthorized);
            string authenticationString = headers.Authorization.Parameter;
            string originalString = Encoding.UTF8.GetString(Convert.FromBase64String(authenticationString));
            string userName = originalString.Split(':')[0];
            string password = originalString.Split(':')[1];

            var usernameSetting = SettingHelper.GetOrCreate(Core.Constants.SystemSettings.IntegrationApiUsername, "Integration");
            var passwordSetting = SettingHelper.GetOrCreate(Core.Constants.SystemSettings.IntegrationApiPassword, "C@rm@123");

            if (usernameSetting.Value != userName || passwordSetting.Value != password)
                throw new HttpResponseException(HttpStatusCode.Unauthorized);
        }
    }
}