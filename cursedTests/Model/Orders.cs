//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace cursedTests.Model
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
