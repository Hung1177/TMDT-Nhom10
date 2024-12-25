using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace WebApplication9.Admin.Controllers
{
    public class Analytics
    {
        // Chỉ cần 1 kết nối dùng chung trong tất cả các phương thức
        private static string connectionString = @"Data Source=LEGION5;Initial Catalog=QLoto1;User ID=sa;Password=123456;";

        // Phương thức thống kê đơn hàng theo tháng
        public static List<dynamic> ThongKeDonHangTheoThang()
        {
            string query = @"
                SELECT MONTH(Ngaydat) AS Thang, COUNT(*) AS SoDonHang
                FROM Donhang
                GROUP BY MONTH(Ngaydat)
                ORDER BY Thang";
            List<dynamic> data = new List<dynamic>();

            using (SqlConnection analy = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, analy);
                try
                {
                    analy.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        data.Add(new { Thang = reader.GetInt32(0), SoDonHang = reader.GetInt32(1) });
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return data;
        }

        // Phương thức thống kê lợi nhuận theo tháng
        public static List<dynamic> ThongKeLoiNhuanTheoThang()
        {
            string query = @"
                SELECT MONTH(dh.Ngaydat) AS Thang, SUM(ct.Dongia) AS LoiNhuan
                FROM Donhang dh
                INNER JOIN Chitietdonhang ct ON dh.Madon = ct.Madon
                GROUP BY MONTH(dh.Ngaydat)
                ORDER BY Thang";
            List<dynamic> data = new List<dynamic>();

            using (SqlConnection analy = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, analy);
                try
                {
                    analy.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        data.Add(new { Thang = reader.GetInt32(0), LoiNhuan = reader.GetDecimal(1) });
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return data;
        }

        // Phương thức thống kê sản phẩm bán chạy nhất
        public static List<dynamic> SanPhamBanChayNhat()
        {
            string query = @"
                SELECT TOP 5 ct.Masp, COUNT(*) AS SoLuongBan
                FROM Chitietdonhang ct
                GROUP BY ct.Masp
                ORDER BY SoLuongBan DESC";
            List<dynamic> data = new List<dynamic>();

            using (SqlConnection analy = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, analy);
                try
                {
                    analy.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        data.Add(new { Masp = reader.GetInt32(0), SoLuongBan = reader.GetInt32(1) });
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return data;
        }

        // Phương thức thống kê tình trạng đơn hàng
        public static List<dynamic> TinhTrangDonHang()
        {
            string query = @"
                SELECT Tinhtrang, COUNT(*) AS SoLuong
                FROM Donhang
                GROUP BY Tinhtrang";
            List<dynamic> data = new List<dynamic>();

            using (SqlConnection analy = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, analy);
                try
                {
                    analy.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        data.Add(new { Tinhtrang = reader.GetString(0), SoLuong = reader.GetInt32(1) });
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return data;
        }

        
    }
}
