using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebChuyennganh.Models;

namespace WebChuyennganh.Areas.Admin.Controllers
{
    public class NhanViensController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Index()
        {
            var nhanViens = db.NhanViens.Include(n => n.Nhom);
            return View(nhanViens.ToList());
        }

        public ActionResult Details(string id)
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

        public ActionResult Create()
        {
            ViewBag.MaNhom = new SelectList(db.Nhoms, "MaNhom", "TenNhom");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TaiKhoan,MatKhau,HoTen,SoDT,DiaChi,NgaySinh,GioiTinh,MaNhom,TrangThai")] NhanVien nhanVien)
        {
            if (string.IsNullOrWhiteSpace(nhanVien.TaiKhoan))
            {
                ViewData["TrongTaiKhoan"] = "Vui lòng không để trống tài khoản!";
            }
            else if (string.IsNullOrWhiteSpace(nhanVien.MatKhau))
            {
                ViewData["TrongMatKhau"] = "Vui lòng không để trống mật khẩu!";
            }
            else if (string.IsNullOrWhiteSpace(nhanVien.HoTen))
            {
                ViewData["TrongHoTen"] = "Vui lòng không để trống họ tên!";
            }
            else if (string.IsNullOrEmpty(nhanVien.SoDT))
            {
                ViewData["TrongSoDT"] = "Vui lòng không để trống số điện thoại!";
            }
            else if (nhanVien.SoDT.Length > 10)
            {
                ViewData["SaiSoDT"] = "Số điện thoại chỉ chửa tối đa l0 ký tự!";
            }
            else if (string.IsNullOrWhiteSpace(nhanVien.DiaChi))
            {
                ViewData["TrongDiaChi"] = "Vui lòng không để trống địa chỉ!";
            }
            else if (string.IsNullOrEmpty(nhanVien.NgaySinh.ToShortDateString()))
            {
                ViewData["TrongNgaySinh"] = "Vui lòng chọn ngày sinh!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    db.NhanViens.Add(nhanVien);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            ViewBag.MaNhom = new SelectList(db.Nhoms, "MaNhom", "TenNhom", nhanVien.MaNhom);
            return View(nhanVien);
        }

        public ActionResult Edit(string id)
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
            ViewBag.MaNhom = new SelectList(db.Nhoms, "MaNhom", "TenNhom", nhanVien.MaNhom);
            return View(nhanVien);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TaiKhoan,MatKhau,HoTen,SoDT,DiaChi,NgaySinh,GioiTinh,MaNhom,TrangThai")] NhanVien nhanVien)
        {
            if (string.IsNullOrWhiteSpace(nhanVien.MatKhau))
            {
                ViewData["TrongMatKhau"] = "Vui lòng không để trống mật khẩu!";
            }
            else if (string.IsNullOrWhiteSpace(nhanVien.HoTen))
            {
                ViewData["TrongHoTen"] = "Vui lòng không để trống họ tên!";
            }
            else if (string.IsNullOrEmpty(nhanVien.SoDT))
            {
                ViewData["TrongSoDT"] = "Vui lòng không để trống số điện thoại!";
            }
            else if (nhanVien.SoDT.Length > 10)
            {
                ViewData["SaiSoDT"] = "Số điện thoại chỉ chửa tối đa l0 ký tự!";
            }
            else if (string.IsNullOrWhiteSpace(nhanVien.DiaChi))
            {
                ViewData["TrongDiaChi"] = "Vui lòng không để trống địa chỉ!";
            }
            else if (string.IsNullOrEmpty(nhanVien.NgaySinh.ToShortDateString()))
            {
                ViewData["TrongNgaySinh"] = "Vui lòng chọn ngày sinh!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    db.Entry(nhanVien).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            ViewBag.MaNhom = new SelectList(db.Nhoms, "MaNhom", "TenNhom", nhanVien.MaNhom);
            return View(nhanVien);
        }

        public ActionResult Delete(string id)
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

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            NhanVien nhanVien = db.NhanViens.Find(id);
            db.NhanViens.Remove(nhanVien);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
