using System;

namespace backend.Models
{
    public class Assembly
    {
        public int Id { get; set; }
        public int? Number { get; set; }
        public int? EquipmentName { get; set; }
        public DateTime? OrderDate { get; set; }
        public int? Customer { get; set; }
        public int? Status { get; set; }
        public DateTime? PlannedStart { get; set; }
        public DateTime? ActualStart { get; set; }
        public DateTime? ActualEnd { get; set; }
        public DateTime? PlannedShipment { get; set; }
        public DateTime? ActualShipment { get; set; }
        public int? Electrician { get; set; }
        public int? SerialNumber { get; set; }
        public string? Notes { get; set; }
        public string? PackagingInfo { get; set; }
        public string? DisassemblyInfo { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public int? CreatedByUserId { get; set; }
        public int? AssigneeUserId { get; set; }
    }
}