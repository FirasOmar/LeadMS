
using System.Collections.Generic;

namespace Crm.Sms.Requests
{
    public class SendSmsRequest
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Url { get; set; }
        public string Source { get; set; }
        public List<string> Destinations { get; set; }
        public string Message { get; set; }
    }
}
