using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebChuyennganh.Models;

namespace WebChuyennganh.Controllers
{
    public class SingleController : Controller
    {
        db_BanDongHoEntities5 data = new db_BanDongHoEntities5();
        // GET: Single
        public ActionResult Index(string id)
        {
            var dongho = from s in data.DongHoes
                         where s.MaDH == id
                         select s;
            return View(dongho.Single());
        }
    }
}