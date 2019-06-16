using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using CRM.Core;
using CRM.Core.Helpers;
using CRM.Core.Models;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Filters;
using CRM.Web.Helpers;
using CRM.Web.Models;
using Microsoft.Ajax.Utilities;
using PagedList;

namespace CRM.Web.Controllers
{
    public class SMSController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();

        [CustomAuthentication(PageName = "SMSTemplate", PermissionKey = "View")]
        public ActionResult Index(int? page, string searchText, int resetTo = 0)
        {
            if (resetTo == 1)
            {
                page = 1;
            }
            var statuses = LookupHelper.GetStatuses(Request.Cookies["_culture"]);
            var languages = LookupHelper.GetLanguages(Request.Cookies["_culture"]);

            ViewBag.Status = new SelectList(statuses, "Id", "Name");
            ViewBag.StatusEdit = new SelectList(statuses, "Id", "Name");

            ViewBag.DefaultTemplateLang = new SelectList(languages, "Id", "Name");
            ViewBag.DefaultTemplateLangEdit = new SelectList(languages, "Id", "Name");


            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);

            var smsTemplatesForCurrentLan = _db.SMSTemplateTranslations
                                  .Where(r => (r.LanguageId == currentLanguageId) &&
                                 r.SMSTemplate.Status != (int)GeneralEnums.StatusEnum.Deleted).Select(c => c.SMSTemplateId);

            var smsTemplates = _db.SMSTemplateTranslations
                       .Where(r => (r.IsDefault) &&
                      r.SMSTemplate.Status != (int)GeneralEnums.StatusEnum.Deleted && !smsTemplatesForCurrentLan.Contains(r.SMSTemplateId))
                      .Union(
                         _db.SMSTemplateTranslations
                       .Where(r => r.LanguageId == currentLanguageId && r.SMSTemplate.Status != (int)GeneralEnums.StatusEnum.Deleted && smsTemplatesForCurrentLan.Contains(r.SMSTemplateId)))
                      .ToList();

            if (!searchText.IsNullOrWhiteSpace())
            {
                smsTemplates = smsTemplates
                    .Where(r => (r.Name.Contains(searchText) || r.Description.Contains(searchText))).ToList();
                ViewBag.searchText = searchText;
            }

            var result = smsTemplates.ToList().Select(x =>
                new SMSTemplateViewModel()
                {
                    Id = x.SMSTemplateId,
                    Name = x.Name,
                    IsDefault = x.IsDefault,
                    LanguageId = x.LanguageId,
                    Status = x.SMSTemplate.Status,
                    Description = x.Description,
                    DefaultTemplateLanguage = x.SMSTemplate.DefaultLanguage,
                    CreatedOn = x.SMSTemplate.CreatedOn,
                    DeletedOn = x.SMSTemplate.DeletedOn,
                    CreatedBy = x.SMSTemplate.CreatedBy,
                });



