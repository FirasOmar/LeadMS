using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using CRM.Web.App_GlobalResources.General;
using CRM.Web.App_GlobalResources.Campaign;
using Resources;
using static CRM.Core.SystemEnums.GeneralEnums;

namespace CRM.Web.Models
{
    public class LeadViewModel
    {
        public int Id { get; set; }
        [Display(ResourceType = typeof(Home), Name = "Name")]
        public string Name { get; set; }
        [Display(ResourceType = typeof(Home), Name = "Address")]
        public string Address { get; set; }
        [Display(ResourceType = typeof(Home), Name = "Email")]
        public string Email { get; set; }
        [Display(ResourceType = typeof(Home), Name = "Mobile")]
        public string Phone_Number { get; set; }
        [Display(ResourceType = typeof(Home), Name = "Status")]
        public LeadStatusEnum Status { get; set; }
        [Display(ResourceType = typeof(Home), Name = "CreatedDate")]
        public Nullable<System.DateTime> Created_Date { get; set; }
        [Display(ResourceType = typeof(Home), Name = "Notes")]
        public string Notes { get; set; }
        [Display(ResourceType = typeof(Home), Name = "AssigneeUser")]
        public Nullable<int> AssigneeId { get; set; }
        public string AssigneeName { get; set; }
        [Display(ResourceType = typeof(Campaign), Name = "Name")]
        public Nullable<int> CampaignId { get; set; }
        public string CampaignName { get; set; }
    }
}