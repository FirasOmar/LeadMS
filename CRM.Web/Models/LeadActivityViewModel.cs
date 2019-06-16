using CRM.Web.App_GlobalResources.General;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using static CRM.Core.SystemEnums.GeneralEnums;

namespace CRM.Web.Models
{
    public class LeadActivityViewModel
    {
        public long Id { get; set; }
        [Display(ResourceType = typeof(Home), Name = "ActivityType")]
        public LeadActivityTypeEnum Activity_Type { get; set; }
        [Display(ResourceType = typeof(Home), Name = "ActivityStatus")]
        public LeadActivityStatusEnum Activity_Status { get; set; }
        [Display(ResourceType = typeof(Home), Name = "ActivityDate")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> Activity_Date { get; set; }
        [Display(ResourceType = typeof(Home), Name = "Notes")]
        public string Notes { get; set; }
        public Nullable<int> Lead_ID { get; set; }
    }
}