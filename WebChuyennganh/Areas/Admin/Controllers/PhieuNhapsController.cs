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
    public class PhieuNhapsController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Index()
        {
            var phieuNhaps = db.PhieuNhaps.Include(p => p.NhaCungCap).Include(p => p.NhanVien);
            return View(phieuNhaps.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuNhap phieuNhap = db.PhieuNhaps.Find(id);
            if (phieuNhap == null)
            {
                return View("AdminError");
            }
            return View(phieuNhap);
        }

        public ActionResult Create()
        {
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SoPN,MaNCC,TenTKLap,TenTKCapNhat,NgayNhap,NgayCapNhat,TongSoNhap,ThanhToan")] PhieuNhap phieuNhap)
        {
            NhanVien nv = (NhanVien)Session["NhanVien"];

            if (ModelState.IsValid)
            {
                phieuNhap.TenTKLap = nv.TaiKhoan;
                phieuNhap.TenTKCapNhat = nv.TaiKhoan;
                phieuNhap.NgayNhap = DateTime.Today;
                phieuNhap.NgayCapNhat = DateTime.Today;
                phieuNhap.TongSoNhap = 0; // vì lập phiếu mới nên tổng số nhập sẽ mặc định bằng 0, khi thêm mới 1 chi tiết phiếu nhập sẽ tự động cập nhật lại
                phieuNhap.ThanhToan = 0; // vì lập phiếu mới nên thanh toán sẽ mặc định bằng 0, khi thêm mới 1 chi tiết phiếu nhập sẽ tự động cập nhật lại
                db.PhieuNhaps.Add(phieuNhap);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC", phieuNhap.MaNCC);
            return View(phieuNhap);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuNhap phieuNhap = db.PhieuNhaps.Find(id);
            if (phieuNhap == null)
            {
                return View("AdminError");
            }
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC", phieuNhap.MaNCC);
            return View(phieuNhap);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SoPN,MaNCC,TenTKLap,TenTKCapNhat,NgayNhap,NgayCapNhat,TongSoNhap,ThanhToan")] PhieuNhap phieuNhap)
        {
            NhanVien nv = (NhanVien)Session["NhanVien"];
            PhieuNhap pn = db.PhieuNhaps.AsNoTracking().FirstOrDefault(x => x.SoPN.Equals(phieuNhap.SoPN));
            phieuNhap.TenTKLap = pn.TenTKLap;
            phieuNhap.NgayNhap = pn.NgayNhap;
            phieuNhap.TongSoNhap = pn.TongSoNhap;
            phieuNhap.ThanhToan = pn.ThanhToan;

            if (ModelState.IsValid)
            {
                phieuNhap.TenTKCapNhat = nv.TaiKhoan;
                phieuNhap.NgayCapNhat = DateTime.Today;
                db.Entry(phieuNhap).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC", phieuNhap.MaNCC);
            return View(phieuNhap);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuNhap phieuNhap = db.PhieuNhaps.Find(id);
            if (phieuNhap == null)
            {
                return View("AdminError");
            }
            return View(phieuNhap);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            // Trước khi xóa một phiếu nhập thì cần xóa các chi tiết phiếu nhập có SoPN tương ứng trước
            // list chứa các Chi tiết phiếu nhập có SoPN tương ứng trước
            IQueryable<CTPhieuNhap> list = db.CTPhieuNhaps.Where(x => x.SoPN.Equals(id));
            if (list.Any()) // Nếu list có bất kì phần tử nào thì tiến hành xóa 
            {
                foreach (var item in list)
                {
                    db.CTPhieuNhaps.Remove(item);
                }
            }
            PhieuNhap phieuNhap = db.PhieuNhaps.Find(id);
            db.PhieuNhaps.Remove(phieuNhap);
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
