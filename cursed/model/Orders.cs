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
    
    public partial class Orders
    {
        public int IdOrder { get; set; }
        public Nullable<int> MasterId { get; set; }
        public string OrderDescription { get; set; }
        public int ComponentId { get; set; }
        public int ComputerId { get; set; }
        public int OrderStatusId { get; set; }
        public Nullable<System.DateTime> OrderExecDate { get; set; }
        public string OrderCode { get; set; }
    
        public virtual Components Components { get; set; }
        public virtual Computers Computers { get; set; }
        public virtual OrderStatuses OrderStatuses { get; set; }
    }
}
