//using System;
//using System.Collections.Generic;
//using System.Data.Entity;
//using System.IO;
//using System.Linq;
//using CRM.Core.Helpers;
//using CRM.Core.SystemEnums;
//using CRM.DataEntity.Models;
//using CRM.Web.Helpers;
//using CRM.Core;

//namespace CRM.Cla
//{
//    public static class SlaHelper
//    {
//        public static void SendNotificationEmails()
//        {
//            try
//            {
//                WriteToFile("Service SendNotificationEmails is called at " + DateTime.Now);
//                using (var db = new CrmSystemEntities())
//                {
//                    var currentDate = DateTime.Now;
//                    var sysCases = db.SystemCases.Where(r => r.Status == (int)GeneralEnums.StatusEnum.Active).ToList();
//                    foreach (var cas in sysCases)
//                    {
//                        var assignee = db.UserProfiles.Find(cas.AssigneeId);
//                        if (assignee == null)
//                            continue;

//                        var userDayOff = assignee.UserProfileOffDays.ToList();
//                        var userHolidays = assignee.UserProfileHolidays.ToList();
//                        var stateHistory = db.StateHistories.OrderByDescending(r => r.Id).FirstOrDefault(r => r.CaseId == cas.Id);
//                        var slaIds = db.SlaCategories.Where(r => r.CategoryId == cas.CategoryId).Select(r => r.SlaId).ToList();
//                        var activeSlas = db.SlaTranslations.Where(r => r.Sla.Status == (int)GeneralEnums.StatusEnum.Active && slaIds.Contains(r.SlaId)).ToList();
//                        foreach (var sla in activeSlas)
//                        {
//                            var ignoredCaseStates = sla.Sla.SlaIgnoredCaseStates.Select(r => r.IgnoredCaseStateId).ToList();
//                            if (stateHistory != null && ignoredCaseStates.Contains(stateHistory.CurrentState))
//                            {
//                                var differenceTimeSpan = currentDate - stateHistory.CreatedOn;
//                                var totalhours = differenceTimeSpan.TotalHours;
//                                foreach (var holiday in userHolidays)
//                                {
//                                    if (holiday.HolidayDate?.Ticks > stateHistory.CreatedOn.Ticks && holiday.HolidayDate?.Ticks < currentDate.Ticks)
//                                    {
//                                        //TODO: check if not duplicate with the days OFF
//                                        totalhours -= 24;
//                                    }
//                                }


//                                foreach (var day in userDayOff)
//                                {
//                                    if (CheckIfDayExist(stateHistory, currentDate, day.WeekDay))
//                                    {
//                                        totalhours -= 24;
//                                    }
//                                }

//                                var slaCount =
//                                    db.SlaCaseCounts.FirstOrDefault(r => r.SlaId == sla.Id && r.SysCaseId == cas.Id);
//                                var count = slaCount?.Count ?? 0;
//                                if (sla.Sla.PropogateToManager)
//                                {

//                                    if (sla.Sla.HoursPerState < (totalhours - (count * sla.Sla.HoursPerState)))
//                                    {
//                                        UpdateSlaNotificationCount(slaCount, sla, currentDate, cas, db, count);
//                                        var emailHelper = new EmailHelper();
//                                        var message = $"Please follow up with case No# {cas.Id}, Name {cas.Title}. The case not changed for {totalhours} hours";
//                                        emailHelper.SendCaseNotificationEmail(message, cas.Title,
//                                            new List<string>() { assignee.UserProfile2.Email });
//                                    }

//                                    continue;
//                                }
//                                if (sla.Sla.HoursPerState < (totalhours - (count * sla.Sla.HoursPerState)))
//                                {
//                                    if (slaCount?.Count >= sla.Sla.NotificationCount)
//                                    {
//                                        break;
//                                    }
//                                    UpdateSlaNotificationCount(slaCount, sla, currentDate, cas, db, count);
//                                    var emailHelper = new EmailHelper();
//                                    var message = $"Please follow up with case No# {cas.Id}, Name {cas.Title}. The case not changed for {totalhours} hours";
//                                    emailHelper.SendCaseNotificationEmail(message, cas.Title,
//                                        new List<string>() { assignee.Email });

//                                }
//                                try
//                                {
//                                    var enumsData = new Dictionary<string, int>();

