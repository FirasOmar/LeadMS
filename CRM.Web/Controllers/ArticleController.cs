//using System;
//using System.Data.Entity;
//using System.Linq;
//using System.Web.Mvc;
//using CRM.Core;
//using CRM.Core.Helpers;
//using CRM.Core.SystemEnums;
//using CRM.DataEntity.Models;
//using CRM.Web.Filters;
//using CRM.Web.Helpers;
//using CRM.Web.Models;
//using Microsoft.Ajax.Utilities;
//using PagedList;
//using RTE;
//using System.IO;
//using System.Text;
//using System.Collections.Generic;

//namespace CRM.Web.Controllers
//{
//    public class ArticleController : Controller
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();

//        [CustomAuthentication(PageName = "Article", PermissionKey = "View")]
//        public ActionResult Index(int? page, string searchText, int resetTo = 0)
//        {
//            if (resetTo == 1)
//            {
//                page = 1;
//            }

//            bool isajax = false;
//            RichEditorHelper.PrepairEditorWithName(delegate (Editor editor)
//            {
//                editor.Skin = Constants.RichEditors.Editor_Skin;
//                isajax = editor.MvcInit();
//                ViewBag.Editor1 = editor.MvcGetString();
//            }, "editor1", isajax);

//            RichEditorHelper.PrepairEditorWithName(delegate (Editor editor)
//            {
//                editor.Skin = Constants.RichEditors.Editor_Skin;
//                isajax = editor.MvcInit();
//                ViewBag.Editor2 = editor.MvcGetString();
//            }, "editor2", isajax);

//            var statuses = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
//            ViewBag.Status = new SelectList(statuses, "Id", "Name");
//            ViewBag.StatusEdit = new SelectList(statuses, "Id", "Name");

//            var categories = LookupHelper.GetCategories(Request.Cookies["_culture"]);
//            ViewBag.Category = new SelectList(categories, "Id", "Title");
//            ViewBag.CategoryEdit = new SelectList(categories, "Id", "Title");

//            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

//            var masterLookupsForcurrentLan = _db.MasterLookupTranslations
//                               .Where(r => (r.LanguageId == currentLanguageId) &&
//                              r.MasterLookup.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(c => c.MasterLookupId);
//            var masterLookup = _db.MasterLookupTranslations
//                          .Where(r => (r.IsDefault) &&
//                         r.MasterLookup.Status != (int)GeneralEnums.StatusEnum.Deleted && !masterLookupsForcurrentLan.Contains(r.MasterLookupId))
//                         .Union(
//                            _db.MasterLookupTranslations
//                          .Where(r => r.LanguageId == currentLanguageId && r.MasterLookup.Status != (int)GeneralEnums.StatusEnum.Deleted && masterLookupsForcurrentLan.Contains(r.MasterLookupId)))
//                         .ToList();

//            var masterLookupDetailes = masterLookup.ToList().Select(r =>
//              new MasterLookupViewModel
//              {
//                  Id = r.MasterLookup.Id,
//                  Status = r.MasterLookup.Status,
//                  Name = r.Name,
//                  CreatedBy = r.MasterLookup.CreatedBy,
//                  CreatedOn = r.MasterLookup.CreatedOn,
//                  DeletedOn = r.MasterLookup.DeletedOn,
//                  IsDefault = r.IsDefault,
//                  LanguageId = r.LanguageId

//              }
//            );

//            ViewBag.MasterLookup = new SelectList(masterLookupDetailes, "Id", "Name");
//            ViewBag.MasterLookupEdit = new SelectList(masterLookupDetailes, "Id", "Name");


//            var articlesForCurrentLang = _db.ArticleTranslations
//                .Where(t => (t.LanguageId == currentLanguageId)
//                && t.Article.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(t => t.ArticleId);
            
//            var articles = _db.ArticleTranslations
//                       .Where(r => (r.IsDefault) &&
//                      r.Article.Status != (int)GeneralEnums.StatusEnum.Deleted
//                      && !articlesForCurrentLang.Contains(r.ArticleId))
//                      .Union(
//                         _db.ArticleTranslations
//                       .Where(r => r.LanguageId == currentLanguageId && r.Article.Status != (int)GeneralEnums.StatusEnum.Deleted && articlesForCurrentLang.Contains(r.ArticleId)))
//                      .ToList();

