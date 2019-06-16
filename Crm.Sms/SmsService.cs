using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using Crm.Sms.Requests;

namespace Crm.Sms
{
    public class SmsService
    {
        public bool Execute(SendSmsRequest request)
        {
            try
            {
                if (!request.Destinations.Any())
                {
                    return false;
                }
                string url = request.Url;
                var phones = string.Empty;
                foreach (var phone in request.Destinations)
                {
                    phones += $"<phone>{phone}</phone>";
                }
                string xml = $@"<?xml version='1.0' encoding='UTF-8'?>
                                <sms>
                                <user>
                                <username>{request.Username}</username>
                                <password>{request.Password}</password>
                                </user>
                                <source>{request.Source}</source>
                                <destinations>
                                {phones}
                                </destinations>
                                <message>{request.Message}</message>
                                </sms>";
                WebRequest webRequest = WebRequest.Create(url);
                webRequest.Method = "POST";
                byte[] bytes = Encoding.UTF8.GetBytes(xml);
                webRequest.ContentType = "application/xml";
                webRequest.ContentLength = (long)bytes.Length;
                var requestStream = webRequest.GetRequestStream();
                requestStream.Write(bytes, 0, bytes.Length);
                requestStream.Close();
                var response = webRequest.GetResponse();
                var responseStream = response.GetResponseStream();
                if (responseStream != null)
                {
                    var streamReader = new StreamReader(responseStream);
                    string result = streamReader.ReadToEnd();
                    streamReader.Close();
                    responseStream.Close();
                    response.Close();
                    //TODO: format result
                }
                else
                {
                    return false;
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
