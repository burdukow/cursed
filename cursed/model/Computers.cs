//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
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
            this.ComputerComponentRelationship = new HashSet<ComputerComponentRelationship>();
            this.Orders = new HashSet<Orders>();
        }
    
        public int ComputerId { get; set; }
        public string ComputerName { get; set; }
        public int ComputerTypeId { get; set; }
        public string ComputerPicPath { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ComputerComponentRelationship> ComputerComponentRelationship { get; set; }
        public virtual ComputerTypes ComputerTypes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Orders> Orders { get; set; }
    }
}
