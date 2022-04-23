using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebChuyennganh.Models;
namespace WebChuyennganh.Controllers
{
    public class UserController : Controller
    {
        db_BanDongHoEntities5 nd = new db_BanDongHoEntities5();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Resgister()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Resgister(FormCollection collection, KhachHang kh)
        { 
            var hoten = collection["HoTen"];
            var taikhoan = collection["TaiKhoankh"];
            var matkhau = collection["MatKhaukh"];
            var nhaplaimatkhau = collection["NhapLaiMatKhaukh"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["NgaySinh"]);
            var email = collection["Email"];
            var dienthoai = collection["SoDT"];
            var diachi = collection["DiaChi"];
            var gt = collection["GioiTinh"]; 
            var trangthai = collection["TrangThai"];
            if (String.IsNullOrEmpty(hoten))
            {  
                ViewData["Loi2"] = "Họ Tên không được để trống";
            }
            else if (String.IsNullOrEmpty(taikhoan))
            {
                ViewData["Loi3"] = "Vui lòng nhập tài khoản";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi4"] = "Vui lòng nhập mật khẩu";
            }
            else if (String.IsNullOrEmpty(nhaplaimatkhau))
            {
                ViewData["Loi5"] = "Vui lòng nhập lại mật khẩu";
            }
            else if (String.IsNullOrEmpty(ngaysinh))
            {
                ViewData["Loi6"] = "Vui lòng chọn ngày sinh";
            }
            else if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi7"] = "Vui lòng nhập điện thoại";
            }
            else if (String.IsNullOrEmpty(gt))
            {
                ViewData["Loi8"] = "Vui lòng nhập giới tính";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi10"] = "Email không được bỏ trống";
            }
            else
            {
                kh.HoTen = hoten;
                kh.TaiKhoan = taikhoan;
                kh.MatKhau= matkhau;
                kh.NgaySinh = DateTime.Parse(ngaysinh);
                kh.SoDT = dienthoai;
                kh.GioiTinh = Boolean.Parse(gt);
                kh.DiaChi = diachi;
                kh.TrangThai = true;
                kh.NgayTao = DateTime.Today;
                kh.Email = email;
                nd.KhachHangs.Add(kh);
                nd.SaveChanges();
                return RedirectToAction("Login","User");
            }
            return this.Resgister();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                KhachHang kh = nd.KhachHangs.SingleOrDefault(x => x.TaiKhoan == tendn && x.MatKhau == matkhau);
                if (kh != null)
                {
                    // ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoan"] = kh;
                    return RedirectToAction("Index", "Home");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
    }
}