//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                articles = articles
//                                    .Where(r => (r.Title.Contains(searchText) || r.Description.Contains(searchText))).ToList();
//                ViewBag.searchText = searchText;
//            }

//            var defaultLangId = CultureHelper.GetDefaultLanguageId();
//            var result = articles.ToList().Select(x =>
//               new ArticleViewModel()
//               {
//                   Id = x.ArticleId,
//                   Title = x.Title,
//                   Category = x.Article.CategoryId,
//                   IsDefault = x.IsDefault,
//                   CategoryTitle =
//                   x.Article.Category.CategoryTranslations
//                   .Where(t => t.LanguageId == currentLanguageId).FirstOrDefault() != null ?
//                    x.Article.Category.CategoryTranslations
//                   .Where(t => t.LanguageId == currentLanguageId).FirstOrDefault().Title : 
//                   (currentLanguageId != defaultLangId ? x.Article.Category.CategoryTranslations
//                   .Where(t => t.LanguageId == defaultLangId).FirstOrDefault().Title : string.Empty),
//                   LanguageId = x.LanguageId,
//                   Status = x.Article.Status,
//                   Description = x.Description,
//                   CreatedOn = x.Article.CreatedOn,
//                   DeletedOn = x.Article.DeletedOn,
//                   CreatedBy = x.Article.CreatedBy,
//               });

//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);

//            return View(result.OrderByDescending(t => t.Id).ToPagedList(pageNumber, pageSize));

//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Article", PermissionKey = "Create")]
//        public JsonResult AddArticle(ArticleViewModel article)
//        {
//            try
//            {
//                int languageId = article.LanguageId;

//                #region Add Category
//                var art = new Article()
//                {
//                    CreatedBy = User.Identity.Name,
//                    CreatedOn = DateTime.Now,
//                    CategoryId = article.Category,
//                    Status = article.Status,
//                };
//                _db.Articles.Add(art);
//                _db.SaveChanges();

//                var artTrans = new ArticleTranslation()
//                {
//                    ArticleId = art.Id,
//                    Description = article.Description,
//                    LanguageId = languageId,
//                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
//                    Title = article.Title
//                };

//                _db.ArticleTranslations.Add(artTrans);
//                if (!artTrans.IsDefault)
//                {
//                    var artTrans1 = new ArticleTranslation()
//                    {
//                        ArticleId = art.Id,
//                        Description = article.Description,
//                        LanguageId = CultureHelper.GetDefaultLanguageId(),
//                        IsDefault = true,
//                        Title = article.Title
//                    };
//                    _db.ArticleTranslations.Add(artTrans1);
//                }

//                _db.SaveChanges();

//                var mappingData = new Mapping_Article();

//                if (article.DetailesLookupId > 0)
//                {
//                    ArticleHelper.AddOrUpdateArticleMappingData(User,(int)GeneralEnums.Mapping_Article_Type.Detailes, article.DetailesLookupId,art.Id);
//                }
//                else if(article.MasterLookupId > 0)
//                {
//                     ArticleHelper.AddOrUpdateArticleMappingData(User,(int)GeneralEnums.Mapping_Article_Type.Master, article.MasterLookupId,art.Id);
//                }

//                #endregion

//                return Json(article, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new article");
//                return null;
//            }
//        }

//        [Authorize]
//        [HttpGet]
//        public JsonResult GetLookupDetailsByMasterId(int id)
//        {
//            try
//            {
//                if(id > 0)
//                {
//                    var data = LookupHelper.GetLookupDetailsByMasterId(id, Request.Cookies["_culture"]);
//                    return Json(data, JsonRequestBehavior.AllowGet);
//                }
//                return Json(null, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While getting lookup detailes (Article)");
//                return null;
//            }
//        }

