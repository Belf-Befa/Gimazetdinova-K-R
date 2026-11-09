using Microsoft.EntityFrameworkCore;
using backend.Models;

namespace backend.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Assembly> Assemblies { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Указываем, что таблица называется assembly
            modelBuilder.Entity<Assembly>().ToTable("assembly");
            
            // Указываем, как называются колонки в базе (snake_case)
            modelBuilder.Entity<Assembly>().Property(a => a.EquipmentName).HasColumnName("equipment_name");
            modelBuilder.Entity<Assembly>().Property(a => a.OrderDate).HasColumnName("order_date");
            modelBuilder.Entity<Assembly>().Property(a => a.Customer).HasColumnName("customer");
            modelBuilder.Entity<Assembly>().Property(a => a.Status).HasColumnName("status");
            modelBuilder.Entity<Assembly>().Property(a => a.PlannedStart).HasColumnName("planned_start");
            modelBuilder.Entity<Assembly>().Property(a => a.ActualStart).HasColumnName("actual_start");
            modelBuilder.Entity<Assembly>().Property(a => a.ActualEnd).HasColumnName("actual_end");
            modelBuilder.Entity<Assembly>().Property(a => a.PlannedShipment).HasColumnName("planned_shipment");
            modelBuilder.Entity<Assembly>().Property(a => a.ActualShipment).HasColumnName("actual_shipment");
            modelBuilder.Entity<Assembly>().Property(a => a.Electrician).HasColumnName("electrician");
            modelBuilder.Entity<Assembly>().Property(a => a.SerialNumber).HasColumnName("serial_number");
            modelBuilder.Entity<Assembly>().Property(a => a.Notes).HasColumnName("notes");
            modelBuilder.Entity<Assembly>().Property(a => a.PackagingInfo).HasColumnName("packaging_info");
            modelBuilder.Entity<Assembly>().Property(a => a.DisassemblyInfo).HasColumnName("disassembly_info");
            modelBuilder.Entity<Assembly>().Property(a => a.CreatedAt).HasColumnName("created_at");
            modelBuilder.Entity<Assembly>().Property(a => a.CreatedByUserId).HasColumnName("created_by_user_id");
            modelBuilder.Entity<Assembly>().Property(a => a.AssigneeUserId).HasColumnName("assignee_user_id");
        }
    }
}