
using CRM.Core.Models;
using System.Collections.Generic;

namespace CRM.Web.Models
{
    public class UserRolesViewModel
    {
        public int UserId { get; set; }
        public List<RoleViewModel> Roles { get; set; }
    }
}