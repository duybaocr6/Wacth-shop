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
    public class ThuongHieuxController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Index()
        {
            return View(db.ThuongHieux.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThuongHieu thuongHieu = db.ThuongHieux.Find(id);
            if (thuongHieu == null)
            {
                return View("AdminError");
            }
            return View(thuongHieu);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaTH,TenTH,HinhDD")] ThuongHieu thuongHieu, HttpPostedFileBase fileUpload)
        {
            if (string.IsNullOrWhiteSpace(thuongHieu.TenTH))
            {
                ViewData["TrongTenTH"] = "Vui lòng không để trống tên thương hiệu!";
            }
            else if (fileUpload == null)
            {
                ViewData["TrongHinhDD"] = "Vui lòng chọn ảnh logo!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/Images/ThuongHieu/"), fileName);
                    fileUpload.SaveAs(path);
                    thuongHieu.HinhDD = "/Assets/Images/ThuongHieu/" + fileName;
                    db.ThuongHieux.Add(thuongHieu);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return View(thuongHieu);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThuongHieu thuongHieu = db.ThuongHieux.Find(id);
            if (thuongHieu == null)
            {
                return View("AdminError");
            }
            return View(thuongHieu);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTH,TenTH,HinhDD")] ThuongHieu thuongHieu, HttpPostedFileBase fileUpload)
        {
            if (string.IsNullOrWhiteSpace(thuongHieu.TenTH))
            {
                ViewData["TrongTenTH"] = "Vui lòng không để trống tên thương hiệu!";
            }
            else if (fileUpload == null)
            {
                ViewData["TrongHinhDD"] = "Vui lòng chọn ảnh logo!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/Images/ThuongHieu/"), fileName);
                    fileUpload.SaveAs(path);
                    thuongHieu.HinhDD = "/Assets/Images/ThuongHieu/" + fileName;
                    db.Entry(thuongHieu).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return View(thuongHieu);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThuongHieu thuongHieu = db.ThuongHieux.Find(id);
            if (thuongHieu == null)
            {
                return View("AdminError");
            }
            return View(thuongHieu);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ThuongHieu thuongHieu = db.ThuongHieux.Find(id);
            db.ThuongHieux.Remove(thuongHieu);
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
