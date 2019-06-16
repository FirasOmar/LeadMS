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

//namespace CRM.Web.Controllers
//{
//    public class CategoryController : BaseController
//    {
//        private readonly CrmSystemEntities _db = new CrmSystemEntities();

//        [CustomAuthentication(PageName = "Category", PermissionKey = "View")]
//        public ActionResult Index(int? page, string searchText, int resetTo = 0)
//        {
//            if (resetTo == 1)
//            {
//                page = 1;
//            }

//            var statuses = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
//            ViewBag.Status = new SelectList(statuses, "Id", "Name");
//            ViewBag.StatusEdit = new SelectList(statuses, "Id", "Name");

//            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

//            var categoriesForCurrentLang = _db.CategoryTranslations
//                .Where(t => (t.LanguageId == currentLanguageId)
//                && t.Category.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(t => t.CategoryId);

//            var categories = _db.CategoryTranslations
//                       .Where(r => (r.IsDefault) &&
//                      r.Category.Status != (int)GeneralEnums.StatusEnum.Deleted && !categoriesForCurrentLang.Contains(r.CategoryId))
//                      .Union(
//                         _db.CategoryTranslations
//                       .Where(r => r.LanguageId == currentLanguageId && r.Category.Status != (int)GeneralEnums.StatusEnum.Deleted && categoriesForCurrentLang.Contains(r.CategoryId)))
//                      .ToList();

//            if (!searchText.IsNullOrWhiteSpace())
//            {
//                categories = categories
//                                    .Where(r => (r.Title.Contains(searchText) || r.Description.Contains(searchText))).ToList();
//                ViewBag.searchText = searchText;
//            }

//            var result = categories.ToList().Select(x =>
//               new CategoryViewModel()
//               {
//                   Id = x.CategoryId,
//                   Title = x.Title,
//                   IsDefault = x.IsDefault,
//                   LanguageId = x.LanguageId,
//                   Status = x.Category.Status,
//                   Description = x.Description,
//                   CreatedOn = x.Category.CreatedOn,
//                   DeletedOn = x.Category.DeletedOn,
//                   CreatedBy = x.Category.CreatedBy,
//               });

//            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
//            var pageNumber = (page ?? 1);

//            return View(result.OrderByDescending(t => t.Id).ToPagedList(pageNumber, pageSize));

//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Category", PermissionKey = "Create")]
//        public JsonResult AddCategory(CategoryViewModel category)
//        {
//            try
//            {
//                int languageId = category.LanguageId;

//                #region Add Category
//                var cat = new Category()
//                {
//                    CreatedBy = User.Identity.Name,
//                    CreatedOn = DateTime.Now,
//                    Status = category.Status,
//                };
//                _db.Categories.Add(cat);
//                _db.SaveChanges();

//                var catTrans = new CategoryTranslation()
//                {
//                    CategoryId = cat.Id,
//                    Description = category.Description,
//                    LanguageId = languageId,
//                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
//                    Title = category.Title
//                };

//                _db.CategoryTranslations.Add(catTrans);
//                if (!catTrans.IsDefault)
//                {
//                    var catTrans1 = new CategoryTranslation()
//                    {
//                        CategoryId = cat.Id,
//                        Description = category.Description,
//                        LanguageId = CultureHelper.GetDefaultLanguageId(),
//                        IsDefault = true,
//                        Title = category.Title
//                    };
//                    _db.CategoryTranslations.Add(catTrans1);
//                }

//                _db.SaveChanges();

//                #endregion

//                return Json(category, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new category");
//                return null;
//            }
//        }

//        [HttpGet]
//        [CustomAuthentication(PageName = "Category", PermissionKey = "Edit")]
//        public JsonResult EditCategory(int id, int languageId)
//        {
//            try
//            {
//                var men = _db.Categories.Find(id);
//                if (men != null && men.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    var category = LanguageFallbackHelper.GetCategory(id, languageId);
//                    return Json(category, JsonRequestBehavior.AllowGet);
//                }

//                return Json(null, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing category (Get)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Category", PermissionKey = "Edit")]
//        public JsonResult EditCategory(CategoryViewModel category)
//        {
//            try
//            {
//                var cat = _db.Categories.Find(category.Id);
//                if (cat != null && cat.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    cat.Status = category.Status;
//                    _db.Entry(cat).State = EntityState.Modified;
//                    _db.SaveChanges();

//                    var catTrans = _db.CategoryTranslations.FirstOrDefault(r => r.CategoryId == cat.Id && r.LanguageId == category.LanguageId);
//                    if (catTrans != null)
//                    {
//                        catTrans.Title = category.Title;
//                        catTrans.Description = category.Description;
//                        _db.Entry(catTrans).State = EntityState.Modified;
//                    }
//                    else
//                    {
//                        catTrans = new CategoryTranslation()
//                        {
//                            CategoryId = cat.Id,
//                            Description = category.Description,
//                            LanguageId = category.LanguageId,
//                            IsDefault = false,
//                            Title = category.Title
//                        };
//                        _db.CategoryTranslations.Add(catTrans);
//                    }

//                    _db.SaveChanges();
//                }


//                return Json(category, JsonRequestBehavior.AllowGet);
//            }
//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Category (Post)");
//                return null;
//            }
//        }

//        [HttpPost]
//        [CustomAuthentication(PageName = "Category", PermissionKey = "Delete")]
//        public JsonResult DeleteCategory(int id)
//        {
//            try
//            {
//                var category = _db.Categories.Find(id);
//                if (category != null && category.Status != (int)GeneralEnums.StatusEnum.Deleted)
//                {
//                    category.Status = (int)GeneralEnums.StatusEnum.Deleted;
//                    _db.Entry(category).State = EntityState.Modified;
//                    _db.SaveChanges();

//                    var categoryTrans = _db.CategoryTranslations.FirstOrDefault(r => r.CategoryId == id);
//                    return Json(new CategoryViewModel()
//                    {
//                        Id = categoryTrans.CategoryId,
//                        Title = categoryTrans.Title,
//                        Status = categoryTrans.Category.Status,
//                        Description = categoryTrans.Description,
//                        CreatedOn = categoryTrans.Category.CreatedOn,
//                        DeletedOn = categoryTrans.Category.DeletedOn,
//                        LanguageId = categoryTrans.LanguageId,
//                        CreatedBy = categoryTrans.Category.CreatedBy
//                    }, JsonRequestBehavior.AllowGet);
//                }
//                return Json(null, JsonRequestBehavior.AllowGet);
//            }

//            catch (Exception ex)
//            {
//                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting category");
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