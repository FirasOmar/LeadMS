using System;
using System.ComponentModel.DataAnnotations;
using CRM.Web.App_GlobalResources.Permission;
using CRM.Web.App_GlobalResources.SystemCases;

namespace CRM.Web.Models
{
    public class PermissionViewModel
    {
        public int Id { get; set; }
        public string PageUrl { get; set; }
        [Display(ResourceType = typeof(Permission), Name = "TxtPageName")]
        public string PageName { get; set; }
        [Display(ResourceType = typeof(Permission), Name = "TxtPermissionKey")]
        public string PermissionKey { get; set; }
        [Display(ResourceType = typeof(Permission), Name = "TxtDescription")]
        public string Description { get; set; }
        [Display(ResourceType = typeof(Permission), Name = "TxtCreatedOn")]
        public DateTime CreatedOn { get; set; }
        [Display(ResourceType = typeof(Permission), Name = "TxtCreatedBy")]
        public string CreatedBy { get; set; }
        [Display(ResourceType = typeof(Permission), Name = "TxtCreatedBy")]
        public int Status { get; set; }
        public DateTime? DeletedOn { get; set; }
        public bool IsSelected { get; set; }
    }
}