
using System;
using System.Collections.Generic;
using System.Linq;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.DataEntity.Models;
using CRM.Web.Models;
using CRM.Core.Models;
using CRM.Core.SystemEnums;
using System.Security.Principal;

namespace CRM.Web.Helpers
{
    public class LanguageFallbackHelper
    {

        public static MasterLookupViewModel GetMasterLookup(int id, int language)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var masterLookup = db.MasterLookupTranslations.Where(r => r.Id == id && r.LanguageId == language && r.MasterLookup.Status != (int)GeneralEnums.StatusEnum.Deleted).ToList()
                        .Select(x => new MasterLookupViewModel()
                        {
                            Id = x.MasterLookupId,
                            CreatedBy = x.MasterLookup.CreatedBy,
                            CreatedOn = x.MasterLookup.CreatedOn,
                            DeletedOn = x.MasterLookup.DeletedOn,
                            IsDefault = x.IsDefault,
                            LanguageId = x.LanguageId,
                            Name = x.Name,
                            Status = x.MasterLookup.Status
                        }).FirstOrDefault();
                    if (masterLookup == null)
                    {
                        masterLookup = db.MasterLookups.Where(x => x.MasterLookupTranslations.Any(r => r.IsDefault) && x.Id == id && x.Status == (int)GeneralEnums.StatusEnum.Active)
                            .ToList()
                            .SelectMany(x => x.MasterLookupTranslations)
                            .Select(x => new MasterLookupViewModel()
                            {

                                Id = x.MasterLookupId,
                                CreatedBy = x.MasterLookup.CreatedBy,
                                CreatedOn = x.MasterLookup.CreatedOn,
                                DeletedOn = x.MasterLookup.DeletedOn,
                                IsDefault = x.IsDefault,
                                LanguageId = x.LanguageId,
                                Name = x.Name,
                                Status = x.MasterLookup.Status

                            }).FirstOrDefault();
                    }
                    return masterLookup;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting MasterLookup");
                    return null;

                }
            }
        }

        public static DetailsLookupViewModel GetDetailsLookup(int id, int language)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var detailLookup = db.DetailsLookupTranslations.Where(r => r.DetailsLookupId == id && r.LanguageId == language && r.DetailsLookup.Status != (int)GeneralEnums.StatusEnum.Deleted)
                        .ToList()
                        .Select(x => new DetailsLookupViewModel()
                        {
                            Id = x.DetailsLookupId,
                            CreatedBy = x.DetailsLookup.CreatedBy,
                            CreatedOn = x.DetailsLookup.CreatedOn,
                            IsDefault = x.IsDefault,
                            Name = x.Value,
                            Status = x.DetailsLookup.Status,
                            LanguageId = x.LanguageId,
                            DeletedOn = x.DetailsLookup.DeletedOn,
                            MasterId = x.DetailsLookup.MasterId

                        }).FirstOrDefault();

                    if (detailLookup == null)
                    {
                        detailLookup = db.DetailsLookups.Where(m => m.DetailsLookupTranslations.Any(x => x.IsDefault) && m.Id == id && m.Status == (int)GeneralEnums.StatusEnum.Active)
                            .ToList()
                            .SelectMany(m => m.DetailsLookupTranslations)
                            .Select(x => new DetailsLookupViewModel()
                            {
                                Id = x.DetailsLookupId,
                                CreatedBy = x.DetailsLookup.CreatedBy,
                                CreatedOn = x.DetailsLookup.CreatedOn,
                                IsDefault = x.IsDefault,
                                Name = x.Value,
                                Status = x.DetailsLookup.Status,
                                LanguageId = x.LanguageId,
                                DeletedOn = x.DetailsLookup.DeletedOn,
                                MasterId = x.DetailsLookup.MasterId
                            }).FirstOrDefault();
                    }
                    return detailLookup;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Details Lookup");
                    return null;
                }
            }
        }

        public static SettingViewModel GetSystemSetting(int id, int language)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var systemSetting = db.SystemSettingTranslations.Where(r => r.SettingId == id && r.LanguageId == language && r.SystemSetting.Status != (int)GeneralEnums.StatusEnum.Deleted).ToList()
                        .Select(x => new SettingViewModel()
                        {
                            Id = x.SettingId,
                            CreatedBy = x.SystemSetting.CreatedBy,
                            CreatedOn = x.SystemSetting.CreatedOn,
                            DeletedOn = x.SystemSetting.DeletedOn,
                            LanguageId = x.LanguageId,
                            Name = x.Name,
                            Status = x.SystemSetting.Status,
                            Value = x.Value

                        }).FirstOrDefault();
                    if (systemSetting == null)
                    {
                        systemSetting = db.SystemSettings.Where(x => x.SystemSettingTranslations.Any(r => r.IsDefault) && x.Id == id && x.Status == (int)GeneralEnums.StatusEnum.Active)
                            .ToList()
                            .SelectMany(x => x.SystemSettingTranslations)
                            .Select(x => new SettingViewModel()
                            {

                                Id = x.SettingId,
                                CreatedBy = x.SystemSetting.CreatedBy,
                                CreatedOn = x.SystemSetting.CreatedOn,
                                DeletedOn = x.SystemSetting.DeletedOn,
                                LanguageId = x.LanguageId,
                                Name = x.Name,
                                Status = x.SystemSetting.Status,
                                Value = x.Value

                            }).FirstOrDefault();
                    }
                    return systemSetting;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting System Setting ");
                    return null;

                }
            }
        }

        public static List<MenuViewModel> GetDefaultMenus()
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var menus = db.Menus.Where(r => r.Status == (int)GeneralEnums.StatusEnum.Active
                                   && r.MenuTranslations.Any(x => x.IsDefault))
                        .SelectMany(r => r.MenuTranslations).Select(x => new MenuViewModel()
                        {
                            Id = x.MenuId,
                            Title = x.Title,
                            Description = x.Description
                        }).ToList();

                    return menus;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Default Parent Menus");
                    return new List<MenuViewModel>();
                }

            }
        }

        public static SystemFileTranslation GetDefaultSystemFile(List<SystemFileTranslation> files)
        {
            try
            {
                return files.FirstOrDefault(r => r.IsDefault) ?? new SystemFileTranslation();
            }
            catch (Exception ex)
            {
                LogHelper.LogException("", ex, "Error While Getting Default System File");
                return new SystemFileTranslation();
            }
        }

        public static List<DetailsLookupViewModel> GetDefaultLookupDetailsByMasterId(int masterLookupId)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var lookups = db.DetailsLookups.Where(r =>
                            r.DetailsLookupTranslations.Any(x => x.IsDefault)
                            && r.MasterId == masterLookupId && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.DetailsLookupTranslations).Select(x => new DetailsLookupViewModel()
                        {
                            Id = x.DetailsLookupId,
                            Name = x.Value
                        }).ToList();

                    return lookups;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, $"Error While Getting Default Lookup Details By Master lookup Id {masterLookupId}");
                    return new List<DetailsLookupViewModel>();
                }

            }
        }

        public static List<DepartmentViewModel> GetDefaultDepartments()
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var lookups = db.Departments.Where(r =>
                            r.DepartmentTranslations.Any(x => x.IsDefault)
                           && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.DepartmentTranslations).Select(x => new DepartmentViewModel()
                        {
                            Id = x.DepartmentId,
                            Name = x.Name,
                            Description = x.Description,
                            LanguageId = x.LanguageId,
                            CreatedBy = x.Department.CreatedBy,
                            CreatedOn = x.Department.CreatedOn
                        }).ToList();

                    return lookups;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Default Departments");
                    return new List<DepartmentViewModel>();
                }

            }
        }

        public static List<CategoryViewModel> GetDefaultCategories()
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var cats = db.Categories.Where(r =>
                            r.CategoryTranslations.Any(x => x.IsDefault)
                           && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.CategoryTranslations).Select(x => new CategoryViewModel()
                        {
                            Id = x.CategoryId,
                            Title = x.Title,
                            Description = x.Description,
                            LanguageId = x.LanguageId,
                            CreatedBy = x.Category.CreatedBy,
                            CreatedOn = x.Category.CreatedOn
                        }).ToList();

                    return cats;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Default Categories");
                    return new List<CategoryViewModel>();
                }

            }
        }

        public static List<ProfileViewModel> GetDefaultUserProfiles()
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var lookups = db.UserProfiles.Where(r =>
                            r.UserProfileTranslations.Any(x => x.IsDefault)
                            && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.UserProfileTranslations).ToList().Select(x => new ProfileViewModel()
                        {
                            Id = x.UserProfileId,
                            LanguageId = x.LanguageId,
                            IdNumber = x.UserProfile.IdNumber,
                            PhoneNumber = x.UserProfile.PhoneNumber,
                            GenderLookupId = x.UserProfile.GenderLookupId,
                            MartialStatusLookupId = x.UserProfile.MartialStatusLookupId,
                            FullName = x.FullName,
                            Address = x.Address,
                            Mobile = x.UserProfile.Mobile,
                            Email = x.UserProfile.Username,
                            Fax = x.UserProfile.Fax,
                            BirthDay = x.UserProfile.Birthday,
                            Status = x.UserProfile.Status,
                            CityId = x.UserProfile.CityId,
                            ProvinceId = x.UserProfile.ProvinceId,
                            RegionId = x.UserProfile.RegionId,
                            LastLogin = x.UserProfile.LastLogin,
                            ManagerId = x.UserProfile.ManagerId,
                            ManagerName = x.UserProfile?.ManagerId != null ? LanguageFallbackHelper.GetUserProfile((int)x.UserProfile.ManagerId, CultureHelper.GetDefaultLanguageId())?.FullName : string.Empty,
                            Department = x.UserProfile.DepartmentId,
                            DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, CultureHelper.GetDefaultLanguageId())?.Name : string.Empty,
                            PrefferdLanguage = x.UserProfile.PreferedLanguageId
                        }).ToList();

                    return lookups;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Default User profiles");
                    return new List<ProfileViewModel>();
                }

            }
        }

        public static List<ProfileViewModel> GetDefaultEmployeeProfiles()
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var employees = db.AspNetUserRoles.Where(r => r.AspNetRole.Name != Constants.Roles.Citizen)
                        .Select(r => r.AspNetUser.UserName).ToList();

                    var lookups = db.UserProfiles.Where(r => employees.Contains(r.Username) &&
                            r.UserProfileTranslations.Any(x => x.IsDefault)
                            && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.UserProfileTranslations).ToList().Select(x => new ProfileViewModel()
                        {
                            Id = x.UserProfileId,
                            LanguageId = x.LanguageId,
                            IdNumber = x.UserProfile.IdNumber,
                            PhoneNumber = x.UserProfile.PhoneNumber,
                            GenderLookupId = x.UserProfile.GenderLookupId,
                            MartialStatusLookupId = x.UserProfile.MartialStatusLookupId,
                            FullName = x.FullName,
                            Address = x.Address,
                            Mobile = x.UserProfile.Mobile,
                            Email = x.UserProfile.Username,
                            Fax = x.UserProfile.Fax,
                            BirthDay = x.UserProfile.Birthday,
                            Status = x.UserProfile.Status,
                            CityId = x.UserProfile.CityId,
                            ProvinceId = x.UserProfile.ProvinceId,
                            RegionId = x.UserProfile.RegionId,
                            LastLogin = x.UserProfile.LastLogin,
                            ManagerId = x.UserProfile.ManagerId,
                            ManagerName = x.UserProfile?.ManagerId != null ? LanguageFallbackHelper.GetUserProfile((int)x.UserProfile.ManagerId, CultureHelper.GetDefaultLanguageId())?.FullName : string.Empty,
                            Department = x.UserProfile.DepartmentId,
                            DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, CultureHelper.GetDefaultLanguageId())?.Name : string.Empty,
                            PrefferdLanguage = x.UserProfile.PreferedLanguageId
                        }).ToList();

                    return lookups;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Default Employee profiles");
                    return new List<ProfileViewModel>();
                }

            }
        }

        public static DetailsLookupViewModel GetDefaultLookupDetailsById(int lookupId)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var lookups = db.DetailsLookups.Where(r =>
                            r.DetailsLookupTranslations.Any(x => x.IsDefault)
                            && r.Id == lookupId && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.DetailsLookupTranslations).Select(x => new DetailsLookupViewModel()
                        {
                            Id = x.DetailsLookupId,
                            Name = x.Value
                        }).FirstOrDefault();

                    return lookups;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, $"Error While Getting Default Lookup Details By lookup Id {lookupId}");
                    return new DetailsLookupViewModel();
                }

            }
        }

        public static MenuViewModel GetMenu(int id, int languageId)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var category = db.MenuTranslations.Where(r => r.MenuId == id && r.Menu.Status != (int)GeneralEnums.StatusEnum.Deleted && r.LanguageId == languageId)
                        .ToList().Select(x => new MenuViewModel()
                        {
                            Id = x.MenuId,
                            Title = x.Title,
                            Status = x.Menu.Status,
                            ParentId = x.Menu.ParentId,
                            Description = x.Description,
                            CreatedOn = x.Menu.CreatedOn,
                            DeletedOn = x.Menu.DeletedOn,
                            LanguageId = x.LanguageId,
                            CreatedBy = x.Menu.CreatedBy,
                            SortOrder = x.Menu.SortOrder,
                            PageId = x.Menu.PageId,
                            PageUrl = x.Menu.PageUrl,
                            Icon = x.Menu.Icon,
                            PageName = string.Empty, // TODO: set it to the correct name
                            ParentName = x.Menu.ParentId != null ? GetMenu((int)x.Menu.ParentId, languageId)?.Title : string.Empty,
                        }).FirstOrDefault();

                    if (category == null)
                    {
                        category = db.Menus.Where(r => r.MenuTranslations.Any(x => x.IsDefault)
                              && r.Id == id && r.Status == (int)GeneralEnums.StatusEnum.Active).ToList()
                            .SelectMany(r => r.MenuTranslations).Select(x => new MenuViewModel()
                            {
                                Id = x.MenuId,
                                Title = x.Title,
                                Status = x.Menu.Status,
                                ParentId = x.Menu.ParentId,
                                Description = x.Description,
                                CreatedOn = x.Menu.CreatedOn,
                                DeletedOn = x.Menu.DeletedOn,
                                LanguageId = x.LanguageId,
                                CreatedBy = x.Menu.CreatedBy,
                                SortOrder = x.Menu.SortOrder,
                                PageId = x.Menu.PageId,
                                PageUrl = x.Menu.PageUrl,
                                Icon = x.Menu.Icon,
                                PageName = string.Empty, // TODO: set it to the correct name
                                ParentName = x.Menu.ParentId != null ? GetMenu((int)x.Menu.ParentId, languageId)?.Title : string.Empty,
                            }).FirstOrDefault();
                    }

                    return category;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Menu");
                    return new MenuViewModel();
                }

            }
        }

        public static DepartmentViewModel GetDepartment(int id, int languageId)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var department = db.DepartmentTranslations.Where(r => r.DepartmentId == id && r.Department.Status != (int)GeneralEnums.StatusEnum.Deleted && r.LanguageId == languageId)
                        .ToList().Select(x => new DepartmentViewModel()
                        {
                            Id = x.DepartmentId,
                            Name = x.Name,
                            Status = x.Department.Status,
                            Description = x.Description,
                            CreatedOn = x.Department.CreatedOn,
                            DeletedOn = x.Department.DeletedOn,
                            LanguageId = x.LanguageId,
                            CreatedBy = x.Department.CreatedBy,
                        }).FirstOrDefault();

                    if (department == null)
                    {
                        department = db.Departments.Where(r => r.DepartmentTranslations.Any(x => x.IsDefault)
                              && r.Id == id && r.Status == (int)GeneralEnums.StatusEnum.Active).ToList()
                            .SelectMany(r => r.DepartmentTranslations).Select(x => new DepartmentViewModel()
                            {
                                Id = x.DepartmentId,
                                Name = x.Name,
                                Status = x.Department.Status,
                                Description = x.Description,
                                CreatedOn = x.Department.CreatedOn,
                                DeletedOn = x.Department.DeletedOn,
                                LanguageId = x.LanguageId,
                                CreatedBy = x.Department.CreatedBy
                            }).FirstOrDefault();
                    }

                    return department;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Department");
                    return new DepartmentViewModel();
                }

            }
        }

        public static SMSTemplateViewModel GetSMSTemplate(int id, int languageId)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var smsTemplate = db.SMSTemplateTranslations.Where(r => r.SMSTemplateId == id && r.SMSTemplate.Status != (int)GeneralEnums.StatusEnum.Deleted && r.LanguageId == languageId)
                        .ToList().Select(x => new SMSTemplateViewModel()
                        {
                            Id = x.SMSTemplateId,
                            Name = x.Name,
                            Status = x.SMSTemplate.Status,
                            Description = x.Description,
                            CreatedOn = x.SMSTemplate.CreatedOn,
                            DeletedOn = x.SMSTemplate.DeletedOn,
                            LanguageId = x.LanguageId,
                            DefaultTemplateLanguage = x.SMSTemplate.DefaultLanguage,
                            CreatedBy = x.SMSTemplate.CreatedBy,
                        }).FirstOrDefault();

                    if (smsTemplate == null)
                    {
                        smsTemplate = db.SMSTemplates.Where(r => r.SMSTemplateTranslations.Any(x => x.IsDefault)
                              && r.Id == id && r.Status == (int)GeneralEnums.StatusEnum.Active).ToList()
                            .SelectMany(r => r.SMSTemplateTranslations).Select(x => new SMSTemplateViewModel()
                            {
                                Id = x.SMSTemplateId,
                                Name = x.Name,
                                Status = x.SMSTemplate.Status,
                                Description = x.Description,
                                CreatedOn = x.SMSTemplate.CreatedOn,
                                DeletedOn = x.SMSTemplate.DeletedOn,
                                LanguageId = x.LanguageId,
                                DefaultTemplateLanguage = x.SMSTemplate.DefaultLanguage,
                                CreatedBy = x.SMSTemplate.CreatedBy
                            }).FirstOrDefault();
                    }

                    return smsTemplate;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting SMS Template");
                    return new SMSTemplateViewModel();
                }

            }
        }

        public static List<SMSTemplateViewModel> GetBothLanguageSMSTemplate(int id)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var smsTemplate = db.SMSTemplateTranslations.Where(r => r.SMSTemplateId == id &&
                    r.SMSTemplate.Status != (int)GeneralEnums.StatusEnum.Deleted)
                        .ToList().Select(x => new SMSTemplateViewModel()
                        {
                            Id = x.SMSTemplateId,
                            Name = x.Name,
                            Status = x.SMSTemplate.Status,
                            Description = x.Description,
                            CreatedOn = x.SMSTemplate.CreatedOn,
                            DeletedOn = x.SMSTemplate.DeletedOn,
                            LanguageId = x.LanguageId,
                            DefaultTemplateLanguage = x.SMSTemplate.DefaultLanguage,
                            CreatedBy = x.SMSTemplate.CreatedBy,
                        }).ToList();

                    if (smsTemplate.Count == 0)
                    {
                        smsTemplate = db.SMSTemplates.Where(r => r.SMSTemplateTranslations.Any(x => x.IsDefault)
                              && r.Id == id && r.Status == (int)GeneralEnums.StatusEnum.Active).ToList()
                            .SelectMany(r => r.SMSTemplateTranslations).Select(x => new SMSTemplateViewModel()
                            {
                                Id = x.SMSTemplateId,
                                Name = x.Name,
                                Status = x.SMSTemplate.Status,
                                Description = x.Description,
                                CreatedOn = x.SMSTemplate.CreatedOn,
                                DeletedOn = x.SMSTemplate.DeletedOn,
                                LanguageId = x.LanguageId,
                                DefaultTemplateLanguage = x.SMSTemplate.DefaultLanguage,
                                CreatedBy = x.SMSTemplate.CreatedBy
                            }).ToList();
                    }

                    return smsTemplate;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting SMS Template");
                    return new List<SMSTemplateViewModel>();
                }

            }
        }

        public static CategoryViewModel GetCategory(int id, int languageId)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var smsTemplate = db.CategoryTranslations.Where(r => r.CategoryId == id && r.Category.Status != (int)GeneralEnums.StatusEnum.Deleted && r.LanguageId == languageId)
                        .ToList().Select(x => new CategoryViewModel()
                        {
                            Id = x.CategoryId,
                            Title = x.Title,
                            Status = x.Category.Status,
                            Description = x.Description,
                            CreatedOn = x.Category.CreatedOn,
                            DeletedOn = x.Category.DeletedOn,
                            LanguageId = x.LanguageId,
                            CreatedBy = x.Category.CreatedBy,
                        }).FirstOrDefault();

                    if (smsTemplate == null)
                    {
                        smsTemplate = db.Categories.Where(r => r.CategoryTranslations.Any(x => x.IsDefault)
                              && r.Id == id && r.Status == (int)GeneralEnums.StatusEnum.Active).ToList()
                            .SelectMany(r => r.CategoryTranslations).Select(x => new CategoryViewModel()
                            {
                                Id = x.CategoryId,
                                Title = x.Title,
                                Status = x.Category.Status,
                                Description = x.Description,
                                CreatedOn = x.Category.CreatedOn,
                                DeletedOn = x.Category.DeletedOn,
                                LanguageId = x.LanguageId,
                                CreatedBy = x.Category.CreatedBy
                            }).FirstOrDefault();
                    }
                    return smsTemplate;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Category");
                    return new CategoryViewModel();
                }

            }
        }

        //public static ArticleViewModel GetArticle(int id, int languageId)
        //{
        //    using (var db = new CrmSystemEntities())
        //    {
        //        try
        //        {
        //            var smsTemplate = db.ArticleTranslations.Where(r => r.ArticleId == id && r.Article.Status != (int)GeneralEnums.StatusEnum.Deleted && r.LanguageId == languageId)
        //                .ToList().Select(x => new ArticleViewModel()
        //                {
        //                    Id = x.ArticleId,
        //                    Title = x.Title,
        //                    Category = x.Article.CategoryId,
        //                    Status = x.Article.Status,
        //                    Description = x.Description,
        //                    CreatedOn = x.Article.CreatedOn,
        //                    DeletedOn = x.Article.DeletedOn,
        //                    LanguageId = x.LanguageId,
        //                    CreatedBy = x.Article.CreatedBy,
        //                }).FirstOrDefault();

        //            if (smsTemplate == null)
        //            {
        //                smsTemplate = db.Articles.Where(r => r.ArticleTranslations.Any(x => x.IsDefault)
        //                      && r.Id == id && r.Status == (int)GeneralEnums.StatusEnum.Active).ToList()
        //                    .SelectMany(r => r.ArticleTranslations).Select(x => new ArticleViewModel()
        //                    {
        //                        Id = x.ArticleId,
        //                        Title = x.Title,
        //                        Status = x.Article.Status,
        //                        Category = x.Article.CategoryId,
        //                        Description = x.Description,
        //                        CreatedOn = x.Article.CreatedOn,
        //                        DeletedOn = x.Article.DeletedOn,
        //                        LanguageId = x.LanguageId,
        //                        CreatedBy = x.Article.CreatedBy
        //                    }).FirstOrDefault();
        //            }

        //            var articleMappingData = db.Mapping_Article.Where(t => t.ArticleId == id).FirstOrDefault();
        //            if (articleMappingData != null)
        //            {
        //                if (articleMappingData.TableId == (int)GeneralEnums.Mapping_Article_Type.Master)
        //                {
        //                    smsTemplate.MasterLookupId = articleMappingData.TableValue;
        //                }
        //                else if (articleMappingData.TableId == (int)GeneralEnums.Mapping_Article_Type.Detailes)
        //                {
        //                    smsTemplate.DetailesLookupId = articleMappingData.TableValue;
        //                }
        //            }

        //            return smsTemplate;
        //        }
        //        catch (Exception ex)
        //        {
        //            LogHelper.LogException("", ex, "Error While Getting Article");
        //            return new ArticleViewModel();
        //        }

        //    }
        //}

        public static ProfileViewModel GetUserProfile(int id, int languageId)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var userProfile = db.UserProfileTranslations.Where(r => r.UserProfileId == id && r.UserProfile.Status != (int)GeneralEnums.StatusEnum.Deleted && r.LanguageId == languageId)
                        .ToList().Select(x => new ProfileViewModel()
                        {
                            Id = x.UserProfileId,
                            LanguageId = x.LanguageId,
                            IdNumber = x.UserProfile.IdNumber,
                            PhoneNumber = x.UserProfile.PhoneNumber,
                            GenderLookupId = x.UserProfile.GenderLookupId,
                            MartialStatusLookupId = x.UserProfile.MartialStatusLookupId,
                            FullName = x.FullName,
                            Address = x.Address,
                            Mobile = x.UserProfile.Mobile,
                            Email = x.UserProfile.Username,
                            Fax = x.UserProfile.Fax,
                            BirthDay = x.UserProfile.Birthday,
                            Status = x.UserProfile.Status,
                            CityId = x.UserProfile.CityId,
                            ProvinceId = x.UserProfile.ProvinceId,
                            RegionId = x.UserProfile.RegionId,
                            LastLogin = x.UserProfile.LastLogin,
                            ManagerId = x.UserProfile.ManagerId,
                            Username = x.UserProfile.Username,
                            Department = x.UserProfile.DepartmentId,
                            DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, languageId)?.Name : string.Empty,
                            PrefferdLanguage = x.UserProfile.PreferedLanguageId
                        }).FirstOrDefault();

                    if (userProfile == null)
                    {
                        userProfile = db.UserProfiles.Where(r => r.UserProfileTranslations.Any(x => x.IsDefault)
                              && r.Id == id && r.Status == (int)GeneralEnums.StatusEnum.Active).ToList()
                            .SelectMany(r => r.UserProfileTranslations).Select(x => new ProfileViewModel()
                            {
                                Id = x.UserProfileId,
                                LanguageId = x.LanguageId,
                                IdNumber = x.UserProfile.IdNumber,
                                PhoneNumber = x.UserProfile.PhoneNumber,
                                GenderLookupId = x.UserProfile.GenderLookupId,
                                MartialStatusLookupId = x.UserProfile.MartialStatusLookupId,
                                FullName = x.FullName,
                                Address = x.Address,
                                Username = x.UserProfile.Username,
                                Mobile = x.UserProfile.Mobile,
                                Email = x.UserProfile.Username,
                                Fax = x.UserProfile.Fax,
                                BirthDay = x.UserProfile.Birthday,
                                Status = x.UserProfile.Status,
                                CityId = x.UserProfile.CityId,
                                ProvinceId = x.UserProfile.ProvinceId,
                                RegionId = x.UserProfile.RegionId,
                                LastLogin = x.UserProfile.LastLogin,
                                ManagerId = x.UserProfile.ManagerId,
                                Department = x.UserProfile.DepartmentId,
                                DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, languageId)?.Name : string.Empty,
                                PrefferdLanguage = x.UserProfile.PreferedLanguageId
                            }).FirstOrDefault();
                    }

                    return userProfile;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting User Profile");
                    return new ProfileViewModel();
                }

            }
        }

        public static CampaignViewModel GetCampaigns(int id, int languageId)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                
                    var camp = db.Campaigns.Where(r=>r.Id == id).ToList().Select(x => new CampaignViewModel()
                    {
                        Id=x.Id,
                        Name=x.Name
                    }).FirstOrDefault();
                   
                    return camp;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Campaings");
                    return new CampaignViewModel();
                }
            }
        }
        public static ProfileViewModel GetUserProfileByUsername(string username, int languageId)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var userProfile = db.UserProfileTranslations.Where(r => r.UserProfile.Username == username && r.UserProfile.Status != (int)GeneralEnums.StatusEnum.Deleted && r.LanguageId == languageId)
                        .ToList().Select(x => new ProfileViewModel()
                        {
                            Id = x.UserProfileId,
                            LanguageId = x.LanguageId,
                            IdNumber = x.UserProfile.IdNumber,
                            PhoneNumber = x.UserProfile.PhoneNumber,
                            GenderLookupId = x.UserProfile.GenderLookupId,
                            MartialStatusLookupId = x.UserProfile.MartialStatusLookupId,
                            FullName = x.FullName,
                            Address = x.Address,
                            Mobile = x.UserProfile.Mobile,
                            Email = x.UserProfile.Username,
                            Fax = x.UserProfile.Fax,
                            BirthDay = x.UserProfile.Birthday,
                            Status = x.UserProfile.Status,
                            CityId = x.UserProfile.CityId,
                            ProfilePath = x.UserProfile.ProfilePhoto,
                            ProvinceId = x.UserProfile.ProvinceId,
                            RegionId = x.UserProfile.RegionId,
                            LastLogin = x.UserProfile.LastLogin,
                            ManagerId = x.UserProfile.ManagerId,
                            Username = x.UserProfile.Username,
                            Department = x.UserProfile.DepartmentId,
                            DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, languageId)?.Name : string.Empty,
                            PrefferdLanguage = x.UserProfile.PreferedLanguageId
                        }).FirstOrDefault();

                    if (userProfile == null)
                    {
                        userProfile = db.UserProfiles.Where(r => r.UserProfileTranslations.Any(x => x.IsDefault)
                              && r.Username == username && r.Status == (int)GeneralEnums.StatusEnum.Active).ToList()
                            .SelectMany(r => r.UserProfileTranslations).Select(x => new ProfileViewModel()
                            {
                                Id = x.UserProfileId,
                                LanguageId = x.LanguageId,
                                IdNumber = x.UserProfile.IdNumber,
                                PhoneNumber = x.UserProfile.PhoneNumber,
                                GenderLookupId = x.UserProfile.GenderLookupId,
                                MartialStatusLookupId = x.UserProfile.MartialStatusLookupId,
                                FullName = x.FullName,
                                ProfilePath = x.UserProfile.ProfilePhoto,
                                Address = x.Address,
                                Mobile = x.UserProfile.Mobile,
                                Email = x.UserProfile.Username,
                                Fax = x.UserProfile.Fax,
                                BirthDay = x.UserProfile.Birthday,
                                Status = x.UserProfile.Status,
                                CityId = x.UserProfile.CityId,
                                ProvinceId = x.UserProfile.ProvinceId,
                                RegionId = x.UserProfile.RegionId,
                                LastLogin = x.UserProfile.LastLogin,
                                ManagerId = x.UserProfile.ManagerId,
                                Department = x.UserProfile.DepartmentId,
                                DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, languageId)?.Name : string.Empty,
                                PrefferdLanguage = x.UserProfile.PreferedLanguageId
                            }).FirstOrDefault();
                    }

                    return userProfile;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting UserProfile by username");
                    return new ProfileViewModel();
                }

            }
        }

        public static List<MenuViewModel> GetDefaultParentMenus()
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var menus = db.Menus.Where(r => r.ParentId == null
                                                    && r.MenuTranslations.Any(x => x.IsDefault)
                                                    && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.MenuTranslations).Select(x => new MenuViewModel()
                        {
                            Id = x.MenuId,
                            Title = x.Title,
                            Description = x.Description
                        }).ToList();

                    return menus;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Default Parent Menus");
                    return new List<MenuViewModel>();
                }

            }
        }

        public static List<string> GetFormWinnersNames(string formId, int langId, int winnerStatus)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    var formWinnersNames = db.SystemCases.Where(t => t.FormId == formId).ToList().Select(t => new
                    {
                        fullName = t.StateHistories.LastOrDefault() != null ?
                              (t.StateHistories.LastOrDefault().CurrentState == winnerStatus) ?
                               LanguageFallbackHelper.GetUserProfileByUsername(t.CreatedBy, langId).FullName : string.Empty : string.Empty
                    }).ToList();

                    return formWinnersNames.Where(t => t.fullName.IsNotNullOrEmpty()).Select(t => t.fullName).ToList();
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Form Winners Names");
                    return new List<string>();
                }

            }
        }

        public static List<RoleViewModel> GetUserRoles(IPrincipal User)
        {
            using(var db = new CrmSystemEntities())
            {
                try
                {
                    if(User != null && User.Identity.Name.IsNotNullOrEmpty())
                    {
                        var aspUser = db.AspNetUsers.FirstOrDefault(r => r.UserName == User.Identity.Name);

                        var userRoles = aspUser?.AspNetUserRoles.ToList().Select(r => new RoleViewModel
                        {
                            RoleId = r.RoleId,
                            Name = r.AspNetRole.Name
                        }).ToList();
                        return userRoles;
                    }
                    return new List<RoleViewModel>();
                }
                catch(Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting User Roles");
                    return new List<RoleViewModel>();
                }
            }
        }
    }
}