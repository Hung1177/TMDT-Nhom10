using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication9.Admin.Controllers;
using WebApplication9.Admin.Models;

namespace WebApplication9.Admin.Views
{
    public partial class updateSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int masp;
                if (int.TryParse(Request.QueryString["masp"], out masp))
                {
                    LoadSanphamDetails(masp);
                }
            }
        }

        private void LoadSanphamDetails(int masp)
        {
            DataUtil dataUtil = new DataUtil();
            Sanpham sp = dataUtil.GetSanphamByMasp(masp);
            if (sp != null)
            {
                txtMasp.Text = sp.Masp.ToString();
                txtTensp.Text = sp.Tensp;
                txtSoluong.Text = sp.Soluong.ToString();
                txtMoTa.Text = sp.Mota;
                txtGia.Text = sp.Giatien.ToString();
                // Load DropdownLists for Hangsanxuat and Dongxe
                LoadHangsanxuat(sp.Mahang);
                LoadDongxe(sp.Madongxe);
            }
        }

        private void LoadHangsanxuat(int mahang)
        {
            // Load danh sách hãng sản xuất vào DropdownList
            DataUtil dataUtil = new DataUtil();
            var dsHangsanxuat = dataUtil.dsHangsanxuat();
            dlHang.DataSource = dsHangsanxuat;
            dlHang.DataTextField = "Tenhang";
            dlHang.DataValueField = "Mahang";
            dlHang.DataBind();
            dlHang.SelectedValue = mahang.ToString();
        }

        private void LoadDongxe(int madongxe)
        {
            // Load danh sách dòng xe vào DropdownList
            DataUtil dataUtil = new DataUtil();
            var dsDongxe = dataUtil.dsDongxe();
            dlDongxe.DataSource = dsDongxe;
            dlDongxe.DataTextField = "Tendongxe";
            dlDongxe.DataValueField = "Madongxe";
            dlDongxe.DataBind();
            dlDongxe.SelectedValue = madongxe.ToString();
        }
        protected void Capnhat_Click(object sender, EventArgs e)
        {
            Sanpham updatedSanpham = new Sanpham
            {
                Masp = int.Parse(txtMasp.Text),
                Tensp = txtTensp.Text,
                Giatien = decimal.Parse(txtGia.Text),
                Soluong = int.Parse(txtSoluong.Text),
                Mota = txtMoTa.Text,
                Mahang = int.Parse(dlHang.SelectedValue),
                Madongxe = int.Parse(dlDongxe.SelectedValue),
                Anhbia = linkanh.HasFile ? Path.GetFileName(linkanh.PostedFile.FileName) : ""
            };

            // Nếu có file ảnh mới thì lưu ảnh vào thư mục
            if (linkanh.HasFile)
            {
                linkanh.SaveAs(Server.MapPath("~/root/image/") + updatedSanpham.Anhbia);
            }

            DataUtil dataUtil = new DataUtil();
            dataUtil.Capnhatsp(updatedSanpham);

            // Sau khi cập nhật, điều hướng lại về trang sản phẩm
            Response.Redirect("/Admin/Views/car.aspx");
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Views/car.aspx"); // Quay lại trang danh sách sản phẩm
        }
    }
}