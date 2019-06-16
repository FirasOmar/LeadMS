using System;
using CRM.DataEntity.Models;

namespace CRM.Web.Helpers
{
    public class LogHelper
    {
        public static void AddSystemLog(SystemLog log)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    db.SystemLogs.Add(log);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    //TODO: Send Email incase of the failure of adding appliaction log
                }

            }
        }

        public static void AddEmailLog(CommunicationLog log)
        {
            using (var db = new CrmSystemEntities())
            {
                try
                {
                    db.CommunicationLogs.Add(log);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    //TODO: Send Email incase of the failure of adding Email log
                }

            }
        }

        public static void LogException(string username, Exception ex, string component)
        {
            SystemLog log = new SystemLog
            {
                Name = ex.Message,
                CreatedOn = DateTime.Now,
                CreatedBy = username,
                Component = component,
                StackTrace = $"InnerException: {ex.InnerException}, StackTrace: {ex.StackTrace}"
            };
            AddSystemLog(log);
        }
    }
}