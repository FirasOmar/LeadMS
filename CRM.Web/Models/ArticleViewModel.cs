//using System.ComponentModel.DataAnnotations;
//using CRM.Web.App_GlobalResources.Article;
//using System;
//using Resources;

//namespace CRM.Web.Models
//{
//    public class ArticleViewModel
//    {
//        public int Id { get; set; }
//        [Display(ResourceType = typeof(Article), Name = "TxtName")]
//        public string Title { get; set; }
//        [Display(ResourceType = typeof(Article), Name = "TxtDescription")]
//        public string Description { get; set; }
//        public DateTime CreatedOn { get; set; }
//        public string CreatedBy { get; set; }
//        public int Status { get; set; }
//        public DateTime? DeletedOn { get; set; }
//        public int LanguageId { get; set; }
//        [Display(ResourceType =typeof(Article),Name ="Category")]
//        public string CategoryTitle { set; get; }
//        public int Category { set; get; }
//        public bool IsDefault { get; set; }

//        public int MasterLookupId { set; get; }
//        public int DetailesLookupId { set; get; }

//    }
//}