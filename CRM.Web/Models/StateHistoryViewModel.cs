

//using System;
//using System.ComponentModel.DataAnnotations;
//using CRM.Web.App_GlobalResources.SystemCases;

//namespace CRM.Web.Models
//{
//    public class StateHistoryViewModel
//    {
//        public int Id { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "CaseName")]
//        public int CaseId { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "CaseName")]
//        public string CaseName { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "PreviousState")]
//        public int PreviousState { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "PreviousState")]
//        public string PreviousStateName { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "CurrentStateName")]
//        public int CurrentState { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "CurrentStateName")]
//        public string CurrentStateName { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "TxtCreatedOn")]
//        public DateTime CreatedOn { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "TxtCreatedBy")]
//        public string CreatedBy { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "TxtStatus")]
//        public int Status { get; set; }
//        [Display(ResourceType = typeof(StateHistory), Name = "TxtStatus")]
//        public string StatusName { get; set; }
//    }
//}