//using System;
//using System.Collections.Generic;
//using System.ComponentModel.DataAnnotations;
//using CRM.Web.App_GlobalResources.Sla;

//namespace CRM.Web.Models
//{
//    public class SlaViewModel
//    {
//        public int Id { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "WorkingDaysIncludingHolidays")]
//        public bool WorkingDaysIncludingHolidays { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "HoursPerState")]
//        public int HoursPerState { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "NotifyBefore")]
//        public int NotifyBefore { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "NotificationCount")]
//        public int? NotificationCount { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "PropogateToManager")]
//        public bool PropogateToManager { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "CcAssignee")]
//        public bool CcAssignee { get; set; }
//        public DateTime CreatedOn { get; set; }
//        public string CreatedBy { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "TxtStatus")]
//        public int Status { get; set; }
//        public DateTime? DeletedOn { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "Name")]
//        public string Name { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "Description")]
//        public string Description { get; set; }
//        [Display(ResourceType = typeof(Sla), Name = "TxtSendToEmployee")]
//        public bool SendEmployee { set; get; }
//        [Display(ResourceType = typeof(Sla), Name = "TxtSendToCitizen")]
//        public bool SendCitizen { set; get; }

//        public int LanguageId { get; set; }
//        public List<DetailsLookupViewModel> IgnoredStates { get; set; }
//        public List<DetailsLookupViewModel> Categories { get; set; }
//    }
//}