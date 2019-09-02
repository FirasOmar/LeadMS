namespace CRM.Core
{
    public class Constants
    {
        public static class Errors
        {
            public static class Apis
            {
                public const string ErrorUserNotfound = "Error User Not Found";
                public const string ErrorGetComplaints = "Error while getting complaints";
                public const string ErrorGetLookups = "Error while getting lookups";
                public const string ErrorGetComplaint = "Error while getting complaint";
                public const string ErrorGetDepatments = "Error while getting departments";
                public const string ErrorComplaintNotfound = "Error complaint not found";
                public const string ErrorDeleteComplaintAttachment = "Error delete complaint attachment";
                public const string ErrorDeleteComplaint = "Error delete complaint";
                public const string ErrorChangeComplaintState = "Error change complaint state";
                public const string ErrorDeleteComplaintComment = "Error delete complaint comment";
                public const string ErrorAddComplaintComment = "Error add complaint comment";
                public const string ErrorAddCategory = "Error add category";
                public const string ErrorPostComplaints = "Error while uploading complaint";
                public const string ErrorPleaseUploadComplaintData = "Error Please Upload Complaint Data";
                public const string ErrorUploadingfiles = "Error while uploading files to server";

                public const string ErrorGettingCustomSetting = "Error while getting custom setting";

                public const string ErrorPleaseUploadFile = "Please Upload File!";

                public const string ErrorRegister = "Error while register";
                public const string ErrorLogin = "Error while login";
                public const string ErrorGetProfileInfo = "Error while getting profile info";
                public const string ErrorLoginNoAccess = "User has No access";
            }
        }

        public static class Success
        {
            public static class Apis
            {
                
                public const string SuccessLogin = "Login Success";
            }
        }

        public static class RichEditors
        {
            public const string Editor_Skin = "office2010black";
        }

        public static class Roles
        {
            public const string ContentAdmin = "ContentAdmin";
            public const string Administrator = "Administrator";
            public const string User = "User";
            public const string Citizen = "citizen";
        }




        public static class Users
        {
            public const string Integration = "Integration";
            public const string Service = "Service";
            public const string Mobile = "MobileUser";
            public const string System = "System";
        }

        public static class ApiMessages
        {
            public const string Success = "Success!";
            public const string GeneralError = "General Error";
            public const string UnSupported = "The request doesn't contain valid content!";
        }

        public static class Messages
        {
            public const string UpdateProfileSuccess = "Profile Updated Successfully!";
            public const string UpdateProfileError = "Error while updating the Profile!";
        }

        public static class LanguageCultures
        {
            public const string Arabic = "ar";
            public const string Hebrew = "he";
        }

        public static class SystemSettings
        {
            public const string WebsiteUrl = "WebsiteUrl";
            public const string StaticMenu = "Static_Menu";
            public const string GoogleAnalytics = "Tracking_Id_Google_Analytics";
            public const string EmailsResetPassword = "System_Emails_Reset_Password";
            public const string EmailsSourceEmail = "System_Emails_Source_Email";
            public const string EmailsSourceName = "System_Emails_Source_Email_Name";
            public const string EmailsSmtpClient = "System_Emails_SmtpClient";
            public const string EmailsReplyTo = "System_Emails_ReplyTo";
            public const string EmailsSmtpPort = "System_Emails_SmtpPort";
            public const string EmailsEnableSsl = "System_Emails_EnableSsl";
            public const string EmailsErrorEmail = "System_Emails_Error_Email";
            public const string CrmApiServer = "System_CRM_API_Server";
            public const string ControlPanelPageSize = "System_ControlPanel_PageSize";
            public const string IntegrationApiUsername = "Crm_Integration_Api_Username";
            public const string IntegrationApiPassword = "Crm_Integration_Api_Password";
            public const string FileMaxSize = "FileMaxSize";
            public const string AllowedFilesForUpload = "AllowedFilesForUpload";
            public const string CmsSystemLink = "Cms_System_Link";
            public const string ArchivingSystemLink = "Archiving_System_Link";
            public const string AllowedRolesForMobile = "Crm_Allowed_Roles_For_Mobile";

            public const string ForgetPasswordLink = "System_CRM_ForgetPasswordLink";
            public const string RegistrationLink = "System_CRM_RegistrationLink";

            public const string SMSApiUrl = "SMS_API_URL";
            public const string SMSUsername = "SMS_Username";
            public const string SMSPassword = "SMS_Password";
            public const string SMSSource = "SMS_Source";
            public const string CMSIntegrationUsernmae = "CMS_Intg_Username";
            public const string CMSIntegrationPassword = "CMS_Intg_Password";
            public const string CMSApiFormsUrl = "CMS_API_Forms_Url";
        }

        public static class EmailTemplate
        {
            public const string SubjectResetPassword = "Reset Password";
            public const string TextMessageResetPassword =
                "It show you request an new Password ,Please reset your password by clicking on button";
            public const string PreHeaderForgetEmail = "Reset Password Email";
            public const string PathForgetPasswordTemplate = "~/Templates/Email/ForgetPasswordTemplate.html";

            public const string SubjectSystemError = "System Error";
            public const string PreHeaderSystemErrorEmail = "System Error Email";
            public const string PathSystemErrorTemplate = "~/Templates/Email/SystemErrorTemplate.html";

            public const string SubjectSystemCase = "System Case";
            public const string PreHeaderSystemCaseEmail = "System Case Email";
            public const string PathSystemCaseTemplate = "~/Templates/Email/SystemCaseTemplate.html";

            public const string SubjectSystemCaseNotification = "System Case Notification";
            public const string PreHeaderSystemCaseNotificationEmail = "System Case Notification Email";
            public const string PathSystemCaseNotificationTemplate = "Templates\\Email\\SystemCaseNotificationTemplate.html";

        }

        public static class TempaltesPathes
        {
            public static class Menu
            {
                public const string MainMenu = "~/Templates/Menu/ParentMenu.html";
                public const string SubMenu = "~/Templates/Menu/SubMenu.html";

            }
            public static class Case
            {
                public const string SendCaseByEmailTemplate = "~/Views/ManageCases/CaseAsEmailTemplate.cshtml";
                public const string SendCaseByEmailFolder = "~/Document/CasesAsPDFEmail/";
            }
        }
    }
}