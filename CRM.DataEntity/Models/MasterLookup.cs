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
    
    public partial class MasterLookup
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MasterLookup()
        {
            this.DetailsLookups = new HashSet<DetailsLookup>();
            this.MasterLookupTranslations = new HashSet<MasterLookupTranslation>();
        }
    
        public int Id { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public int Status { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DetailsLookup> DetailsLookups { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MasterLookupTranslation> MasterLookupTranslations { get; set; }
    }
}
