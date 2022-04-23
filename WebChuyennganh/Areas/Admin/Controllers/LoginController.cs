using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebChuyennganh.Models;

namespace WebChuyennganh.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(NhanVien obj)
        {
            var acc = obj.TaiKhoan;
            var pass = obj.MatKhau;

            if (string.IsNullOrWhiteSpace(acc) || string.IsNullOrWhiteSpace(pass))
            {
                ViewBag.Thongbao = "Xin hãy nhập đủ thông tin đăng nhập!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    NhanVien nv = db.NhanViens.SingleOrDefault(x => x.TaiKhoan.Equals(acc) && x.MatKhau.Equals(pass));
                    if (nv != null)
                    {
                        if (nv.TrangThai)
                        {
                            Session["NhanVien"] = nv;
                            return RedirectToAction("Index", "Main");
                        }
                        else
                        {
                            ViewBag.Thongbao = "Tài khoản của bạn đã bị khóa!";
                        }
                    }
                    else
                    {
                        ViewBag.Thongbao = "Sai thông tin đăng nhập!";
                    }
                }
            }
            return View(obj);
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}