
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Models;
using System.Security.Principal;

namespace CRM.Web.Helpers
{
    public static class MenuHelper
    {
        public static string GenerateSystemVerticalMenu(int userId, HttpCookie cultureCookie)
        {
            string menuHtml = string.Empty;
            using (var db = new CrmSystemEntities())
            {
                var menus = db.Menus.Where(r => r.Status == (int)GeneralEnums.StatusEnum.Active && r.ParentId == null).OrderBy(r => r.SortOrder).ToList();
                int count = 1;
                foreach (var menu in menus)
                {
                    var mainMenufilePath = HttpContext.Current.Server.MapPath(Constants.TempaltesPathes.Menu.MainMenu);
                    var mainMenuStream = new StreamReader(mainMenufilePath);
                    var mainMenuHtml = mainMenuStream.ReadToEnd();

                    var subMenufilePath = HttpContext.Current.Server.MapPath(Constants.TempaltesPathes.Menu.SubMenu);
                    var subMenuStream = new StreamReader(subMenufilePath);
                    var subMenuHtml = subMenuStream.ReadToEnd();

                    mainMenuHtml = mainMenuHtml.Replace("{tabHeadId}", count.ToString());
                    mainMenuHtml = mainMenuHtml.Replace("{tabCollapseId}", count.ToString());
                    mainMenuHtml = mainMenuHtml.Replace("{parentMenuIcon}", menu.Icon);
                    var langId = CultureHelper.GetCurrentLanguageId(cultureCookie);
                    mainMenuHtml = mainMenuHtml.Replace("{parentMenuTitle}", LanguageFallbackHelper.GetMenu(menu.Id, langId)?.Title);

                    //var page = db.Pages.FirstOrDefault(m => m.Menus.Any(c => c.Id == menu.Id));

                    //var pageId = HttpContext.Current.Request.QueryString["pageId"];
                    //if (menu.Menu1.Any(c => c.PageId == (!string.IsNullOrWhiteSpace(pageId) ? int.Parse(pageId) : 0)))
                    //{
                    //    mainMenuHtml = mainMenuHtml.Replace("{CollapseString}", "in");
                    //}
                    //else if (db.Menus.Where(r =>
                    //    r.ParentId == menu.Id && r.Status == (int)GeneralEnums.StatusEnum.Active).OrderBy(x => x.SortOrder).ToList()
                    //    .Any(i => i.Page != null && i.Page.PageUrl != null && (i.Page.PageUrl == (HttpContext.Current.Request.Path) || i.Page.PageUrl == (HttpContext.Current.Request.Url.AbsoluteUri))))
                    //{
                    //    mainMenuHtml = mainMenuHtml.Replace("{CollapseString}", "in");
                    //}
                    //else
                    //{
                    //    mainMenuHtml = mainMenuHtml.Replace("{CollapseString}", "");
                    //}

                    var subMenus = db.Menus.Where(r =>
                        r.ParentId == menu.Id && r.Status == (int)GeneralEnums.StatusEnum.Active).OrderBy(x => x.SortOrder).ToList();
                    var finalSubMenuHtml = string.Empty;
                    foreach (var subMenu in subMenus)
                    {
                        var tempSubMenuHtml = subMenuHtml;
                        //if (!string.IsNullOrWhiteSpace(subMenu?.Page?.PageUrl))
                        //{

                        //    tempSubMenuHtml = tempSubMenuHtml.Replace("{SubMenuLink}", subMenu.Page.PageUrl);

                        //}
                        //else
                        //{
                        //    if ((subMenu?.Page?.PublishDate != null && subMenu?.Page?.PublishDate < DateTime.Now) && (subMenu?.Page?.EndDate == null || subMenu?.Page?.EndDate > DateTime.Now))
                        //    {
                        //        tempSubMenuHtml = tempSubMenuHtml.Replace("{SubMenuLink}", subMenu.PageId == null ? "#" : $"/CmsPage/Page?pageId={subMenu.PageId}");
                        //    }
                        //    else
                        //    {
                        //        tempSubMenuHtml = "";
                        //    }
                        //}
                        //if (!(HttpContext.Current.User.IsInRole(Constants.Roles.Administrator) || HttpContext.Current.User.IsInRole(Constants.Roles.ContentAdmin)))
                        //{

                        //    if (!string.IsNullOrWhiteSpace(subMenu?.Page?.PageUrl))
                        //    {

                        //        tempSubMenuHtml = tempSubMenuHtml.Replace("{SubMenuLink}", subMenu.Page.PageUrl);

                        //    }
                        //    else
                        //    {
                        //        if ((subMenu?.Page?.PublishDate != null && subMenu?.Page?.PublishDate < DateTime.Now) && (subMenu?.Page?.EndDate == null || subMenu?.Page?.EndDate > DateTime.Now))
                        //        {
                        //            tempSubMenuHtml = tempSubMenuHtml.Replace("{SubMenuLink}", subMenu.PageId == null ? "#" : $"/CmsPage/Page?pageId={subMenu.PageId}");
                        //        }
                        //        else
                        //        {
                        //            tempSubMenuHtml = "";
                        //        }
                        //    }
                        //}

                        //else
                        //{
                        //    if (!string.IsNullOrWhiteSpace(subMenu?.Page?.PageUrl))
                        //    {
                        //        tempSubMenuHtml = tempSubMenuHtml.Replace("{SubMenuLink}", subMenu.Page.PageUrl);
                        //    }
                        //    else
                        //    {
                        //        tempSubMenuHtml = tempSubMenuHtml.Replace("{SubMenuLink}", subMenu.PageId == null ? "#" : $"/CmsPage/Page?pageId={subMenu.PageId}");
                        //    }
                        //}
                        tempSubMenuHtml = tempSubMenuHtml.Replace("{SubMenuTitle}", LanguageFallbackHelper.GetMenu(subMenu.Id, langId)?.Title);
                        finalSubMenuHtml += tempSubMenuHtml;
                    }
                    mainMenuHtml = mainMenuHtml.Replace("{subMenuHtml}", finalSubMenuHtml);
                    menuHtml += mainMenuHtml;
                    count++;
                }
            }

            return menuHtml;
        }

