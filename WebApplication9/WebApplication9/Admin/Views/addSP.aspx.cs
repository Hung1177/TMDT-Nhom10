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
    public partial class addSP : System.Web.UI.Page
    {
        DataUtil dataUtil = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadHangsanxuat();
                LoadDongxe();
            }
        }
        private void LoadHangsanxuat()
        {
            var hangSanXuatList = dataUtil.dsHangsanxuat();
            if (hangSanXuatList != null && hangSanXuatList.Count > 0)
            {

                ddlHangSanXuat.DataSource = hangSanXuatList;
                ddlHangSanXuat.DataTextField = "Tenhang";
                ddlHangSanXuat.DataValueField = "Mahang";
                ddlHangSanXuat.DataBind();
            }
            else
            {
                ddlHangSanXuat.Items.Add(new ListItem("-- Không có dữ liệu --", ""));
            }
        }

        private void LoadDongxe()
        {
            var dongXeList = dataUtil.dsDongxe();
            if (dongXeList != null && dongXeList.Count > 0)
            {
                ddlDongXe.DataSource = dongXeList;
                ddlDongXe.DataTextField = "Tendongxe";
                ddlDongXe.DataValueField = "Madongxe";
                ddlDongXe.DataBind();
            }
            else
            {
                ddlDongXe.Items.Add(new ListItem("-- Không có dữ liệu --", ""));
            }
        }

        protected void AddProduct(object sender, EventArgs e)
        {
            try
            {
                // Kiểm tra các trường nhập liệu
                string tensp = txtTenSP.Text.Trim();
                if (string.IsNullOrEmpty(tensp))
                    throw new ArgumentException("Tên sản phẩm không được để trống");

                if (string.IsNullOrEmpty(txtSoLuong.Text) || !int.TryParse(txtSoLuong.Text, out int soluong))
                    throw new ArgumentException("Số lượng không hợp lệ");

                string mota = txtMoTa.Text.Trim();
                if (string.IsNullOrEmpty(mota))
                    throw new ArgumentException("Mô tả không được để trống");

                if (string.IsNullOrEmpty(txtGiaTien.Text) || !decimal.TryParse(txtGiaTien.Text, out decimal giatien))
                    throw new ArgumentException("Giá tiền không hợp lệ");

                if (ddlHangSanXuat.SelectedValue == null || ddlHangSanXuat.SelectedValue == "")
                    throw new ArgumentException("Vui lòng chọn hãng sản xuất");

                if (ddlDongXe.SelectedValue == null || ddlDongXe.SelectedValue == "")
                    throw new ArgumentException("Vui lòng chọn dòng xe");

                // Tạo đối tượng sản phẩm
                Sanpham sp = new Sanpham
                {
                    Tensp = tensp,
                    Soluong = soluong,
                    Mota = mota,
                    Giatien = giatien,
                    Mahang = int.Parse(ddlHangSanXuat.SelectedValue),
                    Madongxe = int.Parse(ddlDongXe.SelectedValue),
                    Anhbia = UploadImage() // Xử lý upload ảnh
                };

                // Gọi phương thức thêm sản phẩm
                dataUtil.AddSanpham(sp);
                Response.Redirect("~/Admin/Views/car.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }


        private string UploadImage()
        {
            if (fileUpload.HasFile)
            {
                string folderPath = Server.MapPath("~/Uploads/");

                // Kiểm tra và tạo thư mục nếu chưa tồn tại
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string filePath = Path.Combine(folderPath, fileName);

                // Lưu file
                fileUpload.SaveAs(filePath);

                // Trả về đường dẫn tương đối để lưu vào cơ sở dữ liệu
                return "" + fileName;
            }
            else
            {
                throw new ArgumentException("Vui lòng chọn ảnh để tải lên");
            }
        }
    }
}