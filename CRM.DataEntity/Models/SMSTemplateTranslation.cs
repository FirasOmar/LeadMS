//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CRM.DataEntity.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SMSTemplateTranslation
    {
        public int Id { get; set; }
        public int SMSTemplateId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int LanguageId { get; set; }
        public bool IsDefault { get; set; }
    
        public virtual SMSTemplate SMSTemplate { get; set; }
    }
}
