using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication9.Admin.Models;
using WebApplication9.Admin.Views;

namespace WebApplication9.User.Views
{
    public partial class ShopOto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Lấy danh sách 3 sản phẩm bán chạy
                List<Sanpham> topSellingCars = GetTopSellingCars();

                // Gán dữ liệu vào Repeater rdProduct (sản phẩm bán chạy)
                rdProduct.DataSource = topSellingCars;
                rdProduct.DataBind();

                // Lấy danh sách 3 sản phẩm có MaSP lớn nhất
                List<Sanpham> latestCars = GetLatestCars();

                // Gán dữ liệu vào Repeater rdMoinat (sản phẩm có MaSP lớn nhất)
                rdMoinat.DataSource = latestCars;
                rdMoinat.DataBind();
            }
        }
        public List<Sanpham> GetTopSellingCars()
        {
            List<Sanpham> cars = new List<Sanpham>();

            // Chuỗi kết nối của bạn
            string sqlCon = @"Data Source=LEGION5;Initial Catalog=QLoto1;User ID=sa;Password=123456;";

            // Sử dụng chuỗi kết nối của bạn
            using (SqlConnection connection = new SqlConnection(sqlCon))
            {
                connection.Open();

                // Query để lấy 3 sản phẩm đầu tiên trong bảng Sanpham
                string query = @"
        SELECT TOP 3 s.Tensp, s.Giatien, s.Soluong, s.Mota, s.Anhbia, h.Tenhang, d.Tendongxe
        FROM Sanpham s
        INNER JOIN Hangsanxuat h ON s.Mahang = h.Mahang
        INNER JOIN Dongxe d ON s.Madongxe = d.Madongxe
        ORDER BY s.MaSP DESC";  // Sắp xếp theo MaSP giảm dần

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Sanpham sanpham = new Sanpham
                    {
                        Tensp = reader["Tensp"].ToString(),
                        Giatien = Convert.ToDecimal(reader["Giatien"]),
                        Mota = reader["Mota"].ToString(),
                        Anhbia = reader["Anhbia"].ToString(),
                        Tenhang = reader["Tenhang"].ToString(),
                        Tendongxe = reader["Tendongxe"].ToString()
                    };
                    cars.Add(sanpham);
                }
            }

            return cars;
        }


        public List<Sanpham> GetLatestCars()
        {
            List<Sanpham> cars = new List<Sanpham>();

            // Chuỗi kết nối của bạn
            string sqlCon = @"Data Source=LEGION5;Initial Catalog=QLoto1;User ID=sa;Password=123456;";

            // Sử dụng chuỗi kết nối của bạn
            using (SqlConnection connection = new SqlConnection(sqlCon))
            {
                connection.Open();

                // Query để lấy 3 sản phẩm có MaSP lớn nhất
                string query = @"
                SELECT TOP 3 s.Tensp, s.Giatien, s.Soluong, s.Mota, s.Anhbia, h.Tenhang, d.Tendongxe
                FROM Sanpham s
                INNER JOIN Hangsanxuat h ON s.Mahang = h.Mahang
                INNER JOIN Dongxe d ON s.Madongxe = d.Madongxe
                     ORDER BY s.MaSP DESC";  // Sắp xếp theo MaSP giảm dần

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Sanpham sanpham = new Sanpham
                    {
                        Tensp = reader["Tensp"].ToString(),
                        Giatien = Convert.ToDecimal(reader["Giatien"]),
                        Mota = reader["Mota"].ToString(),
                        Anhbia = reader["Anhbia"].ToString(),
                        Tenhang = reader["Tenhang"].ToString(),
                        Tendongxe = reader["Tendongxe"].ToString()
                    };
                    cars.Add(sanpham);
                }
            }

            return cars;
        }

    }
}