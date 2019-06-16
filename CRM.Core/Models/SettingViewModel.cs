
using System;

namespace CRM.Core.Models
{
    public class SettingViewModel
    {
       
        public int Id { get; set; }
        public string Name { get; set; }
        public string Value { get; set; }
        public int Status { get; set; }
        public int LanguageId { get; set; }
        public DateTime? DeletedOn { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }

    }
}