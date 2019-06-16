using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using CRM.Core.Helpers;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Filters;
using CRM.Web.Helpers;
using CRM.Web.Models;
using Microsoft.Ajax.Utilities;

namespace CRM.Web.Controllers
{
    public class MenuController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        [CustomAuthentication(PageName = "Menu", PermissionKey = "View")]
        public ActionResult Index(/*int? page, */string searchText/*, int resetTo = 0*/)
        {

            //if (resetTo == 1)
            //{
            //    page = 1;
            //}
            var statuses = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
            var parentMenus = MenuHelper.GetParentMenus(Request.Cookies["_culture"]);
            //var pages = PageHelper.GetPages(Request.Cookies["_culture"]);
            ViewBag.Status = new SelectList(statuses, "Id", "Name");
            //ViewBag.Icon = new SelectList(_db.Icons, "Name", "FriendlyName");
            ViewBag.ParentId = new SelectList(parentMenus, "Id", "Title");
            ViewBag.StatusEdit = new SelectList(statuses, "Id", "Name");
            //ViewBag.IconEdit = new SelectList(_db.Icons, "Name", "FriendlyName");
            ViewBag.ParentIdEdit = new SelectList(parentMenus, "Id", "Title");
            //ViewBag.PageId = new SelectList(pages, "Id", "Title");
            //ViewBag.PageIdEdit = new SelectList(pages, "Id", "Title");
            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

            var menusForcurrentLan = _db.MenuTranslations
                                  .Where(r => (r.LanguageId == currentLanguageId) &&
                                 r.Menu.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(c => c.MenuId);
            var menus = _db.MenuTranslations
                          .Where(r => (r.IsDefault) &&
                         r.Menu.Status != (int)GeneralEnums.StatusEnum.Deleted && !menusForcurrentLan.Contains(r.MenuId))
                         .Union(
                            _db.MenuTranslations
                          .Where(r => r.LanguageId == currentLanguageId && r.Menu.Status != (int)GeneralEnums.StatusEnum.Deleted && menusForcurrentLan.Contains(r.MenuId)))
                         .ToList();

            if (!searchText.IsNullOrWhiteSpace())
            {
                menus = menus
                    .Where(r =>
                                (r.Title.Contains(searchText) || r.Description.Contains(searchText))).ToList();
                ViewBag.searchText = searchText;
            }
            var result = menus.ToList().Select(x =>
                   new MenuViewModel()
                   {
                       Id = x.MenuId,
                       Title = x.Title,
                       Status = x.Menu.Status,
                       ParentId = x.Menu.ParentId,
                       ParentName = x.Menu.ParentId != null ? _db.MenuTranslations.FirstOrDefault(r => r.MenuId == x.Menu.ParentId && r.LanguageId == currentLanguageId)?.Title : string.Empty,
                       Description = x.Description,
                       CreatedOn = x.Menu.CreatedOn,
                       LanguageId = x.LanguageId,
                       DeletedOn = x.Menu.DeletedOn,
                       CreatedBy = x.Menu.CreatedBy,
                       SortOrder = x.Menu.SortOrder,
                       Icon = x.Menu.Icon,
                       PageId = x.Menu.PageId,
                       PageUrl = x.Menu.PageUrl
                       //PageName = x.Menu?.Page?.PageTranslations?.FirstOrDefault()?.Title,
                   });

            //int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            //var pageNumber = (page ?? 1);
            //return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));

            return View(result.ToList());
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Menu", PermissionKey = "Create")]
        public JsonResult AddMenu(MenuViewModel menu)
        {
            try
            {
                int languageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

                #region Add Menu
                var men = new Menu()
                {
                    CreatedBy = User.Identity.Name,
                    CreatedOn = DateTime.Now,
                    ParentId = menu.ParentId,
                    Status = menu.Status,
                    Icon = menu.Icon,
                    PageId = menu.PageId,
                    SortOrder = menu.SortOrder,
                    PageUrl = menu.PageUrl
                };
                _db.Menus.Add(men);
                _db.SaveChanges();

                var menTrans = new MenuTranslation()
                {
                    MenuId = men.Id,
                    Description = menu.Description,
                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                    LanguageId = languageId,
                    Title = menu.Title

                };
                _db.MenuTranslations.Add(menTrans);
                if (!menTrans.IsDefault)
                {
                    var menTrans1 = new MenuTranslation()
                    {
                        MenuId = men.Id,
                        Description = menu.Description,
                        IsDefault = true,
                        LanguageId = CultureHelper.GetDefaultLanguageId(),
                        Title = menu.Title

                    };
                    _db.MenuTranslations.Add(menTrans1);
                }

                _db.SaveChanges();


                #endregion
                

                return Json(menu, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new menu");
                return null;
            }
        }

        [HttpGet]
        [CustomAuthentication(PageName = "Menu", PermissionKey = "Edit")]
        public JsonResult EditMenu(int id, int languageId)
        {
            try
            {

                var men = _db.Menus.Find(id);
                if (men != null && men.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    var menu = LanguageFallbackHelper.GetMenu(id, languageId);
                    return Json(menu, JsonRequestBehavior.AllowGet);
                }


                return Json(null, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing menu (Get)");
                return null;
            }
        }
        [HttpPost]
        [CustomAuthentication(PageName = "Menu", PermissionKey = "Edit")]
        public JsonResult EditMenu(MenuViewModel menu)
        {
            try
            {
                var men = _db.Menus.Find(menu.Id);
                if (men != null && men.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    men.ParentId = menu.ParentId;
                    men.Status = menu.Status;
                    men.Icon = menu.Icon;
                    men.PageId = menu.PageId;
                    men.PageUrl = menu.PageUrl;
                    men.SortOrder = menu.SortOrder;
                    _db.Entry(men).State = EntityState.Modified;
                    _db.SaveChanges();


                    var menTrans = _db.MenuTranslations.FirstOrDefault(r => r.MenuId == men.Id && r.LanguageId == menu.LanguageId);
                    if (menTrans != null)
                    {
                        menTrans.Title = menu.Title;
                        menTrans.Description = menu.Description;
                        _db.Entry(menTrans).State = EntityState.Modified;
                    }
                    else
                    {
                        menTrans = new MenuTranslation()
                        {
                            MenuId = men.Id,
                            Description = menu.Description,
                            IsDefault = false,
                            LanguageId = menu.LanguageId,
                            Title = menu.Title
                        };
                        _db.MenuTranslations.Add(menTrans);
                    }

                    _db.SaveChanges();
                }


                return Json(menu, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing menu (Post)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "Menu", PermissionKey = "Delete")]
        public JsonResult DeleteMenu(int id)
        {
            try
            {
                var men = _db.Menus.Find(id);
                if (men != null && men.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    men.Status = (int)GeneralEnums.StatusEnum.Deleted;
                    _db.Entry(men).State = EntityState.Modified;
                    _db.SaveChanges();

                    var menu = _db.MenuTranslations.FirstOrDefault(r => r.MenuId == id);
                    return Json(new MenuViewModel()
                    {
                        Id = menu.MenuId,
                        Title = menu.Title,
                        Status = menu.Menu.Status,
                        ParentId = menu.Menu.ParentId,
                        Description = menu.Description,
                        CreatedOn = menu.Menu.CreatedOn,
                        DeletedOn = menu.Menu.DeletedOn,
                        LanguageId = menu.LanguageId,
                        CreatedBy = menu.Menu.CreatedBy,
                        PageId = men.PageId,
                        PageUrl = men.PageUrl,
                        SortOrder = men.SortOrder,
                        Icon = men.Icon,
                        //PageName = men.Page?.PageTranslations?.FirstOrDefault()?.Title,
                        ParentName = men.ParentId != null ? _db.MenuTranslations.FirstOrDefault(r => r.MenuId == men.ParentId)?.Title : string.Empty
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);
            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting menu");
                return null;
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