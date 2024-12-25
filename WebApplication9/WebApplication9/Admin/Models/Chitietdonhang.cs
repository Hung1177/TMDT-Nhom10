using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication9.Admin.Models
{
    public class Chitietdonhang
    {
        public int Madon {  get; set; }
        public int Masp {  get; set; }
        public int Soluong { get; set; }
        public decimal Donggia { get; set; }
        public Chitietdonhang() { }
    }
}