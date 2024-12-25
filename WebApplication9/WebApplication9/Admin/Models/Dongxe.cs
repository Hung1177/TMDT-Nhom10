using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication9.Admin.Models
{
    public class Dongxe
    {
        public int Madongxe { get; set; }
        public string Tendongxe { get; set; }
        public Dongxe(int Madongxe, string Tendongxe)
        {
            this.Madongxe = Madongxe;
            this.Tendongxe = Tendongxe;
        }

        public Dongxe()
        {
        }
    }
}