
using System.Collections.Generic;

namespace CRM.Web.Controllers.APIs.Responses
{
    public class AccountPermissionResponse: BaseApiResponse
    {
        public bool HasAccess { get; set; }
        public List<string> AllowedPermissonsList { get; set; } = new List<string>();
    }
}