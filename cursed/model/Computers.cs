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
    
    public partial class Computers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Computers()
        {
            this.Computer_Component_Relationship = new HashSet<Computer_Component_Relationship>();
        }
    
        public int ComputerId { get; set; }
        public string ComputerName { get; set; }
        public int ComputerTypeId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Computer_Component_Relationship> Computer_Component_Relationship { get; set; }
        public virtual ComputerTypes ComputerTypes { get; set; }
    }
}
