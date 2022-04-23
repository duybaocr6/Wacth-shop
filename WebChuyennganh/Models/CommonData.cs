using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebChuyennganh.Models
{
    public class CommonData
    {
        private db_BanDongHoEntities5 dc;
        public CommonData()
        {
            this.dc = new db_BanDongHoEntities5();
        }
       public IEnumerable<ThuongHieu> NhomTH
        {
            get
            {
                return this.dc.ThuongHieux;
            }
        }
        public IEnumerable<ThuongHieu> hinhTH(int n)
        {
            return dc.ThuongHieux.OrderByDescending(x => x.HinhDD).Take(n);
        }
        public IEnumerable<DongHo> NhomDH
        {
            get
            {
                return this.dc.DongHoes;
            }
        }
        public IEnumerable<DongHo> hinhDH(int n)
        {
            return dc.DongHoes.OrderByDescending(x => x.HinhDD).Take(n);
        }
        public IEnumerable<BaiViet> NhomBV
        {
            get
            {
                return this.dc.BaiViets;
            }
        }
        public IEnumerable<BaiViet> hinhbv(int n)
        {
            return dc.BaiViets.OrderByDescending(x => x.HinhDD).Take(n);
        }
    }
}