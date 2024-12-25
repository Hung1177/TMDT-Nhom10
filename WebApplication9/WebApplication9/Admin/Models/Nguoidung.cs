using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication9.Admin.Models
{
    public class Nguoidung
    {
        public int MaNguoiDung {  get; set; }
        public string Hoten {  get; set; }
        public string Email { get; set; }
        public string Dienthoai { get; set; }
        public string Matkhau { get; set; }
        public int IDQuyen { get; set; }
        public string Diachi { get; set; }
        public Nguoidung() { }
        public Nguoidung(int maNguoiDung, string hoten, string email, string dienthoai, string matkhau, int iDQuyen, string diachi)
        {
            MaNguoiDung = maNguoiDung;
            Hoten = hoten;
            Email = email;
            Dienthoai = dienthoai;
            Matkhau = matkhau;
            IDQuyen = iDQuyen;
            Diachi = diachi;
        }
    }
}