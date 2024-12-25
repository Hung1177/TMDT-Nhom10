using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication9.Admin.Models;

namespace WebApplication9.Admin.Controllers
{
    public class OrderData
    {
        SqlConnection con2;
        public OrderData()
        {
            string sqlCon2 = @"Data Source=LEGION5;Initial Catalog=QLoto1;User ID=sa;Password=123456;";
            con2 = new SqlConnection(sqlCon2);
        }
        public List<Donhang> dsDonhang()
        {
            List<Donhang> ds = new List<Donhang>();
            string sql1 = @"SELECT d.Madon, d.Ngaydat, d.Tinhtrang, d.MaNguoidung, t.TenTrangThai, n.Hoten
                    FROM Donhang d
                    INNER JOIN Trangthai t ON d.Tinhtrang = t.Tinhtrang
                    INNER JOIN Nguoidung n ON d.MaNguoidung = n.MaNguoidung";
            try
            {
                con2.Open();
                SqlCommand cmd = new SqlCommand(sql1, con2);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Donhang d = new Donhang();
                    d.Madon = (int)rd["Madon"];
                    d.Ngaydat = (DateTime)rd["Ngaydat"];
                    d.Tinhtrang = (int)rd["Tinhtrang"];
                    d.MaNguoidung = (int)rd["MaNguoidung"];
                    d.TenTrangThai = (string)rd["TenTrangThai"];
                    d.Hoten = (string)rd["Hoten"];
                    ds.Add(d);
                }
                rd.Close();
            }
            catch (Exception ex)
            {
                // Log lỗi
                Console.WriteLine("Lỗi: " + ex.Message);
            }
            finally
            {
                con2.Close();
            }
            return ds;
        }
        public static implicit operator OrderData(DataUtil v)
        {
            throw new NotImplementedException();
        }
        public void DeleteOrder(int Madon)
        {
            string sql2 = "Delete from Donhang Where Madon = @Madon";
            con2.Open();
            SqlCommand cmd = new SqlCommand(sql2, con2);
            cmd.Parameters.AddWithValue("@Madon", Madon);
            cmd.ExecuteNonQuery();
            cmd.Clone();
        }
        // Phương thức cập nhật tình trạng đơn hàng
        public void UpdateOrderStatus(int Madon, int Tinhtrang)
        {
            string sql2 = "UPDATE Donhang SET Tinhtrang = @Tinhtrang WHERE Madon = @Madon";
            try
            {
                con2.Open();
                SqlCommand cmd = new SqlCommand(sql2, con2);
                cmd.Parameters.AddWithValue("@Tinhtrang", Tinhtrang);
                cmd.Parameters.AddWithValue("@Madon", Madon);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi khi cập nhật tình trạng: " + ex.Message);
            }
            finally
            {
                con2.Close();
            }
        }
    }
}