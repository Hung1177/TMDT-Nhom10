using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication9.Admin.Models
{
    public class Sanpham
    {
        public int Masp { get; set; }
        public string Tensp { get; set; }
        public decimal Giatien { get; set; }
        public int Soluong { get; set; }
        public string Mota { get; set; }
        public int Mahang { get; set; }
        public string Tenhang { get; set; }
        public int Madongxe { get; set; }
        public string Tendongxe { get; set; }
        public string Anhbia { get; set; }
        public Sanpham()
        {
        }
        public Sanpham(int masp, string tensp, decimal giatien, int soluong, string mota, int mahang, string tenhang, int madongxe, string tendongxe, string anhbia)
        {
            Masp = masp;
            Tensp = tensp;
            Giatien = giatien;
            Soluong = soluong;
            Mota = mota;
            Mahang = mahang;
            Tenhang = tenhang;
            Madongxe = madongxe;
            Tendongxe = tendongxe;
            Anhbia = anhbia;
        }


    }
}