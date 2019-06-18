using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.Core.Models;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Models;

namespace CRM.Web.Helpers
{
    public static class LookupHelper
    {
        public static List<DetailsLookupViewModel> GetLookupDetailsByMasterId(int masterLookupId, HttpCookie cookie)
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

                    var lookups = db.DetailsLookups.Where(r =>
                            r.DetailsLookupTranslations.Any(x => x.LanguageId == languageId)
                            && r.MasterId == masterLookupId && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.DetailsLookupTranslations.Where(x => x.LanguageId == languageId)).Select(x => new DetailsLookupViewModel()
                        {
                            Id = x.DetailsLookupId,
                            Name = x.Value
                        }).ToList();

                    if (!lookups.Any())
                    {
                        lookups = LanguageFallbackHelper.GetDefaultLookupDetailsByMasterId(masterLookupId);
                    }
                    return lookups;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, $"Error While Getting Lookup Details By Master lookup Id {masterLookupId}");
                    return new List<DetailsLookupViewModel>();
                }

            }
        }

        public static DetailsLookupViewModel GetLookupDetailsById(int lookupId, HttpCookie cookie)
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

                    var lookups = db.DetailsLookups.Where(r =>
                                          r.DetailsLookupTranslations.Any(x => x.LanguageId == languageId)
                                          && r.Id == lookupId && r.Status == (int)GeneralEnums.StatusEnum.Active)
                                      .SelectMany(r => r.DetailsLookupTranslations.Where(x => x.LanguageId == languageId)).Select(x => new DetailsLookupViewModel()
                                      {
                                          MasterId = x.DetailsLookup.MasterId,
                                          Id = x.DetailsLookupId,
                                          Name = x.Value
                                      }).FirstOrDefault() ?? LanguageFallbackHelper.GetDefaultLookupDetailsById(lookupId);

                    return lookups;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, $"Error While Getting Lookup Details By lookup Id {lookupId}");
                    return new DetailsLookupViewModel();
                }

            }
        }

        public static DetailsLookupViewModel GetLookupDetailsByCode(string code)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {


                    var lookups = db.DetailsLookups.Where(r => r.Code == code && r.Status == (int)GeneralEnums.StatusEnum.Active).ToList()
                                    .Select(x => new DetailsLookupViewModel()
                                    {
                                        Id = x.Id,
                                        Name = x.DetailsLookupTranslations.FirstOrDefault(g => g.IsDefault).Value,
                                    }).FirstOrDefault();

                    return lookups;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, $"Error While Getting Lookup Details By lookup code {code}");
                    return null;
                }

            }
        }

        public static List<StatusViewModel> GetStatuses(HttpCookie cookie)
        {
            int languageId = CultureHelper.GetCurrentLanguageId(cookie);

            return new List<StatusViewModel>()
                {
                    new StatusViewModel()
                    {
                        Id = (int) GeneralEnums.StatusEnum.Active,
                        Name = "Active"// Resources.Status.Active
                    },
                    new StatusViewModel()
                    {
                        Id = (int) GeneralEnums.StatusEnum.Deactive,
                        Name = "Deactive" // Resources.Status.Deactive
                    }
                };
        }

        public static List<CategoryViewModel> GetCategories(HttpCookie cookie)
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

                    var cats = db.Categories.Where(r =>
                            r.CategoryTranslations.Any(x => x.LanguageId == languageId)
                            && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.CategoryTranslations.Where(x => x.LanguageId == languageId)).Select(x => new CategoryViewModel()
                        {
                            Id = x.CategoryId,
                            Title = x.Title,
                            Description = x.Description,
                            LanguageId = x.LanguageId,
                            CreatedBy = x.Category.CreatedBy,
                            CreatedOn = x.Category.CreatedOn
                        }).ToList();

                    if (!cats.Any())
                    {
                        cats = LanguageFallbackHelper.GetDefaultCategories();
                    }
                    return cats;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting categories");
                    return new List<CategoryViewModel>();
                }

            }
        }

        public static List<LanguageViewModel> GetLanguages(HttpCookie cookie)
        {
            return new List<LanguageViewModel>()
                {
                    new LanguageViewModel()
                    {
                        Id = (int) GeneralEnums.LanguageEnum.Arabic,
                        Name = "Arabic"
                    },
                    new LanguageViewModel()
                    {
                        Id = (int) GeneralEnums.LanguageEnum.English,
                        Name = "Hebrew"
                    }
                };
        }

        public static List<RolePageViewModel> GetRolePages(HttpCookie cookie)
        {
            return new List<RolePageViewModel>()
            {
                new RolePageViewModel()
                {
                    Id = (int) GeneralEnums.PageEnum.Menu,
                    Name = GeneralEnums.PageEnum.Menu.ToString()
                },
                new RolePageViewModel()
                {
                    Id = (int) GeneralEnums.PageEnum.UserProfile,
                    Name = GeneralEnums.PageEnum.UserProfile.ToString()
                },
                  new RolePageViewModel()
                {
                    Id = (int) GeneralEnums.PageEnum.Lookup,
                    Name = GeneralEnums.PageEnum.Lookup.ToString()
                },
                   new RolePageViewModel()
                {
                    Id = (int) GeneralEnums.PageEnum.SystemSetting,
                    Name = GeneralEnums.PageEnum.SystemSetting.ToString()
                },
                   new RolePageViewModel()
                {
                    Id = (int) GeneralEnums.PageEnum.ContactUs,
                    Name = GeneralEnums.PageEnum.ContactUs.ToString()
                }
            };
        }

        public static List<RoleViewModel> GetRoles(HttpCookie cookie)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {

                    var roles = db.AspNetRoles.ToList().Select(x =>
                            new RoleViewModel()
                            {
                                RoleId = x.Id,
                                Name = x.Name,
                            });

                    return roles.ToList();
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, $"Error While Getting Roles");
                    return new List<RoleViewModel>();
                }

            }

        }


        public static List<DepartmentViewModel> GetDepartments(HttpCookie cookie)
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

                    var departments = db.Departments.Where(r =>
                            r.DepartmentTranslations.Any(x => x.LanguageId == languageId)
                            && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.DepartmentTranslations.Where(x => x.LanguageId == languageId)).Select(x => new DepartmentViewModel()
                        {
                            Id = x.DepartmentId,
                            Name = x.Name,
                            Description = x.Description,
                            LanguageId = x.LanguageId,
                            CreatedBy = x.Department.CreatedBy,
                            CreatedOn = x.Department.CreatedOn
                        }).ToList();

                    if (!departments.Any())
                    {
                        departments = LanguageFallbackHelper.GetDefaultDepartments();
                    }
                    return departments;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting departments");
                    return new List<DepartmentViewModel>();
                }

            }
        }

        public static List<ProfileViewModel> GetUserProfiles(HttpCookie cookie)
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

                    var profiles = db.UserProfiles.Where(r =>
                            r.UserProfileTranslations.Any(x => x.LanguageId == languageId)
                            && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.UserProfileTranslations.Where(x => x.LanguageId == languageId)).ToList().Select(x => new ProfileViewModel()
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
                            ManagerName = x.UserProfile?.ManagerId != null ? LanguageFallbackHelper.GetUserProfile((int)x.UserProfile.ManagerId, languageId)?.FullName : string.Empty,
                            Department = x.UserProfile.DepartmentId,
                            DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, languageId)?.Name : string.Empty,
                            PrefferdLanguage = x.UserProfile.PreferedLanguageId
                        }).ToList();

                    if (!profiles.Any())
                    {
                        profiles = LanguageFallbackHelper.GetDefaultUserProfiles();
                    }
                    return profiles;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting user profiles");
                    return new List<ProfileViewModel>();
                }

            }
        }

        public static List<ProfileViewModel> GetEmployees(HttpCookie cookie)
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

                    var companyId = SessionHelper.GetCompanyId();
                    var employees = db.AspNetUserRoles.Where(r => r.AspNetRole.Name != Constants.Roles.Citizen)
                        .Select(r => r.AspNetUser.UserName).ToList();

                    var profilesForcurrentLan = db.UserProfileTranslations
                       .Where(r => (r.LanguageId == languageId) && employees.Contains(r.UserProfile.Username) && r.UserProfile.CompanyId == companyId && 
                      r.UserProfile.Status != (int)GeneralEnums.StatusEnum.Deleted ).Select(c => c.UserProfileId);
                    var profiles = db.UserProfileTranslations
                                  .Where(r => (r.IsDefault) && employees.Contains(r.UserProfile.Username) && r.UserProfile.CompanyId==companyId&&
                                 r.UserProfile.Status != (int)GeneralEnums.StatusEnum.Deleted && !profilesForcurrentLan.Contains(r.UserProfileId))
                                 .Union(
                                    db.UserProfileTranslations
                                  .Where(r => r.LanguageId == languageId && r.UserProfile.CompanyId == companyId && employees.Contains(r.UserProfile.Username) && r.UserProfile.Status != (int)GeneralEnums.StatusEnum.Deleted && profilesForcurrentLan.Contains(r.UserProfileId)))
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
                                     ManagerName = x.UserProfile?.ManagerId != null ? LanguageFallbackHelper.GetUserProfile((int)x.UserProfile.ManagerId, languageId)?.FullName : string.Empty,
                                     Department = x.UserProfile.DepartmentId,
                                     DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, languageId)?.Name : string.Empty,
                                     PrefferdLanguage = x.UserProfile.PreferedLanguageId
                                 }).ToList();

                    if (!profiles.Any())
                    {
                        profiles = LanguageFallbackHelper.GetDefaultEmployeeProfiles();
                    }
                    return profiles;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting employee profiles");
                    return new List<ProfileViewModel>();
                }

            }
        }
        public static List<CampaignViewModel> GetCampaigns(HttpCookie cookie)
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
                    var campaigns = db.Campaigns.ToList().Select(x => new CampaignViewModel()
                    {
                        Id=x.Id,
                        Name=x.Name
                    }).ToList();
                    return campaigns;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting Campaigns");
                    return new List<CampaignViewModel>();
                }
            }
        }
        public static List<ProfileViewModel> GetCitizens(HttpCookie cookie)
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

                    var employees = db.AspNetUserRoles.Where(r => r.AspNetRole.Name == Constants.Roles.Citizen)
                        .Select(r => r.AspNetUser.UserName).ToList();

                    var profiles = db.UserProfiles.Where(r => employees.Contains(r.Username) &&
                            r.UserProfileTranslations.Any(x => x.LanguageId == languageId)
                            && r.Status == (int)GeneralEnums.StatusEnum.Active)
                        .SelectMany(r => r.UserProfileTranslations.Where(x => x.LanguageId == languageId)).ToList().Select(x => new ProfileViewModel()
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
                            ManagerName = x.UserProfile?.ManagerId != null ? LanguageFallbackHelper.GetUserProfile((int)x.UserProfile.ManagerId, languageId)?.FullName : string.Empty,
                            Department = x.UserProfile.DepartmentId,
                            DepartmentName = x.UserProfile?.DepartmentId != null ? LanguageFallbackHelper.GetDepartment((int)x.UserProfile.DepartmentId, languageId)?.Name : string.Empty,
                            PrefferdLanguage = x.UserProfile.PreferedLanguageId
                        }).ToList();

                    if (!profiles.Any())
                    {
                        profiles = LanguageFallbackHelper.GetDefaultEmployeeProfiles();
                    }
                    return profiles;
                }
                catch (Exception ex)
                {
                    LogHelper.LogException("", ex, "Error While Getting citizens profiles");
                    return new List<ProfileViewModel>();
                }

            }
        }



    }
}