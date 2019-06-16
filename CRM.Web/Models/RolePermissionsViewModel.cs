using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using CRM.Web.App_GlobalResources.RolePermissions;

namespace CRM.Web.Models
{
    public class RolePermissionsViewModel
    {
        public int Id { get; set; }
        [Display(ResourceType = typeof(RolePermissions), Name = "TxtRoleName")]
        public string RoleName { get; set; }
        [Display(ResourceType = typeof(RolePermissions), Name = "TxtRoleFriendlyName")]
        public string RoleFriendlyName { get; set; }
        [Display(ResourceType = typeof(RolePermissions), Name = "TxtRoleDescription")]
        public string RoleDescription { get; set; }
        public string Permissions { get; set; }        
        public List<PermissionGroups> PermissionGroups { get; set; }
    }
    public class PermissionGroups
    {
        public string PageName { get; set; }
        public Dictionary<int,PermissionViewModel> PermissionsKey { get; set; }
    }
}