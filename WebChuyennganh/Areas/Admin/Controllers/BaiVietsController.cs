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
    public class BaiVietsController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Index()
        {
            var baiViets = db.BaiViets.Include(b => b.NhanVien).Include(b => b.NhanVien1);
            return View(baiViets.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaiViet baiViet = db.BaiViets.Find(id);
            if (baiViet == null)
            {
                return View("AdminError");
            }
            return View(baiViet);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "MaBV,TenTKDang,TenTKCapNhat,NgayDang,NgayCapNhat,HinhDD,TenBV,NoiDung")] BaiViet baiViet, HttpPostedFileBase fileUpload)
        {
            NhanVien nv = (NhanVien)Session["NhanVien"];

            if (string.IsNullOrWhiteSpace(baiViet.TenBV))
            {
                ViewData["TrongTenBV"] = "Vui lòng không để trống tiêu đề bài viết!";
            }
            else if (string.IsNullOrWhiteSpace(baiViet.NoiDung))
            {
                ViewData["TrongNoiDung"] = "Vui lòng không để trống nội dung bài viết!";
            }
            else if (fileUpload == null)
            {
                ViewData["TrongHinhDD"] = "Vui lòng chọn ảnh bìa!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/Images/BaiViet/"), fileName);
                    fileUpload.SaveAs(path);
                    baiViet.HinhDD = "/Assets/Images/BaiViet/" + fileName;
                    baiViet.TenTKDang = nv.TaiKhoan;
                    baiViet.TenTKCapNhat = nv.TaiKhoan;
                    baiViet.NgayDang = DateTime.Today;
                    baiViet.NgayCapNhat = DateTime.Today;
                    db.BaiViets.Add(baiViet);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return View(baiViet);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaiViet baiViet = db.BaiViets.Find(id);
            if (baiViet == null)
            {
                return View("AdminError");
            }
            return View(baiViet);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "MaBV,TenTKDang,TenTKCapNhat,NgayDang,NgayCapNhat,HinhDD,TenBV,NoiDung")] BaiViet baiViet, HttpPostedFileBase fileUpload)
        {
            NhanVien nv = (NhanVien)Session["NhanVien"];
            BaiViet bv = db.BaiViets.AsNoTracking().FirstOrDefault(x => x.MaBV.Equals(baiViet.MaBV));
            baiViet.TenTKDang = bv.TenTKDang;
            baiViet.NgayDang = bv.NgayDang;

            if (string.IsNullOrWhiteSpace(baiViet.TenBV))
            {
                ViewData["TrongTenBV"] = "Vui lòng không để trống tiêu đề bài viết!";
            }
            else if (string.IsNullOrWhiteSpace(baiViet.NoiDung))
            {
                ViewData["TrongNoiDung"] = "Vui lòng không để trống nội dung bài viết!";
            }
            else if (fileUpload == null)
            {
                ViewData["TrongHinhDD"] = "Vui lòng chọn ảnh bìa!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/Images/BaiViet/"), fileName);
                    fileUpload.SaveAs(path);
                    baiViet.HinhDD = "/Assets/Images/BaiViet/" + fileName;
                    baiViet.TenTKCapNhat = nv.TaiKhoan;
                    baiViet.NgayCapNhat = DateTime.Today;
                    db.Entry(baiViet).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return View(baiViet);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaiViet baiViet = db.BaiViets.Find(id);
            if (baiViet == null)
            {
                return View("AdminError");
            }
            return View(baiViet);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BaiViet baiViet = db.BaiViets.Find(id);
            db.BaiViets.Remove(baiViet);
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
