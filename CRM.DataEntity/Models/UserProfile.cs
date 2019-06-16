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
    
    public partial class UserProfile
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public UserProfile()
        {
            this.Leads = new HashSet<Lead>();
            this.StateTransitionsConfigurations = new HashSet<StateTransitionsConfiguration>();
            this.SystemCases = new HashSet<SystemCas>();
            this.UserProfile1 = new HashSet<UserProfile>();
            this.UserProfileHolidays = new HashSet<UserProfileHoliday>();
            this.UserProfileOffDays = new HashSet<UserProfileOffDay>();
            this.UserProfileTranslations = new HashSet<UserProfileTranslation>();
        }
    
        public int Id { get; set; }
        public string Username { get; set; }
        public string PhoneNumber { get; set; }
        public string IdNumber { get; set; }
        public string Fax { get; set; }
        public Nullable<System.DateTime> Birthday { get; set; }
        public Nullable<int> GenderLookupId { get; set; }
        public Nullable<int> MartialStatusLookupId { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int Status { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public string Mobile { get; set; }
        public Nullable<System.DateTime> LastLogin { get; set; }
        public string ProfilePhoto { get; set; }
        public string IntegrationId { get; set; }
        public Nullable<int> ProvinceId { get; set; }
        public Nullable<int> CityId { get; set; }
        public Nullable<int> RegionId { get; set; }
        public Nullable<int> DepartmentId { get; set; }
        public Nullable<int> ManagerId { get; set; }
        public Nullable<int> PreferedLanguageId { get; set; }
        public string Email { get; set; }
        public string StatusEditDescription { get; set; }
    
        public virtual Department Department { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Lead> Leads { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StateTransitionsConfiguration> StateTransitionsConfigurations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SystemCas> SystemCases { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserProfile> UserProfile1 { get; set; }
        public virtual UserProfile UserProfile2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserProfileHoliday> UserProfileHolidays { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserProfileOffDay> UserProfileOffDays { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserProfileTranslation> UserProfileTranslations { get; set; }
    }
}
