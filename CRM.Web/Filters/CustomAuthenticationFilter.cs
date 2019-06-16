using System.Web.Mvc;
using CRM.Web.Helpers;

namespace CRM.Web.Filters
{
    public class CustomAuthenticationAttribute : ActionFilterAttribute
    {
        private readonly AuthenticationHelper _authenticationHelper = new AuthenticationHelper();
        public string PageName { get; set; }
        public string PermissionKey { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var userName = filterContext.HttpContext.User.Identity.Name;
            var valid = _authenticationHelper.CheckAuthentication(PageName, PermissionKey, userName);
            if (valid)
            {
                base.OnActionExecuting(filterContext);
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult( new System.Web.Routing.RouteValueDictionary { {"controller", "Account"}, {"action", "Login" } });
            }
        }
    }
}