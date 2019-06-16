using System;
using System.Linq;
using System.Security.Principal;
using CRM.Core.Models;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using Crm.Sms.Requests;
using System.Collections.Generic;

namespace CRM.Core.Helpers
{
    public class SettingHelper
    {
        public static SettingViewModel GetOrCreate(string name, string defaultValue, int languageId = (int)GeneralEnums.LanguageEnum.Arabic)
        {
            using (var db = new CrmSystemEntities())
            {
                var setting = db.SystemSettings.FirstOrDefault(r =>
                                  r.SystemSettingTranslations.Any(x => x.Name == name && x.LanguageId == languageId) &&
                                  r.Status == (int)GeneralEnums.StatusEnum.Active) ?? db.SystemSettings.FirstOrDefault(r =>
                                 r.SystemSettingTranslations.Any(x => x.Name == name && x.IsDefault) &&
                                 r.Status == (int)GeneralEnums.StatusEnum.Active);

                if (setting == null)
                {
                    setting = new SystemSetting
                    {
                        Status = (int)GeneralEnums.StatusEnum.Active,
                        CreatedBy = "System",
                        CreatedOn = DateTime.Now
                    };
                    db.SystemSettings.Add(setting);
                    db.SaveChanges();

                    var settingTrans = new SystemSettingTranslation()
                    {
                        LanguageId = languageId,
                        IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                        Name = name,
                        Value = defaultValue,
                        SettingId = setting.Id
                    };
                    db.SystemSettingTranslations.Add(settingTrans);
                    if (!settingTrans.IsDefault)
                    {
                        var settingTrans1 = new SystemSettingTranslation()
                        {
                            LanguageId = CultureHelper.GetDefaultLanguageId(),
                            IsDefault = true,
                            Name = name,
                            Value = defaultValue,
                            SettingId = setting.Id
                        };
                        db.SystemSettingTranslations.Add(settingTrans1);
                    }
                    db.SaveChanges();

                    var sysSetting = new SettingViewModel()
                    {
                        Id = setting.Id,
                        Name = settingTrans.Name,
                        Value = settingTrans.Value
                    };

                    return sysSetting;
                }
                else
                {
                    return new SettingViewModel()
                    {
                        Id = setting.Id,
                        Name = setting.SystemSettingTranslations.FirstOrDefault()?.Name,
                        Value = setting.SystemSettingTranslations.FirstOrDefault()?.Value
                    };
                }
            }
        }        

        public static string GetUserName(IPrincipal user, int langId)
        {
            using (var db = new CrmSystemEntities())
            {
                var userProf = db.UserProfiles.FirstOrDefault(r => r.Username == user.Identity.Name);
                if (userProf != null && userProf.UserProfileTranslations.Any())
                {
                    var trans = userProf.UserProfileTranslations.FirstOrDefault(r => r.LanguageId == langId);
                    if (trans != null)
                    {
                        return trans.FullName;
                    }
                    else
                    {
                        trans = userProf.UserProfileTranslations.FirstOrDefault();
                        if (trans != null)
                        {
                            return trans.FullName;
                        }
                    }
                }

                return user.Identity.Name;
            }
        }

    }
}