            int pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "10").Value);
            var pageNumber = (page ?? 1);
            return View(result.OrderByDescending(r => r.Id).ToList().ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        [CustomAuthentication(PageName = "SMSTemplate", PermissionKey = "Create")]
        public JsonResult AddSMSTemplate(SMSTemplateViewModel smsTemplate)
        {
            try
            {
                int languageId = smsTemplate.LanguageId;

                #region Add SMS Template
                var men = new SMSTemplate()
                {
                    CreatedBy = User.Identity.Name,
                    CreatedOn = DateTime.Now,
                    DefaultLanguage = smsTemplate.DefaultTemplateLanguage > 0 ? smsTemplate.DefaultTemplateLanguage : CultureHelper.GetDefaultLanguageId(),
                    Status = smsTemplate.Status,
                };
                _db.SMSTemplates.Add(men);
                _db.SaveChanges();

                var menTrans = new SMSTemplateTranslation()
                {
                    SMSTemplateId = men.Id,
                    Description = smsTemplate.Description,
                    LanguageId = languageId,
                    IsDefault = languageId == CultureHelper.GetDefaultLanguageId(),
                    Name = smsTemplate.Name
                };

                _db.SMSTemplateTranslations.Add(menTrans);
                if (!menTrans.IsDefault)
                {
                    var menTrans1 = new SMSTemplateTranslation()
                    {
                        SMSTemplateId = men.Id,
                        Description = smsTemplate.Description,
                        LanguageId = CultureHelper.GetDefaultLanguageId(),
                        IsDefault = true,
                        Name = smsTemplate.Name

                    };
                    _db.SMSTemplateTranslations.Add(menTrans1);
                }

                _db.SaveChanges();


                #endregion


                return Json(smsTemplate, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While adding new SMS");
                return null;
            }
        }


        [HttpGet]
        [CustomAuthentication(PageName = "SMSTemplate", PermissionKey = "Edit")]
        public JsonResult EditSMSTemplate(int id, int languageId)
        {
            try
            {
                var men = _db.SMSTemplates.Find(id);
                if (men != null && men.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    var smsTemplate = LanguageFallbackHelper.GetSMSTemplate(id, languageId);
                    return Json(smsTemplate, JsonRequestBehavior.AllowGet);
                }

                return Json(null, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing SMS (Get)");
                return null;
            }
        }

        [HttpPost]
        [CustomAuthentication(PageName = "SMSTemplate", PermissionKey = "Edit")]
        public JsonResult EditSMSTemplate(SMSTemplateViewModel smsTemplate)
        {
            try
            {
                var smsTemp = _db.SMSTemplates.Find(smsTemplate.Id);
                if (smsTemp != null && smsTemp.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    smsTemp.Status = smsTemplate.Status;
                    smsTemp.DefaultLanguage = smsTemplate.DefaultTemplateLanguage > 0 ? smsTemplate.DefaultTemplateLanguage : CultureHelper.GetDefaultLanguageId();
                    _db.Entry(smsTemp).State = EntityState.Modified;
                    _db.SaveChanges();

                    var tempTrans = _db.SMSTemplateTranslations.FirstOrDefault(r => r.SMSTemplateId == smsTemp.Id && r.LanguageId == smsTemplate.LanguageId);
                    if (tempTrans != null)
                    {
                        tempTrans.Name = smsTemplate.Name;
                        tempTrans.Description = smsTemplate.Description;
                        _db.Entry(tempTrans).State = EntityState.Modified;
                    }
                    else
                    {
                        tempTrans = new SMSTemplateTranslation()
                        {
                            SMSTemplateId = smsTemp.Id,
                            Description = smsTemplate.Description,
                            LanguageId = smsTemplate.LanguageId,
                            IsDefault = false,
                            Name = smsTemplate.Name
                        };
                        _db.SMSTemplateTranslations.Add(tempTrans);
                    }

                    _db.SaveChanges();
                }


                return Json(smsTemplate, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing SMS (Post)");
                return null;
            }
        }


        [HttpPost]
        [CustomAuthentication(PageName = "SMSTemplate", PermissionKey = "Delete")]
        public JsonResult DeleteSMSTemplate(int id)
        {
            try
            {
                var smsTemplate = _db.SMSTemplates.Find(id);
                if (smsTemplate != null && smsTemplate.Status != (int)GeneralEnums.StatusEnum.Deleted)
                {
                    smsTemplate.Status = (int)GeneralEnums.StatusEnum.Deleted;
                    _db.Entry(smsTemplate).State = EntityState.Modified;
                    _db.SaveChanges();

                    var template = _db.SMSTemplateTranslations.FirstOrDefault(r => r.SMSTemplateId == id);
                    return Json(new SMSTemplateViewModel()
                    {
                        Id = template.SMSTemplateId,
                        Name = template.Name,
                        Status = template.SMSTemplate.Status,
                        Description = template.Description,
                        DefaultTemplateLanguage = template.SMSTemplate.DefaultLanguage,
                        CreatedOn = template.SMSTemplate.CreatedOn,
                        DeletedOn = template.SMSTemplate.DeletedOn,
                        LanguageId = template.LanguageId,
                        CreatedBy = template.SMSTemplate.CreatedBy
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(null, JsonRequestBehavior.AllowGet);
            }

            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While deleting SMS");
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