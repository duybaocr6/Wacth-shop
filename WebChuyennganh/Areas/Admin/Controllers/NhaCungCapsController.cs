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
    public class NhaCungCapsController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Index()
        {
            return View(db.NhaCungCaps.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaCungCap nhaCungCap = db.NhaCungCaps.Find(id);
            if (nhaCungCap == null)
            {
                return View("AdminError");
            }
            return View(nhaCungCap);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNCC,TenNCC,DiaChi,SoDT")] NhaCungCap nhaCungCap)
        {
            if (string.IsNullOrWhiteSpace(nhaCungCap.TenNCC))
            {
                ViewData["TrongTenNCC"] = "Vui lòng không để trống tên nhà cung cấp!";
            }
            else if (!string.IsNullOrEmpty(nhaCungCap.SoDT))
            {
                if (nhaCungCap.SoDT.Length > 10)
                {
                    ViewData["SaiSoDT"] = "Số điện thoại chỉ chứa tối đa 10 ký tự!";
                }
            }
            else
            {
                if (ModelState.IsValid)
                {
                    db.NhaCungCaps.Add(nhaCungCap);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return View(nhaCungCap);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaCungCap nhaCungCap = db.NhaCungCaps.Find(id);
            if (nhaCungCap == null)
            {
                return View("AdminError");
            }
            return View(nhaCungCap);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNCC,TenNCC,DiaChi,SoDT")] NhaCungCap nhaCungCap)
        {
            if (string.IsNullOrWhiteSpace(nhaCungCap.TenNCC))
            {
                ViewData["TrongTenNCC"] = "Vui lòng không để trống tên nhà cung cấp!";
            }
            else if (!string.IsNullOrEmpty(nhaCungCap.SoDT))
            {
                if (nhaCungCap.SoDT.Length > 10)
                {
                    ViewData["SaiSoDT"] = "Số điện thoại chỉ chứa tối đa 10 ký tự!";
                }
            }
            else
            {
                if (ModelState.IsValid)
                {
                    db.Entry(nhaCungCap).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return View(nhaCungCap);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaCungCap nhaCungCap = db.NhaCungCaps.Find(id);
            if (nhaCungCap == null)
            {
                return View("AdminError");
            }
            return View(nhaCungCap);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NhaCungCap nhaCungCap = db.NhaCungCaps.Find(id);
            db.NhaCungCaps.Remove(nhaCungCap);
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
