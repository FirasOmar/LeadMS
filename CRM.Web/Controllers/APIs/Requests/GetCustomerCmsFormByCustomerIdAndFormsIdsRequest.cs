
namespace CRM.Web.Controllers.APIs.Requests
{
    public class GetCustomerCmsFormByCustomerIdAndFormsIdsRequest
    {
        public string CustomerId { get; set; }
        public string CustomerCmsFormIdList { get; set; }
    }
}