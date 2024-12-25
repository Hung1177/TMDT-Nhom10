using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication9.Admin.Models;

namespace WebApplication9.Admin.Controllers
{
    public class DataUtil
    {
        SqlConnection con;
        public DataUtil()
        {
            string sqlCon = @"Data Source=LEGION5;Initial Catalog=QLoto1;User ID=sa;Password=123456;";
            con = new SqlConnection(sqlCon);
        }
        public List<Sanpham> dsSanpham()
        {
            List<Sanpham> ds = new List<Sanpham>();
            string sql = @"
            SELECT s.Masp, s.Tensp, s.Giatien, s.Soluong, s.Mota, 
                   h.Tenhang, d.Tendongxe, s.Anhbia 
            FROM Sanpham s
            INNER JOIN Hangsanxuat h ON s.Mahang = h.Mahang
            INNER JOIN Dongxe d ON s.Madongxe = d.Madongxe";

            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                Sanpham s = new Sanpham();
                s.Masp = (int)rd["Masp"];
                s.Tensp = (string)rd["Tensp"];
                s.Giatien = (decimal)rd["Giatien"];
                s.Soluong = (int)rd["Soluong"];
                s.Mota = (string)rd["Mota"];

                // Tạo đối tượng Hangsanxuat và Dongxe từ kết quả truy vấn
                s.Tenhang = (string)rd["Tenhang"];
                s.Tendongxe = (string)rd["Tendongxe"];

                s.Anhbia = (string)rd["Anhbia"];
                ds.Add(s);
            }
            con.Close();
            return ds;
        }
        // Lấy danh sách hãng sản xuất
        public List<Hangsanxuat> dsHangsanxuat()
        {
            List<Hangsanxuat> ds = new List<Hangsanxuat>();
            string sql = "SELECT Mahang, Tenhang FROM Hangsanxuat";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                Hangsanxuat h = new Hangsanxuat();
                h.Mahang = (int)rd["Mahang"];
                h.Tenhang = (string)rd["Tenhang"];
                ds.Add(h);
            }
            con.Close();
            return ds;
        }
        //Xoa hang
        public void DeleteHangSanXuat(int mahang)
        {
            string sql = "DELETE FROM Hangsanxuat WHERE Mahang = @Mahang";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Mahang", mahang);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        // Lấy danh sách dòng xe
        public List<Dongxe> dsDongxe()
        {
            List<Dongxe> ds = new List<Dongxe>();
            string sql = "SELECT Madongxe, Tendongxe FROM Dongxe";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                Dongxe d = new Dongxe();
                d.Madongxe = (int)rd["Madongxe"];
                d.Tendongxe = (string)rd["Tendongxe"];
                ds.Add(d);
            }
            con.Close();
            return ds;
        }
        // Thêm sản phẩm mới
        public void AddSanpham(Sanpham sp)
        {
            try
            {
                string sql = @"
            INSERT INTO Sanpham (Tensp, Giatien, Soluong, Mota, Mahang, Madongxe, Anhbia)
            VALUES (@Tensp, @Giatien, @Soluong, @Mota, @Mahang, @Madongxe, @Anhbia)";

                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@Tensp", sp.Tensp);
                cmd.Parameters.AddWithValue("@Giatien", sp.Giatien);
                cmd.Parameters.AddWithValue("@Soluong", sp.Soluong);
                cmd.Parameters.AddWithValue("@Mota", sp.Mota);
                cmd.Parameters.AddWithValue("@Mahang", sp.Mahang);
                cmd.Parameters.AddWithValue("@Madongxe", sp.Madongxe);
                cmd.Parameters.AddWithValue("@Anhbia", sp.Anhbia);

                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
                throw new Exception("Lỗi khi thêm sản phẩm: " + ex.Message);
            }
        }

        //Xoa san pham
        public void DeleteSanpham(int masp)
        {
            string sql = "DELETE FROM Sanpham WHERE Masp = @Masp";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Masp", masp);
            cmd.ExecuteNonQuery();
            con.Close();
        }



        //Sua san pham
        public void Capnhatsp(Sanpham s)
        {
            con.Open();
            string strSql = @"
            UPDATE Sanpham 
            SET 
                Tensp = @Tensp, 
                Giatien = @Giatien, 
                Soluong = @Soluong, 
                Mota = @Mota, 
                Mahang = @Mahang, 
                Madongxe = @Madongxe, 
                Anhbia = @Anhbia
            WHERE Masp = @Masp"; // Chỉ cập nhật sản phẩm với Masp tương ứng

            SqlCommand cmd = new SqlCommand(strSql, con);
            cmd.Parameters.AddWithValue("@Tensp", s.Tensp);
            cmd.Parameters.AddWithValue("@Giatien", s.Giatien);
            cmd.Parameters.AddWithValue("@Soluong", s.Soluong);
            cmd.Parameters.AddWithValue("@Mota", s.Mota);
            cmd.Parameters.AddWithValue("@Mahang", s.Mahang);
            cmd.Parameters.AddWithValue("@Madongxe", s.Madongxe);
            cmd.Parameters.AddWithValue("@Anhbia", s.Anhbia);
            cmd.Parameters.AddWithValue("@Masp", s.Masp); // Truyền Masp vào câu lệnh SQL để đảm bảo chỉ sửa sản phẩm cụ thể

            cmd.ExecuteNonQuery();
            con.Close();
        }

        //

        // Lấy sản phẩm theo Masp
        public Sanpham GetSanphamByMasp(int masp)
        {
            Sanpham s = null;
            string sql = @"
            SELECT s.Masp, s.Tensp, s.Giatien, s.Soluong, s.Mota, 
                   h.Tenhang, d.Tendongxe, s.Anhbia 
            FROM Sanpham s
            INNER JOIN Hangsanxuat h ON s.Mahang = h.Mahang
            INNER JOIN Dongxe d ON s.Madongxe = d.Madongxe
            WHERE s.Masp = @Masp";

            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Masp", masp);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                s = new Sanpham
                {
                    Masp = (int)rd["Masp"],
                    Tensp = (string)rd["Tensp"],
                    Giatien = (decimal)rd["Giatien"],
                    Soluong = (int)rd["Soluong"],
                    Mota = (string)rd["Mota"],
                    Tenhang = (string)rd["Tenhang"],
                    Tendongxe = (string)rd["Tendongxe"],
                    Anhbia = (string)rd["Anhbia"]
                };
            }
            con.Close();
            return s;
        }
    }
}