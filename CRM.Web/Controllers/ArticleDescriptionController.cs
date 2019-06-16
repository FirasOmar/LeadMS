//using System;
//using System.Data.Entity;
//using System.Linq;
//using System.Web.Mvc;
//using CRM.Core;
//using CRM.Core.Helpers;
//using CRM.DataEntity.Models;
//using CRM.Web.Controllers.APIs.Responses;
//using CRM.Web.Helpers;
//using CRM.Web.Models;
//using CRM.Workflow;
//using PagedList;
//using Microsoft.Ajax.Utilities;
//using System.Net;
//using CRM.Core.SystemEnums;
//using CRM.Web.Filters;


//namespace CRM.Web.Controllers
//{
//    public class ArticleDescriptionController : Controller
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();

//        [CustomAuthentication(PageName = "ArticleDescription", PermissionKey = "View")]
//        public ActionResult Index(int articleId)
//        {
//            var data = new ArticleViewModel();
//            if (articleId > 0)
//            {
//                var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

//                data = LanguageFallbackHelper.GetArticle(articleId, currentLanguageId);
//            }

//            return View(data);
//        }

//        [HttpGet]
//        [CustomAuthentication(PageName = "ArticleDescription", PermissionKey = "View")]
//        public ActionResult GetArticleDataForMouseHover(int articleId)
//        {
//            var data = new ArticleViewModel();
//            if (articleId > 0)
//            {
//                var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

//                data = LanguageFallbackHelper.GetArticle(articleId, currentLanguageId);
//            }

//            return Json(data, JsonRequestBehavior.AllowGet);
//        }
//    }
//}