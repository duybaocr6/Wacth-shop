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
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class CTDonHang
    {
        [Display(Name = "Số phiếu nhập")]
        public int SoDH { get; set; }
        [Display(Name = "Mã đồng hồ")]
        public string MaDH { get; set; }
        [Display(Name = "Số lượng")]
        public int SoLuong { get; set; }
        [Display(Name = "Giá tiền")]
        public decimal GiaTien { get; set; }
        [Display(Name = "Thành tiền")]
        public decimal ThanhTien { get; set; }

        public virtual DongHo DongHo { get; set; }
        public virtual DonHang DonHang { get; set; }
    }
}