        public static List<MenuViewModel> GetParentMenus(HttpCookie cookie)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    int languageId = (int)GeneralEnums.LanguageEnum.Arabic;
                    if (cookie != null)
                    {
                        var languageName = CultureHelper.GetCultureName(cookie);
                        languageId = CultureHelper.MapLanguage(languageName);
                    }

                    var menus = db.Menus.Where(r => r.ParentId == null &&
                            r.MenuTranslations.Any(x => x.LanguageId == languageId)
                            && r.Status == (int)GeneralEnums.StatusEnum.Active).OrderBy(r => r.SortOrder)
                        .SelectMany(r => r.MenuTranslations.Where(l => l.LanguageId == languageId)).Select(x => new MenuViewModel()
                        {
                            Id = x.MenuId,
                            Title = x.Title,
                            Description = x.Description
                        }).ToList();

                    if (!menus.Any())
                    {
                        menus = LanguageFallbackHelper.GetDefaultParentMenus();
                    }
                    return menus;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Parent Menus");
                    return new List<MenuViewModel>();
                }

            }
        }
        

        public static List<MenuViewModel> GetMenus(HttpCookie cookie)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    int languageId = (int)GeneralEnums.LanguageEnum.Arabic;
                    if (cookie != null)
                    {
                        var languageName = CultureHelper.GetCultureName(cookie);
                        languageId = CultureHelper.MapLanguage(languageName);
                    }

                    var lookups = db.Menus.Where(r =>
                            r.MenuTranslations.Any(x => x.LanguageId == languageId)
                            && r.Status == (int)GeneralEnums.StatusEnum.Active).OrderBy(r => r.SortOrder)
                        .SelectMany(r => r.MenuTranslations.Where(l => l.LanguageId == languageId)).Select(x => new MenuViewModel()
                        {
                            Id = x.MenuId,
                            Title = x.Title,
                            Description = x.Description
                        }).ToList();

                    if (!lookups.Any())
                    {
                        lookups = LanguageFallbackHelper.GetDefaultMenus();
                    }
                    return lookups;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Parent Menus");
                    return new List<MenuViewModel>();
                }

            }
        }


        public static List<string> GetUserControlPanelPages(IPrincipal User)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    if (User != null)
                    {
                        var pages = new List<string>
                    {
                        "Users",
                        "Sla",
                        "StateTransitions",
                        "StateHistory",
                        "Roles",
                        "RolesPermissions",
                        "Settings",
                        "MasterLookups",
                        "Departments",
                        "SMSTemplate",
                        "Category","Article",
                        "Reports","FullCaseReport","CasesDaysByCategory","CasesSlaByCategory",
                        "ClosedCasesReport","PercentageOfResolvedCase",
                        "ContactUs",
                        "CasesSentAsEmail"
                    };

                        var aspUser = db.AspNetUsers.FirstOrDefault(r => r.UserName == User.Identity.Name);

                        var userRoles = aspUser?.AspNetUserRoles.ToList().Select(r => r.RoleId).ToList();

                        var pagesPermissions = db.Permissions.Where(t => t.PermissionKey == "View" && pages.Contains(t.PageName)
                                                && t.RolePermissions.Select(a => a.RoleId).Any(a => userRoles.Contains(a))).Select(t => t.PageName).ToList();

                        return pagesPermissions;
                    }
                    return new List<string>();
                }
                catch(Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting User Control Panel Pages");
                    return new List<string>();
                }
            }
        }

        public static void GetControlPanelControllerAndAction(string pageName, ref string controllerName, ref string actionName, out string label)
        {
            label = string.Empty;
            switch (pageName)
            {
                case "Users":
                    controllerName = "UserProfile"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.LinkUsers;
                    break;
                case "Sla":
                    controllerName = "Sla"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.LinkSla;
                    break;
                case "StateTransitions":
                    controllerName = "StateTransitions"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.LinkStateTransitionsConfigration;
                    break;
                case "StateHistory":
                    controllerName = "StateHistory"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.LinkStateHistory;
                    break;
                case "Roles":
                    controllerName = "Permissions"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.LinkPermission;
                    break;
                case "RolesPermissions":
                    controllerName = "RolePermissions"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.LinkRolePermissions;
                    break;
                case "Settings":
                    controllerName = "SystemSettings"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.TxtSystemSetting;
                    break;
                case "MasterLookups":
                    controllerName = "MasterLookups"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.LinkLookup;
                    break;
                case "Departments":
                    controllerName = "Department"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.LinkDepartment;
                    break;
                case "SMSTemplate":
                    controllerName = "SMS"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.SMSTemplates;
                    break;
                case "Category":
                    controllerName = "Category"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.Category;
                    break;
                case "Article":
                    controllerName = "Article"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.Article;
                    break;
                case "Reports":
                    controllerName = "Reports"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.ReportCharts;
                    break;
                case "FullCaseReport":
                    controllerName = "Reports"; actionName = "FullCasesReport";
                    label = App_GlobalResources.Reports.Reports.CasesReport;
                    break;
                case "CasesDaysByCategory":
                    controllerName = "Reports"; actionName = "CasesDaysByCategory";
                    label = App_GlobalResources.General.Layout.CaseByCategoryReport;
                    break;
                case "CasesSlaByCategory":
                    controllerName = "Reports"; actionName = "CasesDaysByCategory";
                    label = App_GlobalResources.General.Layout.CasesSlaByCategory;
                    break;
                case "ClosedCasesReport":
                    controllerName = "Reports"; actionName = "ClosedCasesReport";
                    label = App_GlobalResources.General.Layout.ClosedCasesReport;
                    break;
                case "PercentageOfResolvedCase":
                    controllerName = "Reports"; actionName = "PercentageOfResolvedCase";
                    label = App_GlobalResources.General.Layout.PercentageOfResolvedCase;
                    break;
                case "ContactUs":
                    controllerName = "ContactUs"; actionName = "Index";
                    label = App_GlobalResources.General.Layout.TxtContactUs;
                    break;
                case "CasesSentAsEmail":
                    controllerName = "Reports"; actionName = "CasesSentByEmail";
                    label = App_GlobalResources.General.Layout.CasesSentByEmail;
                    break;
            }
        }
    }
}