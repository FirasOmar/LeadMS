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
    
    public partial class Lead_Activity
    {
        public int Id { get; set; }
        public Nullable<int> Activity_Type { get; set; }
        public Nullable<int> Activity_Status { get; set; }
        public Nullable<System.DateTime> Activity_Date { get; set; }
        public string Notes { get; set; }
        public Nullable<int> Lead_ID { get; set; }
    
        public virtual Lead Lead { get; set; }
    }
}
