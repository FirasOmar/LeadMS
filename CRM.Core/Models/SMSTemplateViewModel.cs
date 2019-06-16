using CRM.DataEntity.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Core.Models
{
   
        public class SMSTemplateViewModel
        {
            public int Id { get; set; }
            [Display(ResourceType = typeof(SMSTemplate), Name = "TxtName")]
            public string Name { get; set; }
            [Display(ResourceType = typeof(SMSTemplate), Name = "TxtDescription")]
            public string Description { get; set; }
            [Display(ResourceType = typeof(SMSTemplate), Name = "TxtCreatedOn")]
            public DateTime CreatedOn { get; set; }
            [Display(ResourceType = typeof(SMSTemplate), Name = "TxtCreatedBy")]
            public string CreatedBy { get; set; }
            [Display(ResourceType = typeof(SMSTemplate), Name = "TxtStatus")]
            public int Status { get; set; }
            public DateTime? DeletedOn { get; set; }
            [Display(ResourceType = typeof(SMSTemplate), Name = "TxtDefaultTemplateLanguage")]
            public int DefaultTemplateLanguage { set; get; }
            public int LanguageId { get; set; }
            public bool IsDefault { get; set; }
        }
    }
