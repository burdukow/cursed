//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace cursed.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Components
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Components()
        {
            this.ComputerComponentRelationship = new HashSet<ComputerComponentRelationship>();
            this.Orders = new HashSet<Orders>();
        }
    
        public int IdComponent { get; set; }
        public string ComponentModel { get; set; }
        public decimal ComponentPrice { get; set; }
        public int ComponentAmount { get; set; }
        public string ComponentArticle { get; set; }
        public int ComponentManufacturerId { get; set; }
        public int ComponentTypeId { get; set; }
    
        public virtual ComponentTypes ComponentTypes { get; set; }
        public virtual Manufacturers Manufacturers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ComputerComponentRelationship> ComputerComponentRelationship { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Orders> Orders { get; set; }
    }
}
