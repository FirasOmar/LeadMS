using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CRM.Core.Helpers;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using CRM.Web.Filters;
using CRM.Web.Helpers;
using CRM.Web.Models;
using Microsoft.Ajax.Utilities;
using System.Data.Entity;
using System.Globalization;
using System.Collections.Generic;
using CRM.Web.Controllers.APIs.Responses;
using System.IO;
using System.Text;
using CsvHelper;
using CRM.Core;
using RestSharp;
using RestSharp.Authenticators;
using System.Net;
using Newtonsoft.Json;
using System.Text.RegularExpressions;
using CRM.Core.Models;
using System.Web.UI;
using PagedList;
using Crm.Sms;
using static CRM.Core.SystemEnums.GeneralEnums;
using Crm.Sms.Requests;

namespace CRM.Web.Controllers
{
    public class HomeController : BaseController
    {
        private readonly CrmSystemEntities _db = new CrmSystemEntities();
        [CustomAuthentication(PageName = "Home", PermissionKey = "View")]
        public ActionResult Index(int? campaignNo)
        {
            var companyId = SessionHelper.GetCompanyId();
            var  CampaignList = _db.Campaigns.Where(r => r.CompanyId == companyId).Select(r=>r.Id).ToList();
            int NewLeads;
            int QualifiedLeads;
            int WonLeads;
            int LostLeads;
            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
            var LeadList = _db.Leads.Where(r=> CampaignList.Contains(r.CampaignId.Value)).ToList();
            if (campaignNo != null)
            {
                 LeadList = _db.Leads.Where(x => x.CampaignId == campaignNo).ToList();
            }           
            var LeadList_result = LeadList.Select(r =>
             new LeadViewModel
             {
                 Id = r.Id,
                 Status = (LeadStatusEnum)r.Status,
                 Email = r.Email,
                 Name = r.Name,
                 Address=r.Address,
                 Phone_Number = r.Phone_Number,
                 Notes=r.Notes,
                 Created_Date=r.Created_Date,
                 AssigneeId = r.AssigneeId,
                 AssigneeName = LanguageFallbackHelper.GetUserProfile((r.UserProfile?.Id ?? 0), currentLanguageId)?.FullName,
                 CampaignId = r.CampaignId,
                 CampaignName=LanguageFallbackHelper.GetCampaigns(r.Campaign.Id,currentLanguageId).Name
             }
             
           ).ToList();
            if (campaignNo != null)
            {
                 NewLeads = LeadList_result.Count(r => r.Status == LeadStatusEnum.New && r.CampaignId == campaignNo);
                 QualifiedLeads = LeadList_result.Count(r => r.Status == LeadStatusEnum.Qualified && r.CampaignId == campaignNo);
                WonLeads = LeadList_result.Count(r => r.Status == LeadStatusEnum.Won && r.CampaignId == campaignNo);
                LostLeads = LeadList_result.Count(r => r.Status == LeadStatusEnum.Lost && r.CampaignId == campaignNo);
            }
            else
            {
                NewLeads = LeadList_result.Count(r => r.Status == LeadStatusEnum.New);
                QualifiedLeads = LeadList_result.Count(r => r.Status == LeadStatusEnum.Qualified);
                WonLeads = LeadList_result.Count(r => r.Status == LeadStatusEnum.Won);
                LostLeads = LeadList_result.Count(r => r.Status == LeadStatusEnum.Lost);
            }
            
            ViewData["NewLeads"] = NewLeads;
            ViewData["QualifiedLeads"] = QualifiedLeads;
            ViewData["WonLeads"] = WonLeads;
            ViewData["LostLeads"] = LostLeads;
            var list = new List<SelectListItem>
                 {
                new SelectListItem{ Text=App_GlobalResources.General.Home.Name, Value = "Name", Selected = true},
                new SelectListItem{ Text=App_GlobalResources.General.Home.Email, Value = "Email" },
                new SelectListItem{ Text=App_GlobalResources.General.Home.Mobile, Value = "Mobile"}
                  };

            ViewData["SearchFieldsList"] = list;
            
                        var pageSize = int.Parse(SettingHelper.GetOrCreate(Constants.SystemSettings.ControlPanelPageSize, "20").Value);

            return View(LeadList_result);
          //  return View(LeadList_result.OrderByDescending(r => r.Id).ToList().ToPagedList(1,pageSize));
        }
        

