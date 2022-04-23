using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebChuyennganh.Models
{
    public class Giohang
    {
        db_BanDongHoEntities5 data = new db_BanDongHoEntities5();
        public string sMaSP { set; get; }
        public string sTenSP { set; get; }
        public string sAnhbia { set; get; }
        public double iDonggia { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get
            {
                return iSoluong * iDonggia;
            }
        }
        public Giohang(string maSP)
        {
            sMaSP = maSP;
            DongHo sanpham = data.DongHoes.Single(n => n.MaDH == sMaSP);
            sTenSP = sanpham.MaDH;
            sAnhbia = sanpham.HinhDD;
            iDonggia = double.Parse(sanpham.GiaBan.ToString());
            iSoluong = 1;
        }
    }
}