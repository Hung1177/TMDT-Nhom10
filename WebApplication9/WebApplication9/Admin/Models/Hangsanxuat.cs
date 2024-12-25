using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication9.Admin.Models
{
    public class Hangsanxuat
    {
        public int Mahang { get; set; }
        public string Tenhang { get; set; }
        public Hangsanxuat(int Mahang, string Tenhang)
        {
            this.Mahang = Mahang;
            this.Tenhang = Tenhang;
        }

        public Hangsanxuat()
        {
        }
    }
}