        public ActionResult SearchLeads(string fieldType, string searchText)
        {
            ViewBag.SearchText = searchText;
            ViewBag.FieldType = fieldType;
            var LeadList = _db.Leads.ToList();
            if (fieldType != null)
            {
                switch (fieldType)
                {
                    case "Name":
                        LeadList = _db.Leads.Where(r => r.Name.Contains(searchText)).ToList();
                        break;
                    case "Email":
                        LeadList = _db.Leads.Where(r => r.Email.Contains(searchText)).ToList();
                        break;
                    case "Mobile":
                        LeadList = _db.Leads.Where(r => r.Phone_Number.Contains(searchText)).ToList();
                        break;
                }
            }
            var LeadList_result = LeadList.Select(r =>
             new LeadViewModel
             {
                 Id = r.Id,
                 Status = (LeadStatusEnum)r.Status,
                 Email = r.Email,
                 Name = r.Name,
                 Phone_Number = r.Phone_Number,
                 Notes = r.Notes,
                 Created_Date = r.Created_Date
             }
           );
            return View(LeadList_result);
        }
        public ActionResult SetCulture(string culture, string currentUrl)
        {
            // Validate input
            culture = CultureHelper.GetImplementedCulture(culture);
            // Save culture in a cookie
            System.Web.HttpCookie cookie = Request.Cookies["_culture"];
            if (cookie != null)
                cookie.Value = culture;   // update cookie value
            else
            {
                cookie = new System.Web.HttpCookie("_culture")
                {
                    Value = culture,
                    Expires = DateTime.Now.AddYears(1)
                };
            }
            Response.Cookies.Add(cookie);
            if (!string.IsNullOrWhiteSpace(currentUrl))
            {
                return Redirect(currentUrl);
            }
            return RedirectToAction("Index");
        }
        // GET: Home/LeadInfo/5
        public ActionResult LeadInfo(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var formData = _db.Leads.Where(t => t.Id == id).FirstOrDefault();

            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);


            ViewBag.message= TempData["message"];
            ViewBag.SMSmessage = TempData["SMSmessage"];
            var leadVm = new LeadViewModel()
            {
                Name = formData.Name,
                Email = formData.Email,
                Address = formData.Address,
                Status = (LeadStatusEnum)formData.Status,
                Phone_Number = formData.Phone_Number,
                Notes = formData.Notes,
                Created_Date = formData.Created_Date,
                AssigneeId=formData.AssigneeId,
                AssigneeName = LanguageFallbackHelper.GetUserProfile((formData.UserProfile?.Id??0), currentLanguageId)?.FullName,
                CampaignId = formData.CampaignId,
                CampaignName = LanguageFallbackHelper.GetCampaigns(formData.Campaign.Id, currentLanguageId).Name
            };
            ViewBag.Lead_ID = id;
            return View(leadVm);
        }

