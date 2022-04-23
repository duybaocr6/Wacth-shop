using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebChuyennganh.Models;

namespace WebChuyennganh.Areas.Admin.Controllers
{
    public class MainController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Index()
        {
            // Thiết lập Ngày bắt đầu (sẽ luôn là ngày 1 của tháng hiện tại)
            DateTime fromDay = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            // Thiết lập Ngày kết thúc (là ngày hiện tại)
            DateTime toDay = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);

            // Tính tổng doanh thu trong tháng với các đơn hàng có trạng thái khác Hủy
            ViewBag.DoanhThuThang = db.DonHangs.Where(x => x.NgayDat >= fromDay && x.NgayDat <= toDay && x.MaTT != 5).Sum(x => (decimal?)x.ThanhToan) ?? 0;
            // Tính tổng doanh thu trong ngày với các đơn hàng có trạng thái khác Hủy
            ViewBag.DoanhThuNgay = db.DonHangs.Where(x => x.NgayDat.Equals(DateTime.Today) && x.MaTT != 5).Sum(x => (decimal?)x.ThanhToan) ?? 0;
            // Số lượng đơn hàng trong ngày
            ViewBag.DonHangNgay = db.DonHangs.Where(x => x.NgayDat.Equals(DateTime.Today)).Count();
            // Số lượng đồng hồ còn tồn
            ViewBag.TongSoDongHo = db.DongHoes.Where(x => x.SoLuong > 0).Count();
            return View();
        }

        public ActionResult GetProfile(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return View("AdminError");
            }
            return View(nhanVien);
        }

        public ActionResult EditProfile(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return View("AdminError");
            }
            return View(nhanVien);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditProfile(FormCollection collection, string id)
        {
            NhanVien nv = db.NhanViens.SingleOrDefault(x => x.TaiKhoan.Equals(id));

            if (string.IsNullOrWhiteSpace(collection["HoTen"]))
            {
                ViewData["TrongHoTen"] = "Nhập họ tên!";
            }
            else if (string.IsNullOrEmpty(collection["SoDT"]))
            {
                ViewData["TrongSoDT"] = "Nhập số điện thoại!";
            }
            else if (collection["SoDT"].Length > 10)
            {
                ViewData["SaiSoDT"] = "Nhập tối đa l0 ký tự!";
            }
            else if (string.IsNullOrWhiteSpace(collection["DiaChi"]))
            {
                ViewData["TrongDiaChi"] = "Nhập địa chỉ!";
            }
            else if (string.IsNullOrEmpty(collection["NgaySinh"]))
            {
                ViewData["TrongNgaySinh"] = "Chọn ngày sinh!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    nv.HoTen = collection["HoTen"];
                    nv.SoDT = collection["SoDT"];
                    nv.DiaChi = collection["DiaChi"];
                    nv.NgaySinh = DateTime.Parse(collection["NgaySinh"]);
                    nv.GioiTinh = bool.Parse(collection["GioiTinh"]);
                    Session["NhanVien"] = nv;
                    db.SaveChanges();
                    return RedirectToAction("GetProfile", new { id = nv.TaiKhoan});
                }
            }
            
            return View(nv);
        }

        public ActionResult ChangePassword(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return View("AdminError");
            }
            return View(nhanVien);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(FormCollection collection, string id)
        {
            NhanVien nv = db.NhanViens.SingleOrDefault(x => x.TaiKhoan.Equals(id));

            if (string.IsNullOrWhiteSpace(collection["MatKhauCu"]))
            {
                ViewData["TrongMKCu"] = "Nhập mật khẩu cũ!";
            }
            else if (string.IsNullOrWhiteSpace(collection["MatKhauMoi"]))
            {
                ViewData["TrongMKMoi"] = "Nhập mật khẩu mới!";
            }
            else if (string.IsNullOrWhiteSpace(collection["MatKhauNhapLai"]))
            {
                ViewData["TrongMKNhapLai"] = "Nhập lại mật khẩu mới!";
            }
            else if (!collection["MatKhauCu"].Equals(nv.MatKhau))
            {
                ViewData["SaiMKCu"] = "Sai mật khẩu cũ!";
            }
            else if (collection["MatKhauMoi"].Equals(collection["MatKhauCu"]))
            {
                ViewData["TrungMKCu"] = "Trùng mật khẩu cũ!";
            }
            else if (!collection["MatKhauNhapLai"].Equals(collection["MatKhauMoi"]))
            {
                ViewData["KhacMKMoi"] = "Sai mật khẩu mới!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    nv.MatKhau = collection["MatKhauMoi"];
                    Session["NhanVien"] = nv;
                    db.SaveChanges();
                    return RedirectToAction("GetProfile", new { id = nv.TaiKhoan });
                }
            }
            return View(nv);
        }
    }
}