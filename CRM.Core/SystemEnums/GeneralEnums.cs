using CRM.Core.App_GlobalResources.General;
using System.ComponentModel.DataAnnotations;

namespace CRM.Core.SystemEnums
{
    public class GeneralEnums
    {
        public enum StatusEnum
        {
            Active = 1,
            Deleted = 2,
            Deactive = 3,
            Archived = 4
        }
        public enum LeadActivityTypeEnum
        {
            [Display(ResourceType = typeof(Home), Name = "Email")]
            Email =1,
            [Display(ResourceType = typeof(Home), Name = "Meeting")]
            Meeting =2,
            [Display(ResourceType = typeof(Home), Name = "Call")]
            Call =3
        }
        public enum LeadActivityStatusEnum
        {
            [Display(ResourceType = typeof(Home), Name = "New")]
            New =1,
            [Display(ResourceType = typeof(Home), Name = "InProgress")]           
            InProgress =2,
            [Display(ResourceType = typeof(Home), Name = "Done")]
            Done =3
        }
        public enum LeadStatusEnum
        {
            [Display(ResourceType = typeof(Home), Name = "New")]           
            New = 1,
            [Display(ResourceType = typeof(Home), Name = "Qualified")]            
            Qualified = 2,
            [Display(ResourceType = typeof(Home), Name = "Won")]           
            Won = 3,
            [Display(ResourceType = typeof(Home), Name = "Lost")]            
            Lost = 4
        }
        public enum PersonInformationTypeEnum
        {
            Identity = 51,
            Mobile = 53,
            Email = 52,
            Name = 50
        }

        public enum ContactEnum
        {
            Posted = 1,
            Reviewed = 2,
            Deleted = 3,
            Deactive = 4
        }

        public enum EmailEnum
        {
            ForgetPassword = 1,
            ErrorEmail = 2,
            NewsLetterEmail = 3,
        }

        public enum FileEnum
        {
            Image = 1,
            File = 2,
            Pdf = 3,
            ProfileImage = 7
        }

        public enum CommunicationLogEnum
        {
            Sms = 1,
            Email = 2
        }

        public enum MasterLookupEnums
        {
            Gender = 1,
            MartialStatus = 2,
            Language = 3,
            YesNo = 4,
            JobWorkPrefer = 5,
            Province = 6,
            City = 7,
            Region = 8,
            PrefferdLanguage = 10,
            WeekDays = 11,
            CaseCategory = 14,
            CaseSeverity = 13,
            CasePriority = 12,
            WorkFlowStates = 15,
            CitizenSearchTypes = 16,
            FormCategories = 17,
            JobCategories = 18,
            TenderCategories = 19,
            EmergencyCategories = 21,
            TenderStates = 22,
            JobStates = 23
        }

        public enum LanguageEnum
        {
            Arabic = 1,
            English = 2
        }

        public enum PageEnum
        {
            Menu = 3,
            UserProfile = 7,
            Lookup = 19,
            SystemSetting = 21,
            ContactUs = 23,
            Department = 24,
            Permission = 25,
            ManageCase = 27,
            Sla = 28
        }

        public enum StateEnum
        {
            New = 34,
            InProgress = 35,
            Rejected = 36,
            Duplicated = 37,
            Resolved = 38,
            Closed = 39,
            Na = 40,
            NewAssignee = 41,
            TenderNew = 65,
            TenderRecieved = 66,
            TenderInProgress = 67,
            TenderWinner = 68,
            TenderLoser = 69,
            JobNew = 70,
            JobRecieved = 71,
            JobInProgress = 72,
            JobWinner = 73
        }

        public enum SMSTemplatesEnum
        {
            NewSMSTemplate_Citizen = 1,
            NewSMSTemplate_Employee = 2,
            InProgressSMSTemplate_Citizen = 3,
            InProgressSMSTemplate_Employee = 4,
            RejectedSMSTemplate_Citizen = 5,
            RejectedSMSTemplate_Employee = 6,
            DuplicatedSMSTemplate_Citizen = 7,
            DuplicatedSMSTemplate_Employee = 8,
            ResolvedSMSTemplate_Citizen = 9,
            ResolvedSMSTemplate_Employee = 10,
            ClosedSMSTemplate_Citizen = 11,
            ClosedSMSTemplate_Employee = 12,
            NaSMSTemplate_Citizen = 13,
            NaSMSTemplate_Employee = 14,
            SlaSMSTemplate_Citizen = 15,
            SlaSMSTemplate_Employee = 16,
            NewAssigneeTemplate_Employee = 17,

            NewTenderSMSTemplate_Citizen = 18,
            NewTenderSMSTemplate_Employee = 19,
            RecievedTenderSMSTemplate_Citizen = 20,
            RecievedTenderSMSTemplate_Employee = 21,
            InProgressTenderSMSTemplate_Citizen = 22,
            InProgressTenderSMSTemplate_Employee = 23,
            WinnerTenderSMSTemplate_Citizen = 24,
            WinnerTenderSMSTemplate_Employee = 25,
            LoserTenderSMSTemplate_Citizen = 26,
            LoserTenderSMSTemplate_Employee = 27,

            NewJobSMSTemplate_Citizen = 28,
            NewJobSMSTemplate_Employee = 29,
            RecievedJobSMSTemplate_Citizen = 30,
            RecievedJobSMSTemplate_Employee = 31,
            InProgressJobSMSTemplate_Citizen = 32,
            InProgressJobSMSTemplate_Employee = 33,
            WinnerJobSMSTemplate_Citizen = 34,
            WinnerJobSMSTemplate_Employee = 35,
        }

        public enum Send_SMS_To
        {
            Citizen,
            Employee
        }

        public enum WeekDaysEnum
        {
            //
            // Summary:
            //     Indicates Sunday.
            Sunday = 21,
            //
            // Summary:
            //     Indicates Monday.
            Monday = 22,
            //
            // Summary:
            //     Indicates Tuesday.
            Tuesday = 23,
            //
            // Summary:
            //     Indicates Wednesday.
            Wednesday = 24,
            //
            // Summary:
            //     Indicates Thursday.
            Thursday = 25,
            //
            // Summary:
            //     Indicates Friday.
            Friday = 26,
            //
            // Summary:
            //     Indicates Saturday.
            Saturday = 20
        }

        public enum Mapping_Article_Type
        {
            Master = 1,
            Detailes = 2
        }


        public enum CasesType
        {
            Complaints = 1,
            Emergency = 2,
            Jobs = 3,
            Tenders = 4,
            Froms = 5
        }
    }
}