using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication9.Admin.Models
{
    public class PhanQuyen
    {
        public int IDQuyen { get; set; }
        public string TenQuyen { get; set; }
        public PhanQuyen() { }
        public PhanQuyen(int iDQuyen, string tenQuyen)
        {
            IDQuyen = iDQuyen;
            TenQuyen = tenQuyen;
        }
    }
}