using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CRM.Core.Helpers;
using CRM.DataEntity.Models;
using CRM.Web.Helpers;
using CRM.Web.Models;

namespace CRM.Web.Controllers
{
    public class CampaignsController : BaseController
    {
        private CrmSystemEntities _db = new CrmSystemEntities();

        // GET: Campaigns
        public ActionResult Index()
        {
            var currentLanguageId = CultureHelper.GetCurrentLanguageId(Request.Cookies["_culture"]);
            var CampaignList = _db.Campaigns.ToList();
            var CampaginVM = CampaignList.Select(r => new CampaignViewModel()
            {
                Id=r.Id,
                Name =r.Name,
                StartDate=r.StartDate,
                EndDate=r.EndDate               
            });          
            return View(CampaginVM);
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
        public ActionResult Create()
        {
            return PartialView("_Create");
        }
        [HttpPost]
        public void Create(CampaignViewModel c)
        {
            var campData = new Campaign()
            {
                Name = c.Name,
                StartDate=c.StartDate,
                EndDate=c.EndDate
      

            };
            if (ModelState.IsValid)
            {
                _db.Campaigns.Add(campData);
                _db.SaveChanges();
                Response.Redirect(Request.Url.ToString(), false);
            }
            Response.Redirect(Request.Url.ToString(), false);

        }
        // GET: Campaigns/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campaign campaign = _db.Campaigns.Find(id);
            var campaignVM = new CampaignViewModel()
            {
                Id = campaign.Id,
                Name = campaign.Name,
                StartDate = campaign.StartDate,
                EndDate = campaign.EndDate
            };
            if (campaignVM == null)
            {
                return HttpNotFound();
            }
            return View(campaignVM);
        }

       

        

       

        // POST: Campaigns/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]       
        public ActionResult Edit(CampaignViewModel campaign)
        {
            try
            {
                var campData = _db.Campaigns.Find(campaign.Id);
                if(campData != null)
                {
                    campData.Id = campaign.Id;
                    campData.Name = campaign.Name;
                    campData.StartDate = campaign.StartDate;
                    campData.EndDate = campaign.EndDate;
                    _db.SaveChanges();
                }
                return RedirectToAction("Details", new { id = campaign.Id });
            }
            catch(Exception ex)
            {
                LogHelper.LogException(User.Identity.Name, ex, "Error While editing Campaign (Post)");
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
