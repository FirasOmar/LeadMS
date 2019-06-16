
using System.Collections.Generic;
using Crm.Sms.Requests;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Crm.Sms.Test
{
    [TestClass]
    public class SmsServiceTest
    {
        [TestMethod]
        public void ExecuteTest()
        {
            var smsServiceRequest = new SendSmsRequest
            {
                Url = "https://019sms.co.il/api",
                Username = "sectorspr",
                Password = "faraj123",
                Destinations = new List<string>()
                {
                    "0569216241"
                },
                Message = "Test Message from unit test",
                Source = "123"
            };
            var smsService = new SmsService();
            var result = smsService.Execute(smsServiceRequest);
        }
    }
}
