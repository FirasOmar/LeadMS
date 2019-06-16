
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using CRM.Core.SystemEnums;
using System.Security.Principal;

using System.Linq;
using Crm.Sms.Requests;

using CRM.DataEntity.Models;
using System;
using CRM.Core.Models;

namespace CRM.Core.Helpers
{
    public class EmailHelper
    {
        public string FromAddress { get; private set; }
        public string StrToAddress { get; private set; }
        private string _strSmtpClient;
        private string _password;
        public string ReplyTo { get; private set; }
        private string _smtpPort;
        private bool _bEnableSsl;

        private void InitMail()
        {
            FromAddress = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsSourceEmail, "smsmcrmtest@outlook.com").Value;
            StrToAddress = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsErrorEmail, "smsmcrmtest@outlook.com").Value;
            _strSmtpClient = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsSmtpClient, "smtp.gmail.com").Value;
            _password = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsResetPassword, "Crm@123$").Value;
            ReplyTo = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsReplyTo, "smsmcrmtest@outlook.com").Value;
            _smtpPort = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsSmtpPort, "587").Value;
            _bEnableSsl = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsEnableSsl, "true").Value.ToLower() == "true";
        }

        public void SendMail(string messageId, List<string> toAddress, string subject, string message, string attachmentName = "")
        {

            InitMail();

            dynamic mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(messageId);
            foreach (var email in toAddress)
            {
                mailMessage.To.Add(email);
            }

            mailMessage.Subject = subject;
            mailMessage.IsBodyHtml = true;

            //TODO Qasem
            //if (attachmentName.IsNullOrEmpty())
            //{
            //    mailMessage.Attachments.Add(new Attachment(attachmentName));
            //}

            mailMessage.Body = message;

            mailMessage.ReplyTo = new MailAddress(messageId);

            SendSmtpEmail(messageId, mailMessage);
        }

        public void SendMail(string messageId, string toAddress, string subject, string message, long groupId, string accountId)
        {

            InitMail();

            dynamic mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(messageId);
            mailMessage.To.Add(toAddress);
            mailMessage.Subject = subject;
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = message;
            mailMessage.Headers.Add("X-GroupId", groupId.ToString());
            mailMessage.Headers.Add("X-AccountId", accountId);


            mailMessage.ReplyTo = new MailAddress(messageId);

            SendSmtpEmail(messageId, mailMessage);
        }

        private void SendSmtpEmail(string messageId, dynamic mailMessage)
        {
            var smtpClient = new SmtpClient();
            try
            {
                smtpClient.Port = Convert.ToInt32(_smtpPort);
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential(messageId, _password);
                smtpClient.Host = _strSmtpClient;
                smtpClient.EnableSsl = _bEnableSsl;
                ServicePointManager.ServerCertificateValidationCallback =
                    delegate (object s, X509Certificate certificate,
                        X509Chain chain, SslPolicyErrors sslPolicyErrors)
                    {
                        return true;
                    };
                ServicePointManager.ServerCertificateValidationCallback =
                    (s, certificate, chain, sslPolicyErrors) => true;
                smtpClient.Send(mailMessage);
            }
            catch (SmtpFailedRecipientsException ex)
            {
                for (int i = 0; i <= ex.InnerExceptions.Length; i++)
                {
                    SmtpStatusCode status = ex.InnerExceptions[i].StatusCode;
                    if ((status == SmtpStatusCode.MailboxBusy) | (status == SmtpStatusCode.MailboxUnavailable))
                    {
                        System.Threading.Thread.Sleep(5000);
                        smtpClient.Send(mailMessage);
                    }
                }
            }
        }

        public void SendEmail(dynamic dataEmail)
        {
            var fromAddress =
                SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsResetPassword, "smsmcrmtest@outlook.com").Value;
            int typeEmail = dataEmail.emailType;
            if (dataEmail.emailType != null)
            {
                string subject;
                string useremail;
                string mailText;
                string filePath;
                switch (typeEmail)
                {
                    case (int)GeneralEnums.EmailEnum.ForgetPassword:

                        filePath = HttpContext.Current.Server.MapPath(dataEmail.PathTemplate);
                        var strforgetPasswordTemplate = new StreamReader(filePath);
                        mailText = strforgetPasswordTemplate.ReadToEnd();
                        strforgetPasswordTemplate.Close();
                        useremail = dataEmail.ToEmail;
                        subject = dataEmail.SubjectEmail;
                        mailText = mailText.Replace("[preheaderemail]", dataEmail.PreHeadeEmail.Trim());
                        mailText = mailText.Replace("[username]", useremail.Trim());
                        mailText = mailText.Replace("[callbackUrl]", dataEmail.callbackUrl.Trim());
                        mailText = mailText.Replace("[textmessage]", dataEmail.TextMessage.Trim());
                        mailText = mailText.Replace("[Year]", DateTime.Today.Year.ToString());
                        SendMail(fromAddress, new List<string>() { useremail }, subject, mailText);
                        break;
                }
            }

        }

        public void SendFormTemaplteEmail(string useremail, string subject, string mailText)
        {
            var fromAddress = SettingHelper.GetOrCreate(Constants.SystemSettings.EmailsSourceEmail, "smsmcrmtest@outlook.com").Value;


            SendMail(fromAddress, new List<string>() { useremail }, subject, mailText);


        }

        public void SendResetPasswordEmail(string callbackUrl, string useremail)
        {
            string subject = Constants.EmailTemplate.SubjectResetPassword;

            string fromAddress = FromAddress;
            string filePath = HttpContext.Current.Server.MapPath(Constants.EmailTemplate.PathForgetPasswordTemplate);

            var str = new StreamReader(filePath);

            string mailText = str.ReadToEnd();
            str.Close();

            mailText = mailText.Replace("[preheaderemail]", Constants.EmailTemplate.PreHeaderForgetEmail);
            mailText = mailText.Replace("[username]", useremail.Trim());

            mailText = mailText.Replace("[callbackUrl]", callbackUrl.Trim());
            mailText = mailText.Replace("[textmessage]", Constants.EmailTemplate.TextMessageResetPassword);
            SendMail(fromAddress, new List<string>() { useremail }, subject, mailText);
        }
        public void SendErrorEmail(HttpException exception)
        {
            InitMail();
            string subject = Constants.EmailTemplate.SubjectSystemError;

            string filePath = HttpContext.Current.Server.MapPath(Constants.EmailTemplate.PathSystemErrorTemplate);

            var str = new StreamReader(filePath);

            string mailText = str.ReadToEnd();
            str.Close();

            mailText = mailText.Replace("[preheaderemail]", Constants.EmailTemplate.PreHeaderSystemErrorEmail);
            mailText = mailText.Replace("[username]", "Admin");

            mailText = mailText.Replace("[textmessage]", exception?.Message);
            mailText = mailText.Replace("[StackTrace]", exception?.StackTrace);
            mailText = mailText.Replace("[InnerException]", exception?.InnerException?.StackTrace);
            SendMail(FromAddress, new List<string>() { StrToAddress }, subject, mailText);
        }

        public void SendCaseEmail(string message, string title, string email, string username, List<string> emailsList)
        {
            InitMail();
            string subject = $"{Constants.EmailTemplate.SubjectSystemCase} - {title}";

            string filePath = HttpContext.Current.Server.MapPath(Constants.EmailTemplate.PathSystemCaseTemplate);

            var str = new StreamReader(filePath);

            string mailText = str.ReadToEnd();
            str.Close();

            mailText = mailText.Replace("[preheaderemail]", Constants.EmailTemplate.PreHeaderSystemErrorEmail);
            mailText = mailText.Replace("[username]", username ?? email);

            mailText = mailText.Replace("[textmessage]", message);
            SendMail(FromAddress, emailsList, subject, mailText);
        }

        public void SendCaseNotificationEmail(string message, string title, List<string> emailsList)
        {
            InitMail();
            string subject = $"{Constants.EmailTemplate.SubjectSystemCase} - {title}";

            string filePath = AppDomain.CurrentDomain.BaseDirectory + Constants.EmailTemplate.PathSystemCaseNotificationTemplate;

            var str = new StreamReader(filePath);

            string mailText = str.ReadToEnd();
            str.Close();

            mailText = mailText.Replace("[textmessage]", message);
            SendMail(FromAddress, emailsList, subject, mailText);
        }

        public void SendSMSTemplateAsEmail(Dictionary<string, int> smsTemplateEnumValues, SystemCas casData, IPrincipal loggedInUser = null)
        {
            InitMail();
            string ownerDataUserName = casData.CreatedBy;
            int assignedToId = casData.AssigneeId.GetValueOrDefault();
            int caseId = casData.Id;
            foreach (var data in smsTemplateEnumValues)
            {
                var allMsgTemplates = LanguageFallbackHelper.GetBothLanguageSMSTemplate(data.Value);
                var msgDefaultLanguage = allMsgTemplates.Select(t => t.DefaultTemplateLanguage).Distinct().FirstOrDefault();

                var msgData = allMsgTemplates.Where(t => t.LanguageId == msgDefaultLanguage).FirstOrDefault();

                if (msgData == null)
                {
                    var defaultSystemLanguage = CultureHelper.GetDefaultLanguageId();
                    if (defaultSystemLanguage != msgDefaultLanguage)
                    {
                        msgData = allMsgTemplates.Where(t => t.LanguageId == defaultSystemLanguage).FirstOrDefault();
                    }
                }

                if (msgData != null && !(string.IsNullOrEmpty(msgData.Description) || string.IsNullOrWhiteSpace(msgData.Description)))
                {
                    var destinationUserData = new ProfileViewModel();

                    if (data.Key == GeneralEnums.Send_SMS_To.Citizen.ToString())
                    {
                        destinationUserData = LanguageFallbackHelper.GetUserProfileByUsername(ownerDataUserName, msgData.DefaultTemplateLanguage);
                    }
                    else if (data.Key == GeneralEnums.Send_SMS_To.Employee.ToString())
                    {
                        destinationUserData = LanguageFallbackHelper.GetUserProfile(assignedToId, msgData.DefaultTemplateLanguage); ;
                    }
                    else
                    {
                        destinationUserData = null;
                    }

                    if (destinationUserData != null && destinationUserData.Id > 0 && (destinationUserData.Email!=null)) // TODO using IsNullOrWhiteSpace
                    {

                        msgData.Description = SMSHelper.GetMsgBodyWithParameters(destinationUserData, msgData.Description, caseId);

                        string subject = $"{Constants.EmailTemplate.SubjectSystemCase} - {casData.Title}";

                        SendMail(FromAddress, new List<string>() { destinationUserData.Email }, subject, msgData.Description);

                        AddEmailToCommunicationLog((int)GeneralEnums.CommunicationLogEnum.Email, msgData.Description, loggedInUser);
                    }
                }
            }
        }

        private static void AddEmailToCommunicationLog(int typeId, string LogText, IPrincipal User = null)
        {
            using (var db = new CrmSystemEntities())
            {
                var username = User != null ? User.Identity.Name : Constants.Users.Service;
                try
                {
                    var data = new CommunicationLog()
                    {
                        TypeId = typeId,
                        LogText = LogText,
                        CreatedBy = username,
                        CreatedOn = DateTime.Now,
                        Status = (int)GeneralEnums.StatusEnum.Active,
                    };
                    db.CommunicationLogs.Add(data);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    //TODO QASEM LogHelper.LogException(username, ex, $"Error while saving communication log for sms template as email for msg {LogText}");
                }
            }
        }

        public void SendFileAsEmail(List<string> toAddress, string filePath, string subject, string emailBody)
        {
            InitMail();
            var file = new FileInfo(filePath);
            if (file.Exists)
            {
                SendMail(FromAddress, toAddress, subject, emailBody, file.FullName);
            }
        }
    }
}