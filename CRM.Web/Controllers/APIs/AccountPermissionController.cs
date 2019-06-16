using System;
using System.Linq;
using System.Net;
using System.Web.Http;
using CRM.Web.Controllers.APIs.Responses;
using CRM.DataEntity.Models;
using CRM.Web.Helpers;
using Microsoft.AspNet.Identity;

namespace CRM.Web.Controllers.APIs
{
    [Authorize]
    public class AccountPermissionController : ApiController
    {
        // GET: AccountPermission
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        [HttpGet]
        public IHttpActionResult IsAccessAllowed(string page)
        {
            //AuthenticationHelper.ApiAuthorizationCheck(Request);
            try
            {
                var result = new AccountPermissionResponse()
                {
                    HasAccess = false,
                    Message = Core.Constants.ApiMessages.UnSupported,
                    StatusCode = HttpStatusCode.NotFound
                };
                var userId = User.Identity.GetUserId();
                var userRoles = _db.AspNetUserRoles.Where(r => r.UserId == userId)
                    .ToList().Select(r => r.RoleId).ToList();
                var accountPermission = _db.RolePermissions.Where(r => userRoles.Contains(r.RoleId) && r.Permission.PageName == page);
                if (accountPermission.Any())
                {
                    result = new AccountPermissionResponse()
                    {
                        HasAccess = true,
                        AllowedPermissonsList = accountPermission.Select(r=> r.Permission.PermissionKey).ToList(),
                        StatusCode = HttpStatusCode.OK
                    };
                }

                return Ok(result);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error while getting account permission");
                return Content(HttpStatusCode.InternalServerError, new BaseApiResponse()
                {
                    StatusCode = HttpStatusCode.InternalServerError,
                    Message = Core.Constants.ApiMessages.GeneralError
                });
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