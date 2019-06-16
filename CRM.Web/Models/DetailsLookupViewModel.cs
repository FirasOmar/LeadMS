using CRM.Web.App_GlobalResources.Lookup;
using System;
using System.ComponentModel.DataAnnotations;

namespace CRM.Web.Models
{
    public class DetailsLookupViewModel
    {
        public int Id { get; set; }

        [Display(ResourceType =typeof(DetailsLookup),Name = "TxtName")]
        public string Name { get; set; }

        [Display(ResourceType = typeof(DetailsLookup), Name = "TxtMaster")]
        public int MasterId { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        [Display(ResourceType = typeof(DetailsLookup), Name = "TxtStatus")]
        public int Status { get; set; }
        public DateTime? DeletedOn { get; set; }
        [Display(ResourceType = typeof(DetailsLookup), Name = "TxtLanguage")]
        public int LanguageId { get; set; }

        public bool IsDefault { get; set; }
    }
}