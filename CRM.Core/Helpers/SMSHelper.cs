using Crm.Sms.Requests;
using CRM.Core.Models;
using CRM.Core.SystemEnums;
using CRM.DataEntity.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Core.Helpers
{
    public class SMSHelper
    {
        public static void SendSMSTemplate(Dictionary<string, int> smsTemplateEnumValues, IPrincipal loggedInUser = null, string ownerDataUserName = "", int assignedToId = 0, int caseId = 0)
        {
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
                    var smsServiceRequest = new SendSmsRequest()
                    {
                        Url = SettingHelper.GetOrCreate(Constants.SystemSettings.SMSApiUrl, "https://019sms.co.il/api").Value,
                        Username = SettingHelper.GetOrCreate(Constants.SystemSettings.SMSUsername, "sectorspr").Value,
                        Password = SettingHelper.GetOrCreate(Constants.SystemSettings.SMSPassword, "faraj123").Value,
                        Destinations = new List<string>(),
                        Message = string.Empty,
                        Source = SettingHelper.GetOrCreate(Constants.SystemSettings.SMSSource, "123").Value
                    };

                    var smsService = new Crm.Sms.SmsService();
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

                    if (destinationUserData != null && destinationUserData.Id > 0)
                    {

                        msgData.Description = GetMsgBodyWithParameters(destinationUserData, msgData.Description, caseId);
                        smsServiceRequest.Destinations = new List<string> { destinationUserData.Mobile };
                        smsServiceRequest.Message = msgData.Description;
                        var _result = smsService.Execute(smsServiceRequest);
                        if (_result)
                        {
                            AddSMSToCommunicationLog((int)GeneralEnums.CommunicationLogEnum.Sms, smsServiceRequest.Message, loggedInUser);
                        }
                    }
                }
            }
        }

        private static void AddSMSToCommunicationLog(int typeId, string LogText, IPrincipal User = null)
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
                    //TODO QASEM LogHelper.LogException(username, ex, $"Error while saving communication log for sms  for msg {LogText}");
                }
            }
        }

        public static string GetMsgBodyWithParameters(ProfileViewModel userData, string msgBody, int caseId)
        {
            if (msgBody.Contains("{CaseId}"))
            {
                msgBody = msgBody.Replace("{CaseId}", caseId.ToString());
            }
            if (msgBody.Contains("{Username}"))
            {
                msgBody = msgBody.Replace("{Username}", userData.Username);
            }
            if (msgBody.Contains("{Mobile No}"))
            {
                msgBody = msgBody.Replace("{Mobile No}", userData.Mobile);
            }
            if (msgBody.Contains("{Identity}"))
            {
                msgBody = msgBody.Replace("{Identity}", userData.IdNumber);
            }
            if (msgBody.Contains("{FullName}"))
            {
                msgBody = msgBody.Replace("{FullName}", userData.FullName);
            }

            return msgBody;
        }

        public static Dictionary<string, int> GetSMSStatusTemplateEnumValue(int stateTo)
        {
            var smsTemplateEnumValue = new Dictionary<string, int>();
            switch (stateTo)
            {
                case (int)GeneralEnums.StateEnum.New:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.NewSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.NewSMSTemplate_Employee);
                    break;
                case (int)GeneralEnums.StateEnum.InProgress:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.InProgressSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.InProgressSMSTemplate_Employee);
                    break;
                case (int)GeneralEnums.StateEnum.Rejected:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.RejectedSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.RejectedSMSTemplate_Employee);
                    break;
                case (int)GeneralEnums.StateEnum.Duplicated:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.DuplicatedSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.DuplicatedSMSTemplate_Employee);
                    break;
                case (int)GeneralEnums.StateEnum.Resolved:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.ResolvedSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.ResolvedSMSTemplate_Employee);
                    break;
                case (int)GeneralEnums.StateEnum.Closed:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.ClosedSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.ClosedSMSTemplate_Employee);
                    break;
                case (int)GeneralEnums.StateEnum.Na:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.NaSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.NaSMSTemplate_Employee);
                    break;
                case (int)GeneralEnums.StateEnum.NewAssignee:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.NewAssigneeTemplate_Employee);
                    break;

                #region Tenders And Jobs 

                case (int)GeneralEnums.StateEnum.TenderNew:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.NewTenderSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.NewTenderSMSTemplate_Employee);
                    break;

                case (int)GeneralEnums.StateEnum.TenderRecieved:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.RecievedTenderSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.RecievedTenderSMSTemplate_Employee);
                    break;

                case (int)GeneralEnums.StateEnum.TenderInProgress:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.InProgressTenderSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.InProgressTenderSMSTemplate_Employee);
                    break;
                case (int)GeneralEnums.StateEnum.TenderWinner:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.WinnerTenderSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.WinnerTenderSMSTemplate_Employee);
                    break;
                case (int)GeneralEnums.StateEnum.TenderLoser:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.LoserTenderSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.LoserTenderSMSTemplate_Employee);
                    break;

                case (int)GeneralEnums.StateEnum.JobNew:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.NewJobSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.NewJobSMSTemplate_Employee);
                    break;

                case (int)GeneralEnums.StateEnum.JobRecieved:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.RecievedJobSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.RecievedJobSMSTemplate_Employee);
                    break;

                case (int)GeneralEnums.StateEnum.JobInProgress:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.InProgressJobSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.InProgressJobSMSTemplate_Employee);
                    break;

                case (int)GeneralEnums.StateEnum.JobWinner:
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.WinnerJobSMSTemplate_Citizen);
                    smsTemplateEnumValue.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.WinnerJobSMSTemplate_Employee);
                    break;

                    #endregion

            }
            return smsTemplateEnumValue;
        }
    }
}
