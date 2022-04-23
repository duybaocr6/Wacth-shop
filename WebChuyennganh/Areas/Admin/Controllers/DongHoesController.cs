using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebChuyennganh.Models;

namespace WebChuyennganh.Areas.Admin.Controllers
{
    public class DongHoesController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Index()
        {
            var dongHoes = db.DongHoes.Include(d => d.NhanVien).Include(d => d.NhanVien1).Include(d => d.ThuongHieu);
            return View(dongHoes.ToList());
        }

        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DongHo dongHo = db.DongHoes.Find(id);
            if (dongHo == null)
            {
                return View("AdminError");
            }
            return View(dongHo);
        }

        public ActionResult Create()
        {
            ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenTH");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "MaDH,MaTH,NguonGoc,KieuMay,KichCo,DoDay,ChatLieuVo,ChatLieuDay,ChatLieuKinh,DoChiuNuoc,ChucNangKhac,GioiTinh,HinhDD,SoLuong,MoTaCT,GiaBan,GiamGia,BaoHanh,TenTKDang,TenTKCapNhat,NgayDang,NgayCapNhat")] DongHo dongHo, HttpPostedFileBase fileUpload)
        {
            NhanVien nv = (NhanVien)Session["NhanVien"];

            if (string.IsNullOrWhiteSpace(dongHo.MaDH))
            {
                ViewData["TrongMaDH"] = "Vui lòng không để trống mã đồng hồ!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.NguonGoc))
            {
                ViewData["TrongNguonGoc"] = "Vui lòng không để trống nguồn gốc!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.KieuMay))
            {
                ViewData["TrongKieuMay"] = "Vui lòng không để trống kiểu máy!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.ChatLieuVo))
            {
                ViewData["TrongChatLieuVo"] = "Vui lòng không để trống chất liệu vỏ!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.ChatLieuDay))
            {
                ViewData["TrongChatLieuDay"] = "Vui lòng không để trống chất liệu dây!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.ChatLieuKinh))
            {
                ViewData["TrongChatLieuKinh"] = "Vui lòng không để trống chất liệu kính!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.DoChiuNuoc))
            {
                ViewData["TrongDoChiuNuoc"] = "Vui lòng không để trống độ chịu nước!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.BaoHanh))
            {
                ViewData["TrongBaoHanh"] = "Vui lòng không để trống bảo hành!";
            }
            else if (fileUpload == null)
            {
                ViewData["TrongHinhDD"] = "Vui lòng chọn ảnh đại diện!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/Images/DongHo/"), fileName);
                    fileUpload.SaveAs(path);
                    dongHo.HinhDD = "/Assets/Images/DongHo/" + fileName;
                    dongHo.SoLuong = 0;
                    dongHo.TenTKDang = nv.TaiKhoan;
                    dongHo.TenTKCapNhat = nv.TaiKhoan;
                    dongHo.NgayDang = DateTime.Today;
                    dongHo.NgayCapNhat = DateTime.Today;
                    db.DongHoes.Add(dongHo);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenTH", dongHo.MaTH);
            return View(dongHo);
        }

        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DongHo dongHo = db.DongHoes.Find(id);
            if (dongHo == null)
            {
                return View("AdminError");
            }
            ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenTH", dongHo.MaTH);
            return View(dongHo);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "MaDH,MaTH,NguonGoc,KieuMay,KichCo,DoDay,ChatLieuVo,ChatLieuDay,ChatLieuKinh,DoChiuNuoc,ChucNangKhac,GioiTinh,HinhDD,SoLuong,MoTaCT,GiaBan,GiamGia,BaoHanh,TenTKDang,TenTKCapNhat,NgayDang,NgayCapNhat")] DongHo dongHo, HttpPostedFileBase fileUpload)
        {
            NhanVien nv = (NhanVien)Session["NhanVien"];
            DongHo dh = db.DongHoes.AsNoTracking().FirstOrDefault(x => x.MaDH.Equals(dongHo.MaDH));
            dongHo.TenTKDang = dh.TenTKDang;
            dongHo.NgayDang = dh.NgayDang;

            if (string.IsNullOrWhiteSpace(dongHo.NguonGoc))
            {
                ViewData["TrongNguonGoc"] = "Vui lòng không để trống nguồn gốc!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.KieuMay))
            {
                ViewData["TrongKieuMay"] = "Vui lòng không để trống kiểu máy!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.ChatLieuVo))
            {
                ViewData["TrongChatLieuVo"] = "Vui lòng không để trống chất liệu vỏ!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.ChatLieuDay))
            {
                ViewData["TrongChatLieuDay"] = "Vui lòng không để trống chất liệu dây!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.ChatLieuKinh))
            {
                ViewData["TrongChatLieuKinh"] = "Vui lòng không để trống chất liệu kính!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.DoChiuNuoc))
            {
                ViewData["TrongDoChiuNuoc"] = "Vui lòng không để trống độ chịu nước!";
            }
            else if (string.IsNullOrEmpty(dongHo.SoLuong.ToString()))
            {
                ViewData["TrongSoLuong"] = "Vui lòng không để trống số lượng!";
            }
            else if (string.IsNullOrWhiteSpace(dongHo.BaoHanh))
            {
                ViewData["TrongBaoHanh"] = "Vui lòng không để trống bảo hành!";
            }
            else if (fileUpload == null)
            {
                ViewData["TrongHinhDD"] = "Vui lòng chọn ảnh đại diện!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/Images/DongHo/"), fileName);
                    fileUpload.SaveAs(path);
                    dongHo.HinhDD = "/Assets/Images/DongHo/" + fileName;
                    dongHo.TenTKCapNhat = nv.TaiKhoan;
                    dongHo.NgayCapNhat = DateTime.Today;
                    db.Entry(dongHo).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            ViewBag.MaTH = new SelectList(db.ThuongHieux, "MaTH", "TenTH", dongHo.MaTH);
            return View(dongHo);
        }

        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DongHo dongHo = db.DongHoes.Find(id);
            if (dongHo == null)
            {
                return View("AdminError");
            }
            return View(dongHo);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            DongHo dongHo = db.DongHoes.Find(id);
            db.DongHoes.Remove(dongHo);
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
