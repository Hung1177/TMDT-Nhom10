using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication9.Admin.Models
{
    public class Trangthai
    {
        public int Tinhtrang {  get; set; }
        public string TenTrangThai { get; set; }
        public Trangthai() { }
        public Trangthai(int tinhtrang, string tenTrangThai)
        {
            Tinhtrang = tinhtrang;
            TenTrangThai = tenTrangThai;
        }
    }
}