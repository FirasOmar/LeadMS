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
    
    public partial class SysCaseComment
    {
        public int Id { get; set; }
        public string Comment { get; set; }
        public int CaseId { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public int Status { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public Nullable<bool> ForCitizen { get; set; }
        public string FilePath { get; set; }
    
        public virtual SystemCas SystemCas { get; set; }
    }
}