//                                    if (sla.Sla.Send_SMS_Employee.GetValueOrDefault())
//                                    {
//                                        enumsData.Add(GeneralEnums.Send_SMS_To.Employee.ToString(), (int)GeneralEnums.SMSTemplatesEnum.SlaSMSTemplate_Employee);
//                                    }
//                                    if (sla.Sla.Send_SMS_Citizen.GetValueOrDefault())
//                                    {
//                                        enumsData.Add(GeneralEnums.Send_SMS_To.Citizen.ToString(), (int)GeneralEnums.SMSTemplatesEnum.SlaSMSTemplate_Citizen);
//                                    }

//                                    if (enumsData.Count > 0)
//                                    {
//                                        SMSHelper.SendSMSTemplate(enumsData, null, cas.CreatedBy, cas.AssigneeId.GetValueOrDefault(),cas.Id);
//                                    }
//                                }
//                                catch (Exception ex)
//                                {
//                                    LogHelper.LogException(Constants.Users.Service, ex, $"Error while sending sms  for case id {cas.Id}");
//                                }

//                            }
//                        }
//                    }
//                }
//            }
//            catch (Exception ex)
//            {
//                WriteToFile($"Exception Message: {ex.Message}. Inner Exception: {ex.InnerException}, StackTrace: {ex.StackTrace}");
//            }

//        }

//        private static bool CheckIfDayExist(StateHistory stateHistory, DateTime currentDate, string day)
//        {
//            var weekDay = DayOfWeek.Sunday;
//            switch (int.Parse(day))
//            {
//                case (int)GeneralEnums.WeekDaysEnum.Friday:
//                    weekDay = DayOfWeek.Friday;
//                    break;
//                case (int)GeneralEnums.WeekDaysEnum.Sunday:
//                    weekDay = DayOfWeek.Sunday;
//                    break;
//                case (int)GeneralEnums.WeekDaysEnum.Monday:
//                    weekDay = DayOfWeek.Monday;
//                    break;
//                case (int)GeneralEnums.WeekDaysEnum.Saturday:
//                    weekDay = DayOfWeek.Saturday;
//                    break;
//                case (int)GeneralEnums.WeekDaysEnum.Wednesday:
//                    weekDay = DayOfWeek.Wednesday;
//                    break;
//                case (int)GeneralEnums.WeekDaysEnum.Tuesday:
//                    weekDay = DayOfWeek.Tuesday;
//                    break;
//                case (int)GeneralEnums.WeekDaysEnum.Thursday:
//                    weekDay = DayOfWeek.Thursday;
//                    break;

//            }
//            DateTime dt = stateHistory.CreatedOn;
//            while (dt <= currentDate)
//            {
//                if (dt.DayOfWeek == weekDay)
//                    return true;
//                dt = dt.AddDays(1);
//            }

//            return false;
//        }

//        public static void WriteToFile(string message)
//        {
//            string path = AppDomain.CurrentDomain.BaseDirectory + "\\Logs";
//            if (!Directory.Exists(path))
//            {
//                Directory.CreateDirectory(path);
//            }
//            string filepath = AppDomain.CurrentDomain.BaseDirectory + "\\Logs\\ServiceLog_" + DateTime.Now.Date.ToShortDateString().Replace('/', '_') + ".txt";
//            if (!File.Exists(filepath))
//            {
//                // Create a file to write to.   
//                using (StreamWriter sw = File.CreateText(filepath))
//                {
//                    sw.WriteLine(message);
//                }
//            }
//            else
//            {
//                using (StreamWriter sw = File.AppendText(filepath))
//                {
//                    sw.WriteLine(message);
//                }
//            }
//        }

//        private static void UpdateSlaNotificationCount(SlaCaseCount slaCount, SlaTranslation sla, DateTime currentDate,
//            SystemCas cas, CrmSystemEntities db, int count)
//        {
//            if (slaCount == null)
//            {
//                slaCount = new SlaCaseCount()
//                {
//                    SlaId = sla.Id,
//                    CreatedBy = Core.Constants.Users.Service,
//                    CreatedOn = currentDate,
//                    SysCaseId = cas.Id,
//                    Count = 1
//                };
//                db.SlaCaseCounts.Add(slaCount);
//                db.SaveChanges();
//            }
//            else
//            {
//                slaCount.Count = (count + 1);
//                db.Entry(slaCount).State = EntityState.Modified;
//                db.SaveChanges();
//            }
//        }
//    }
//}
