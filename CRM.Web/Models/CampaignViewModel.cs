using CRM.Web.App_GlobalResources.Campaign;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CRM.Web.Models
{
    public class CampaignViewModel
    {
        public int Id { get; set; }
        [Display(ResourceType = typeof(Campaign), Name = "Name")]
        public string Name { get; set; }
        [Display(ResourceType = typeof(Campaign), Name = "StartDate")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> StartDate { get; set; }
        [Display(ResourceType = typeof(Campaign), Name = "EndDate")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> EndDate { get; set; }
    }
}