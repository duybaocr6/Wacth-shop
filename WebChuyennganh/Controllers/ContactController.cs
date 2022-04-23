using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebChuyennganh.Models;
namespace WebChuyennganh.Controllers
{
    public class ContactController : Controller
    {
        db_BanDongHoEntities5 dh = new db_BanDongHoEntities5();
        // GET: Contact
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Contact(FormCollection collection, PhanHoi ph )
        {
            var hoten = collection["HoTen"];
            var email = collection["Email"];
            var chude = collection["ChuDe"];
            var noidung = collection["NoiDung"];
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi2"] = "Họ Tên không được để trống";
            }
            else if (String.IsNullOrEmpty(chude))
            {
                ViewData["Loi3"] = "Vui lòng nhập chủ đề";
            }
            else if (String.IsNullOrEmpty(noidung))
            {
                ViewData["Loi4"] = "Vui lòng nhập nội dung";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "Email không được bỏ trống";
            }
            else
            {
                ph.HoTen = hoten;
                ph.ChuDe= chude;
                ph.NoiDung= noidung;
                ph.Email = email;
                ph.TrangThai = false;
                dh.PhanHois.Add(ph);
                dh.SaveChanges();
            }
            return this.Contact();
        }
    }
}