        // POST: Home/LeadInfo/5
        [HttpPost]
        public ActionResult LeadInfo(LeadViewModel lead)
        {
            try
            {
                // TODO: Add update logic here
                var leadData = _db.Leads.Find(lead.Id);
                if (leadData != null)
                {
                    leadData.Name = lead.Name;
                    leadData.Phone_Number = lead.Phone_Number;
                    leadData.Email = lead.Email;
                    leadData.Address = lead.Address;
                    leadData.Notes = lead.Notes;
                    leadData.Status = (int)lead.Status;
                    leadData.AssigneeId = lead.AssigneeId;
                    leadData.CampaignId = lead.CampaignId;
                    _db.SaveChanges();
                    TempData["message"] = "The lead has been Updated";
                }
                return RedirectToAction("LeadInfo", new {id= lead.Id});
            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Lead (Post)");
                return null;
            }
        }
        public ActionResult ViewLeadActivity(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var LeadActivityData = _db.Lead_Activity.Where(t => t.Id == id).FirstOrDefault();
            ViewBag.Lead_ID_ForEdit = LeadActivityData.Lead_ID;
           // var dd =(string) LeadActivityData.Activity_Date.ToString("MM/dd/yyyy");
            var LeadActivityViewModel =  new LeadActivityViewModel()
            {   Id= LeadActivityData.Id,
                Lead_ID = LeadActivityData.Lead_ID,
                Activity_Type = (LeadActivityTypeEnum)LeadActivityData.Activity_Type,
                Activity_Date = LeadActivityData.Activity_Date,
             
                Activity_Status = (LeadActivityStatusEnum)LeadActivityData.Activity_Status,
                Notes = LeadActivityData.Notes
            };

            return View(LeadActivityViewModel);
            // return PartialView("_LeadActivities");
        }
        public ActionResult LeadActivities(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var LeadActivityData = _db.Lead_Activity.Where(t => t.Lead_ID == id).ToList();
            var LeadActivityViewModel = LeadActivityData.Select(r => new LeadActivityViewModel()
            {  Id=r.Id,
                Lead_ID = r.Lead_ID,
                Activity_Type = (LeadActivityTypeEnum)r.Activity_Type,
                Activity_Date = r.Activity_Date,
                Activity_Status = (LeadActivityStatusEnum)r.Activity_Status,
                Notes = r.Notes
            });
      
            return View(LeadActivityViewModel);
            // return PartialView("_LeadActivities");
        }
        public ActionResult CreateLeadActivity()
        {
            return PartialView("_CreateLeadActivity");
        }
        [HttpPost]
        public ActionResult CreateLeadActivity(LeadActivityViewModel leadActivity)
        {
            var leadActivityData = new Lead_Activity()
            {  
                Lead_ID = leadActivity.Lead_ID,
                Activity_Type = (int)leadActivity.Activity_Type,
                Activity_Date = leadActivity.Activity_Date,
                Activity_Status =(int) leadActivity.Activity_Status,
                Notes = leadActivity.Notes
            };
            if (ModelState.IsValid)
            {
                _db.Lead_Activity.Add(leadActivityData);
                _db.SaveChanges();
                return RedirectToAction("LeadInfo", new { id = leadActivity.Lead_ID });
            }
            return RedirectToAction("LeadInfo", new { id = leadActivity.Lead_ID });

        }
        [HttpPost]
        public ActionResult DeleteLeadActivity(int? id)
        {
            var leadData = _db.Lead_Activity.Find(id);
            var lead_Id = leadData.Lead_ID;
            if (ModelState.IsValid)
            {
                _db.Lead_Activity.Remove(leadData);
                _db.SaveChanges();
            }
                return RedirectToAction("LeadInfo", new { id = lead_Id });
        }
        public ActionResult Create()
        {
            return PartialView("_Create");
        }
        [HttpPost]
        public  void Create(LeadViewModel lead)
        {
            var leadData = new Lead()
            {
                Name = lead.Name,
                Email = lead.Email,
                Address = lead.Address,
                Status = (int)lead.Status,
                Phone_Number = lead.Phone_Number,
                Notes = lead.Notes,
                Created_Date = DateTime.Now,
                AssigneeId=lead.AssigneeId,
                CampaignId=lead.CampaignId               
        };
            if (ModelState.IsValid)
            {
                _db.Leads.Add(leadData);
                _db.SaveChanges();
                Response.Redirect(Request.Url.ToString(), false);
            }
            Response.Redirect(Request.Url.ToString(), false);

        }
        [HttpPost]
        public ActionResult UpdateLeadActivity(LeadActivityViewModel leadAct)
        {
            try
            {
                var l = _db.Lead_Activity.Find(leadAct.Id);
                var Lead_Id = l.Lead_ID;
                if (ModelState.IsValid)
                {
                    if (l != null)
                    {
                        l.Activity_Date = leadAct.Activity_Date;
                        l.Activity_Status = (int)leadAct.Activity_Status;
                        l.Activity_Type = (int)leadAct.Activity_Type;
                        l.Notes = leadAct.Notes;
                        _db.SaveChanges();
                    }
                }
                return RedirectToAction("LeadInfo", new { id = Lead_Id });

            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Lead (Post)");
                return null;
            }
        }
        [HttpPost]
        public JsonResult UpdateLead(LeadViewModel lead)
        {
            try
            {
                var l = _db.Leads.Find(lead.Id);
                if (ModelState.IsValid)
                {
                    if (l != null)
                    {
                        l.Status = (int)lead.Status;
                        _db.SaveChanges();
                    }               
                }
                return Json(lead, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Lead (Post)");
                return null;
            }
        }
        [HttpPost]
        public JsonResult SendSMS(string text, string mobile)
        {
            try
            {
                var smsServiceRequest = new SendSmsRequest()
                {
                    Url = SettingHelper.GetOrCreate(Constants.SystemSettings.SMSApiUrl, "https://019sms.co.il/api").Value,
                    Username = SettingHelper.GetOrCreate(Constants.SystemSettings.SMSUsername, "sectorspr").Value,
                    Password = SettingHelper.GetOrCreate(Constants.SystemSettings.SMSPassword, "faraj123").Value,
                    Destinations = new List<string>(),
                    Message = string.Empty,
                    Source = SettingHelper.GetOrCreate(Constants.SystemSettings.SMSSource, "123").Value
                };

                var smsService = new Crm.Sms.SmsService();
                smsServiceRequest.Destinations = new List<string> { mobile};
                smsServiceRequest.Message = text;
                smsService.Execute(smsServiceRequest);
                TempData["SMSmessage"] = "SMS Sent Succesfully";
                return Json(smsServiceRequest, JsonRequestBehavior.AllowGet);
            }
            catch(Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While Sending SMS to Lead (Post)");
                return null;
            }
        }
    }
}