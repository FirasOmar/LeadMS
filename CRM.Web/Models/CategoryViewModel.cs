using System.ComponentModel.DataAnnotations;
using CRM.Web.App_GlobalResources.Category;
using System;
using Resources;

namespace CRM.Web.Models
{
    public class CategoryViewModel
    {
        public int Id { get; set; }
        [Display(ResourceType = typeof(KnowledgeCategory), Name = "TxtName")]
        public string Title { get; set; }
        [Display(ResourceType = typeof(KnowledgeCategory), Name = "TxtDescription")]
        public string Description { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public int Status { get; set; }
        public DateTime? DeletedOn { get; set; }
        public int LanguageId { get; set; }
        public bool IsDefault { get; set; }
    }
}