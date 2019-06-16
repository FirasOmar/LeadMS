using System;
using System.Web.Mvc;

namespace CRM.Web.Controllers
{
    public class ErrorController : BaseController
    {
        // GET: Error
        public ActionResult Error(Exception exception, int errorCode)
        {
            ViewBag.Title = errorCode;
            switch (errorCode)
            {
                case 403:
                    ViewBag.ErrorDesc = App_GlobalResources.General.Messages.Error403;
                    break;
                case 404:
                    ViewBag.ErrorDesc = App_GlobalResources.General.Messages.Error404;
                    break;
                default:
                    ViewBag.ErrorDesc = App_GlobalResources.General.Messages.GeneralError;
                    break;
            }

            return View();
        }
    }
}