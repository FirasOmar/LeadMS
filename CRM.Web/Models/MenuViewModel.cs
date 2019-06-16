
using System;
using System.ComponentModel.DataAnnotations;
using CRM.Web.App_GlobalResources.Menu;
using CRM.Web.App_GlobalResources.General;

namespace CRM.Web.Models
{
    public class MenuViewModel
    {
        public int Id { get; set; }
        public string Icon { get; set; }
        [Required(ErrorMessageResourceType = typeof(Messages), ErrorMessageResourceName = "Required")]
        [Display(ResourceType = typeof(Menu), Name = "TxtTitle")]
        public string Title { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtDescription")]
        public string Description { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtParentId")]
        public int? ParentId { get; set; }
        public int LanguageId { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtParentId")]
        public string ParentName { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtPageId")]
        public int? PageId { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtPageId")]
        public string PageName { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtPageUrl")]
        public string PageUrl { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtSortOrder")]
        public int SortOrder { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtCreatedOn")]
        public DateTime CreatedOn { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtCreatedBy")]
        public string CreatedBy { get; set; }
        [Display(ResourceType = typeof(Menu), Name = "TxtStatus")]
        public int Status { get; set; }
        public DateTime? DeletedOn { get; set; }
    }
}