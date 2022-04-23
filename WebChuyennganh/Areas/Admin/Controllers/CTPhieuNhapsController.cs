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
    public class CTPhieuNhapsController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Index()
        {
            var cTPhieuNhaps = db.CTPhieuNhaps.Include(c => c.DongHo).Include(c => c.PhieuNhap);
            return View(cTPhieuNhaps.ToList());
        }

        public ActionResult Details(int? id1, string id2)
        {
            if (id1 == null || string.IsNullOrEmpty(id2))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTPhieuNhap cTPhieuNhap = db.CTPhieuNhaps.Find(id1, id2);
            if (cTPhieuNhap == null)
            {
                return View("AdminError");
            }
            return View(cTPhieuNhap);
        }

        public ActionResult Create(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTPhieuNhap cTPhieuNhap = new CTPhieuNhap();
            PhieuNhap phieuNhap = db.PhieuNhaps.Find(id);
            if (phieuNhap == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDH = new SelectList(db.DongHoes, "MaDH", "MaDH");
            cTPhieuNhap.SoPN = phieuNhap.SoPN;
            return View(cTPhieuNhap);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SoPN,MaDH,SoLuong,GiaTien,ThanhTien")] CTPhieuNhap cTPhieuNhap, int id)
        {
            NhanVien nv = (NhanVien)Session["NhanVien"];
            CTPhieuNhap ct = db.CTPhieuNhaps.SingleOrDefault(x => x.SoPN.Equals(id) && x.MaDH.Equals(cTPhieuNhap.MaDH));

            if (ct != null)
            {
                ViewData["TrungKhoaChinh"] = "Chi tiết phiếu nhập này đã tồn tại trong bảng!";
            }
            else if (string.IsNullOrEmpty(cTPhieuNhap.SoLuong.ToString()))
            {
                ViewData["TrongSoLuong"] = "Vui lòng không để trống số lượng!";
            }
            else if (string.IsNullOrEmpty(cTPhieuNhap.GiaTien.ToString()))
            {
                ViewData["TrongGiaTien"] = "Vui lòng không để trống giá tiền!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    cTPhieuNhap.SoPN = id;
                    cTPhieuNhap.ThanhTien = cTPhieuNhap.SoLuong * cTPhieuNhap.GiaTien;
                    db.CTPhieuNhaps.Add(cTPhieuNhap);
                    PhieuNhap pn = db.PhieuNhaps.SingleOrDefault(x => x.SoPN.Equals(cTPhieuNhap.SoPN));
                    // sau khi thêm mới 1 chi tiết phiếu nhập thì cập nhật lại cột tống số nhập ở bảng PhieuNhap có SoPN tương ứng
                    pn.TongSoNhap += cTPhieuNhap.SoLuong;
                    // sau khi thêm mới 1 chi tiết phiếu nhập thì cập nhật lại cột thanh toán ở bảng PhieuNhap có SoPN tương ứng
                    pn.ThanhToan += cTPhieuNhap.ThanhTien;
                    pn.TenTKCapNhat = nv.TaiKhoan;
                    pn.NgayCapNhat = DateTime.Today;
                    DongHo dh = db.DongHoes.SingleOrDefault(x => x.MaDH.Equals(cTPhieuNhap.MaDH));
                    // sau khi thêm mới 1 chi tiết phiếu nhập thì cập nhật lại cột số lượng ở bảng DongHo có MaDH tương ứng
                    dh.SoLuong += cTPhieuNhap.SoLuong;
                    dh.TenTKCapNhat = nv.TaiKhoan;
                    dh.NgayCapNhat = DateTime.Today;
                    db.SaveChanges();
                    return RedirectToAction("Index", "PhieuNhaps");
                }
            }
            ViewBag.MaDH = new SelectList(db.DongHoes, "MaDH", "MaDH", cTPhieuNhap.MaDH);
            return View(cTPhieuNhap);
        }

        public ActionResult Edit(int? id1, string id2)
        {
            if (id1 == null || string.IsNullOrEmpty(id2))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTPhieuNhap cTPhieuNhap = db.CTPhieuNhaps.Find(id1, id2);
            if (cTPhieuNhap == null)
            {
                return View("AdminError");
            }
            return View(cTPhieuNhap);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SoPN,MaDH,SoLuong,GiaTien,ThanhTien")] CTPhieuNhap cTPhieuNhap, int id1, string id2)
        {
            NhanVien nv = (NhanVien)Session["NhanVien"];
            CTPhieuNhap ct = db.CTPhieuNhaps.AsNoTracking().SingleOrDefault(x => x.SoPN.Equals(id1) && x.MaDH.Equals(id2));
            cTPhieuNhap.SoPN = ct.SoPN;
            cTPhieuNhap.MaDH = ct.MaDH;

            if(string.IsNullOrEmpty(cTPhieuNhap.SoLuong.ToString()))
            {
                ViewData["TrongSoLuong"] = "Vui lòng không để trống số lượng!";
            }
            else if (string.IsNullOrEmpty(cTPhieuNhap.GiaTien.ToString()))
            {
                ViewData["TrongGiaTien"] = "Vui lòng không để trống giá tiền!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    cTPhieuNhap.ThanhTien = cTPhieuNhap.SoLuong * cTPhieuNhap.GiaTien;
                    db.Entry(cTPhieuNhap).State = EntityState.Modified;
                    int diff = ct.SoLuong - cTPhieuNhap.SoLuong;
                    PhieuNhap pn = db.PhieuNhaps.SingleOrDefault(x => x.SoPN.Equals(id1));
                    DongHo dh = db.DongHoes.SingleOrDefault(x => x.MaDH.Equals(id2));
                    // Sau khi cập nhật 1 chi tiết phiếu nhập thì cập nhật lại cột tống số nhập và cột thanh toán ở bảng PhieuNhap có SoPN tương ứng
                    // Sau khi cập nhật cột số lượng của 1 chi tiết phiếu nhập thì cập nhật lại cột số lượng ở bảng DongHo có MaDH tương ứng
                    // Nếu không có sự thay dổi về số lượng thì bỏ qua
                    if (ct.SoLuong > cTPhieuNhap.SoLuong)
                    {
                        pn.TongSoNhap -= diff;
                        pn.ThanhToan -= diff * cTPhieuNhap.GiaTien;
                        pn.TenTKCapNhat = nv.TaiKhoan;
                        pn.NgayCapNhat = DateTime.Today;
                        dh.SoLuong -= diff;
                        dh.TenTKCapNhat = nv.TaiKhoan;
                        dh.NgayCapNhat = DateTime.Today;
                    }
                    else if (ct.SoLuong < cTPhieuNhap.SoLuong)
                    {
                        pn.TongSoNhap += Math.Abs(diff);
                        pn.ThanhToan += Math.Abs(diff) * cTPhieuNhap.GiaTien;
                        pn.TenTKCapNhat = nv.TaiKhoan;
                        pn.NgayCapNhat = DateTime.Today;
                        dh.SoLuong += Math.Abs(diff);
                        dh.TenTKCapNhat = nv.TaiKhoan;
                        dh.NgayCapNhat = DateTime.Today;
                    }
                    db.SaveChanges();
                    return RedirectToAction("Edit", "PhieuNhaps", new { id = id1 });
                }
            }
            return View(cTPhieuNhap);
        }

        public ActionResult Delete(int? id1, string id2)
        {
            if (id1 == null || string.IsNullOrEmpty(id2))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTPhieuNhap cTPhieuNhap = db.CTPhieuNhaps.Find(id1, id2);
            if (cTPhieuNhap == null)
            {
                return View("AdminError");
            }
            return View(cTPhieuNhap);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id1, string id2)
        {
            CTPhieuNhap cTPhieuNhap = db.CTPhieuNhaps.Find(id1, id2);
            db.CTPhieuNhaps.Remove(cTPhieuNhap);
            db.SaveChanges();
            return RedirectToAction("Edit", "PhieuNhaps", new { id = id1 });
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
