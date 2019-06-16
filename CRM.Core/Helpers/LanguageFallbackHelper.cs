using CRM.Core.Models;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Core.Helpers
{
    class LanguageFallbackHelper
    {
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
                    //TODO Qasem LogHelper.LogException("", ex, "Error While Getting SMS Template");
                    return new List<SMSTemplateViewModel>();
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
                    //LogHelper.LogException("", ex, "Error While Getting UserProfile by username");
                    return new ProfileViewModel();
                }

            }
        }

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
                    //TODO QASEM LogHelper.LogException("", ex, "Error While Getting User Profile");
                    return new ProfileViewModel();
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
                    //TODO QASEM LogHelper.LogException("", ex, "Error While Getting Department");
                    return new DepartmentViewModel();
                }

            }
        }

    }
}
