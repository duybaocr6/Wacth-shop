﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebChuyennganh.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class db_BanDongHoEntities5 : DbContext
    {
        public db_BanDongHoEntities5()
            : base("name=db_BanDongHoEntities5")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BaiViet> BaiViets { get; set; }
        public virtual DbSet<CTDonHang> CTDonHangs { get; set; }
        public virtual DbSet<CTPhieuNhap> CTPhieuNhaps { get; set; }
        public virtual DbSet<DongHo> DongHoes { get; set; }
        public virtual DbSet<DonHang> DonHangs { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<Nhom> Nhoms { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }
        public virtual DbSet<PhieuNhap> PhieuNhaps { get; set; }
        public virtual DbSet<ThuongHieu> ThuongHieux { get; set; }
        public virtual DbSet<TrangThai> TrangThais { get; set; }
    }
}