//        [HttpGet]
//        [CustomAuthentication(PageName = "Article", PermissionKey = "Edit")]
//        public JsonResult EditArticle(int id, int languageId)
//        {
//            try
//            {
//                var men = _db.Articles.Find(id);
//                if (men != null && men.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    var article = LanguageFallbackHelper.GetArticle(id, languageId);
//                    var detailesLookupData = new List<DetailsLookupViewModel>();
//                    if(article.DetailesLookupId > 0)
//                    {
//                        var aticleLookupDetailData = LookupHelper.GetLookupDetailsById(article.DetailesLookupId, Request.Cookies["_culture"]);
//                        detailesLookupData = LookupHelper.GetLookupDetailsByMasterId(aticleLookupDetailData.MasterId, Request.Cookies["_culture"]);
//                        article.MasterLookupId = aticleLookupDetailData.MasterId;
//                    }
//                    else
//                    {
//                        detailesLookupData = LookupHelper.GetLookupDetailsByMasterId(article.MasterLookupId, Request.Cookies["_culture"]);
//                    }
//                    return Json(new { article = article , detailesLookupData = detailesLookupData },
//                        JsonRequestBehavior.AllowGet);
//                }

//                return Json(null, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing article (Get)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Article", PermissionKey = "Edit")]
//        public JsonResult EditArticle(ArticleViewModel article)
//        {
//            try
//            {
//                var art = _db.Articles.Find(article.Id);
//                if (art != null && art.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    art.Status = article.Status;
//                    art.CategoryId = article.Category;
//                    _db.Entry(art).State = EntityState.Modified;
//                    _db.SaveChanges();

//                    var artTrans = _db.ArticleTranslations.FirstOrDefault(r => r.ArticleId == art.Id && r.LanguageId == article.LanguageId);
//                    if (artTrans != null)
//                    {
//                        artTrans.Title = article.Title;
//                        artTrans.Description = article.Description;
//                        _db.Entry(artTrans).State = EntityState.Modified;
//                    }
//                    else
//                    {
//                        artTrans = new ArticleTranslation()
//                        {
//                            ArticleId = art.Id,
//                            Description = article.Description,
//                            LanguageId = article.LanguageId,
//                            IsDefault = false,
//                            Title = article.Title
//                        };
//                        _db.ArticleTranslations.Add(artTrans);
//                    }

//                    _db.SaveChanges();

//                    if(article.DetailesLookupId > 0)
//                    {
//                        ArticleHelper.AddOrUpdateArticleMappingData(User, (int)GeneralEnums.Mapping_Article_Type.Detailes, article.DetailesLookupId, art.Id);

//                    }
//                    else if (article.MasterLookupId > 0)
//                    {
//                        ArticleHelper.AddOrUpdateArticleMappingData(User, (int)GeneralEnums.Mapping_Article_Type.Master, article.MasterLookupId, art.Id);
//                    }
//                }

//                return Json(article, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing article (Post)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Article", PermissionKey = "Delete")]
//        public JsonResult DeleteArticle(int id)
//        {
//            try
//            {
//                var article = _db.Articles.Find(id);
//                if (article != null && article.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    article.Status = (int)GeneralEnums.StatusEnum.Deleted;
//                    _db.Entry(article).State = EntityState.Modified;
//                    _db.SaveChanges();

//                    var articleTrans = _db.ArticleTranslations.FirstOrDefault(r => r.ArticleId == id);
//                    return Json(new CategoryViewModel()
//                    {
//                        Id = articleTrans.ArticleId,
//                        Title = articleTrans.Title,
//                        Status = articleTrans.Article.Status,
//                        Description = articleTrans.Description,
//                        CreatedOn = articleTrans.Article.CreatedOn,
//                        DeletedOn = articleTrans.Article.DeletedOn,
//                        LanguageId = articleTrans.LanguageId,
//                        CreatedBy = articleTrans.Article.CreatedBy
//                    }, JsonRequestBehavior.AllowGet);
//                }
//                return Json(null, JsonRequestBehavior.AllowGet);
//            }

//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting article");
//                return null;
//            }
//        }

//        protected override void Dispose(bool disposing)
//        {
//            if (disposing)
//            {
//                _db.Dispose();
//            }
//            base.Dispose(disposing);
//        }

//    }
//}