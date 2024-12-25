using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication9.Admin.Models
{
    public class Donhang
    {
        public int Madon {  get; set; }
        public DateTime Ngaydat { get; set; }
        public int Tinhtrang { get; set; }
        public string TenTrangThai { get; set; }
        public int MaNguoidung {  get; set; }
        public string Hoten { get; set; }
        public Donhang() { }
        public Donhang(int madon, DateTime ngaydat, int tinhtrang,string tentrangthai, int maNguoidung, string hoten)
        {
            Madon = madon;
            Ngaydat = ngaydat;
            Tinhtrang = tinhtrang;
            TenTrangThai = tentrangthai;
            MaNguoidung = maNguoidung;
            Hoten = hoten;
        }
    }
}