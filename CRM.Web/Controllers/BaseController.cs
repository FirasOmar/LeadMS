using System;
using System.Globalization;
using System.Threading;
using System.Web.Mvc;
using CRM.Core.Helpers;
using CRM.Web.Helpers;

namespace CRM.Web.Controllers
{
    public class BaseController : Controller
    {
        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            // Attempt to read the culture cookie from Request
            var cultureCookie = Request.Cookies["_culture"];

            var cultureName = CultureHelper.GetCultureName(cultureCookie);

            // Modify current thread's cultures            
            Thread.CurrentThread.CurrentCulture = new CultureInfo(cultureName);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

            var ci = new CultureInfo("en-US");
            Thread.CurrentThread.CurrentUICulture.DateTimeFormat = ci.DateTimeFormat;

            return base.BeginExecuteCore(callback, state);
        }
    }
}