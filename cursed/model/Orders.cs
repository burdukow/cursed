//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace cursed.model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Orders
    {
        public int IdOrder { get; set; }
        public int UserId { get; set; }
        public int MasterId { get; set; }
        public string OrderDescription { get; set; }
        public int ComponentId { get; set; }
        public int OrderStatusId { get; set; }
        public System.DateTime OrderExecDate { get; set; }
    
        public virtual Components Components { get; set; }
        public virtual OrderStatuses OrderStatuses { get; set; }
        public virtual Users Users { get; set; }
    }
}
