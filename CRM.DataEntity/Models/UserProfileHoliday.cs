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
    
    public partial class UserProfileHoliday
    {
        public int Id { get; set; }
        public Nullable<int> UserProfileId { get; set; }
        public Nullable<System.DateTime> HolidayDate { get; set; }
        public string Description { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public int Status { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
    
        public virtual UserProfile UserProfile { get; set; }
    }
}
