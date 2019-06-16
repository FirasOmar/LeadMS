
//using System;
//using System.ComponentModel.DataAnnotations;
//using CRM.Web.App_GlobalResources.SystemCases;

//namespace CRM.Web.Models.Reports
//{
//    public class CasesDaysByCategoryViewModel
//    {
//        public int CaseId { get; set; }
//        [Display(ResourceType = typeof(SystemCases), Name = "Title")]
//        public string CaseName { get; set; }
//        [Display(ResourceType = typeof(SystemCases), Name = "CategoryName")]
//        public int CategoryId { get; set; }
//        [Display(ResourceType = typeof(SystemCases), Name = "CategoryName")]
//        public string CategoryName { get; set; }
//        [Display(ResourceType = typeof(SystemCases), Name = "FormDate")]
//        public DateTime? FormDate { get; set; }
//        [Display(ResourceType = typeof(SystemCases), Name = "ToDate")]
//        public DateTime? ToDate { get; set; }
//        [Display(ResourceType = typeof(SystemCases), Name = "Days")]
//        public double Days { get; set; }
//    }
//}