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
        public double ComponentPrice { get; set; }
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
