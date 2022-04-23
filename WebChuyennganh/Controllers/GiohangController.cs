using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebChuyennganh.Models;

namespace WebChuyennganh.Controllers
{
    public class GiohangController : Controller
    {
        // GET: Giohang
        db_BanDongHoEntities5 data = new db_BanDongHoEntities5();

        public List<Giohang> Laygiohang()
        {
            List<Giohang> listGiohang = Session["Giohang"] as List<Giohang>;
            if (listGiohang == null)
            {
                listGiohang = new List<Giohang>();
                Session["Giohang"] = listGiohang;
            }
            return listGiohang;
        }

        public ActionResult ThemGioHang(string sMaSP, string strURL)
        {
            List<Giohang> listGiohang = Laygiohang();
            Giohang sanpham = listGiohang.Find(n => n.sMaSP.Equals(sMaSP));
            if (sanpham != null)
            {
                sanpham.iSoluong++;
                return Redirect(strURL);
            }
            else
            {
                sanpham = new Giohang(sMaSP);
                listGiohang.Add(sanpham);
                return Redirect(strURL);
            }
        }

        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                iTongSoLuong = lstGiohang.Sum(n => n.iSoluong);
            }
            return iTongSoLuong;
        }

        public double TongTien()
        {
            double iTongTien = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.dThanhtien);
            }
            return iTongTien;
        }

        public ActionResult Giohang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }

        public ActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }

        public ActionResult XoaGiohang(string iMaSP)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.sMaSP == iMaSP);
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.sMaSP == iMaSP);
                return RedirectToAction("Giohang");
            }
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Giohang");
        }

        public ActionResult CapnhatGiohang(string iMaSP, FormCollection f)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.sMaSP == iMaSP);
            if (sanpham != null)
            {
                sanpham.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("Giohang");
        }

        public ActionResult XoaTatcaGiohang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult Dathang()
        {
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("Login", "User");
            }
            if (Session["Giohang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<Giohang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }

        public ActionResult Dathang(FormCollection collection)
        {
            //Them don hang
            DonHang ddh = new DonHang();
            KhachHang tk = (KhachHang)Session["Taikhoan"];
            List<Giohang> gh = Laygiohang();
            ddh.DiaChi = tk.DiaChi;
            ddh.NgayDat = DateTime.Now;
            ddh.NgayGiao = null;
            ddh.GhiChu = "";
            ddh.SoDT = tk.SoDT;
            ddh.TongSoMua = gh.Count;
            ddh.ThanhToan = (decimal)TongTien();
            ddh.TaiKhoanKH = tk.TaiKhoan;
            ddh.MaTT = 1;
            data.DonHangs.Add(ddh);
            data.SaveChanges();
            foreach(var item in gh)
            {
                CTDonHang ctdh = new CTDonHang();
                ctdh.SoDH = ddh.SoDH;
                ctdh.MaDH = item.sMaSP;
                ctdh.SoLuong = item.iSoluong;
                ctdh.GiaTien = (decimal)item.iDonggia;
                ctdh.ThanhTien = (decimal)item.dThanhtien;
                data.CTDonHangs.Add(ctdh);
            }
            data.SaveChanges();
            Session["Giohang"] = null;
            return RedirectToAction("Xacnhandonhang", "Giohang");
        }
        public ActionResult Xacnhandonhang()
        {
            return View();
        }
    }
}