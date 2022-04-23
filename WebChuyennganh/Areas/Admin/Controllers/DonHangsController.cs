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
    public class DonHangsController : Controller
    {
        private db_BanDongHoEntities5 db = new db_BanDongHoEntities5();

        public ActionResult Index()
        {
            var donHangs = db.DonHangs.Include(d => d.KhachHang).Include(d => d.NhanVien).Include(d => d.TrangThai);
            return View(donHangs.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donHang = db.DonHangs.Find(id);
            if (donHang == null)
            {
                return View("AdminError");
            }
            return View(donHang);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donHang = db.DonHangs.Find(id);
            if (donHang == null)
            {
                return View("AdminError");
            }
            // Nếu đơn hàng đã bị hủy thì không cho chỉnh sửa
            if (donHang.MaTT == 5)
            {
                TempData["message"] = "<script>alert('Đơn hàng đã bị hủy nên không được phép chỉnh sửa!');</script>";
                return RedirectToAction("Index");
            }
            ViewBag.MaTT = new SelectList(db.TrangThais, "MaTT", "TenTT", donHang.MaTT);
            return View(donHang);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SoDH,TaiKhoanKH,TaiKhoanNV,NgayDat,NgayGiao,SoDT,DiaChi,TongSoMua,ThanhToan,GhiChu,MaTT")] DonHang donHang)
        {
            NhanVien nv = (NhanVien)Session["NhanVien"];
            DonHang dh = db.DonHangs.AsNoTracking().SingleOrDefault(x => x.SoDH.Equals(donHang.SoDH));

            if (donHang.MaTT == 4 && donHang.NgayGiao == null) // Nếu đơn hàng đã giao thành công thì phải nhập ngày giao
            {
                ViewData["TrongNgayGiao"] = "Vui lòng chọn ngày giao!";
            }
            else if (donHang.MaTT == 4 && donHang.NgayGiao < dh.NgayDat) // Nếu ngày giao trước ngày đặt thì không hợp lệ
            {
                ViewData["SaiNgayGiao"] = "Ngày giao không hợp lệ!";
            }
            else if (ModelState.IsValid)
            {
                if (donHang.MaTT == 4) // Chỉ lưu ngày giao khi trạng thái là giao hàng thành công, còn lại thì null
                {
                    dh.NgayGiao = donHang.NgayGiao;
                }
                if (donHang.MaTT == 5) // Nếu đơn hàng bị hủy thì phải cộng lại cho cột số lượng có MaDH tương ứng trong bảng DongHo
                {
                    IQueryable<CTDonHang> list = db.CTDonHangs.Where(x => x.SoDH.Equals(donHang.SoDH));
                    if (list.Any()) // Nếu list có bất kì phần tử nào thì tiến hành cập nhật
                    {
                        foreach (var item in list)
                        {
                            DongHo dongHo = db.DongHoes.SingleOrDefault(x => x.MaDH.Equals(item.MaDH));
                            dongHo.SoLuong += item.SoLuong;
                            dongHo.TenTKCapNhat = nv.TaiKhoan;
                            dongHo.NgayCapNhat = DateTime.Today;
                        }
                    }
                }
                dh.TaiKhoanNV = nv.TaiKhoan;
                dh.MaTT = donHang.MaTT;
                db.Entry(dh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaTT = new SelectList(db.TrangThais, "MaTT", "TenTT", donHang.MaTT);
            return View(dh);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donHang = db.DonHangs.Find(id);
            if (donHang == null)
            {
                return View("AdminError");
            }
            return View(donHang);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            // Trước khi xóa một đơn hàng thì cần xóa các chi tiết đơn hàng có SoDH tương ứng trước
            // list chứa các Chi tiết đơn hàng có SoDH tương ứng trước
            IQueryable<CTDonHang> list = db.CTDonHangs.Where(x => x.SoDH.Equals(id));
            if (list.Any()) // Nếu list có bất kì phần tử nào thì tiến hành xóa 
            {
                foreach (var item in list)
                {
                    db.CTDonHangs.Remove(item);
                }
            }
            DonHang donHang = db.DonHangs.Find(id);
            db.DonHangs.Remove(donHang);
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
