using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.DataEntity.Models;
using CRM.Web.Controllers;
using CRM.Web.Helpers;

namespace CRM.Web
{
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error()
        {
            var exception = Server.GetLastError();
            var httpException = exception as HttpException;
            Response.Clear();
            Server.ClearError();
            var routeData = new RouteData();
            routeData.Values["controller"] = "Error";
            routeData.Values["action"] = "Error";
            routeData.Values["exception"] = exception;
            routeData.Values["errorCode"] = 500;
            Response.StatusCode = 500;
            if (httpException != null)
            {
                Response.StatusCode = httpException.GetHttpCode();
                switch (Response.StatusCode)
                {
                    case 403:
                        routeData.Values["errorCode"] = 403;
                        break;
                    case 404:
                        routeData.Values["errorCode"] = 404;
                        break;
                    default:
                        routeData.Values["errorCode"] = Response.StatusCode;
                        break;
                }
                try
                {
                    LogHelper.AddSystemLog(new SystemLog()
                    {
                        Name = $"ApplicationError - {exception.Message}",
                        Component = "ApplicationError",
                        CreatedBy = "System",
                        CreatedOn = DateTime.Now,
                        StackTrace = exception.StackTrace
                    });
                }
                catch (Exception ex)
                {

                }
            }
            var fromAddress = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsSourceEmail, "furidistest@gmail.com").Value;
            var toAddress = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsErrorEmail, "furidistest@gmail.com").Value;
            new EmailHelper().SendMail(fromAddress, new List<string>() { toAddress }, "General Error", $"Message: {exception.Message}. InnerException: {exception.InnerException}. StackTrace: {exception.StackTrace}");
            IController errorsController = new ErrorController();
            var rc = new RequestContext(new HttpContextWrapper(Context), routeData);
            errorsController.Execute(rc);
        }
    }
}
