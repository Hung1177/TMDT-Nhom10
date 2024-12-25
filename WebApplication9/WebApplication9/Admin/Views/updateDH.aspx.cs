using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using WebApplication9.Admin.Controllers;

namespace WebApplication9.Admin.Views
{
    public partial class updateDH : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Lấy mã đơn hàng từ query string
                string madon = Request.QueryString["madon"];
                if (!string.IsNullOrEmpty(madon))
                {
                    int Madon = Convert.ToInt32(madon);
                    LoadOrderDetails(Madon);
                }
            }
        }

        private void LoadOrderDetails(int Madon)
        {
            // Truy vấn cơ sở dữ liệu để lấy thông tin đơn hàng
            OrderData orderData = new OrderData();
            var order = orderData.dsDonhang().FirstOrDefault(d => d.Madon == Madon);

            if (order != null)
            {
                // Điền thông tin vào các textbox (chỉ đọc)
                txtMahon.Text = order.Madon.ToString();
                txtDathang.Text = order.Ngaydat.ToString("yyyy-MM-dd");
                txtUser.Text = order.Hoten;

                // Điền danh sách tình trạng đơn hàng
                ddTinhtrang.DataSource = GetOrderStatusList();  // Giả sử bạn có một hàm để lấy danh sách tình trạng
                ddTinhtrang.DataTextField = "TenTrangThai";
                ddTinhtrang.DataValueField = "Tinhtrang";
                ddTinhtrang.DataBind();
                ddTinhtrang.SelectedValue = order.Tinhtrang.ToString(); // Chọn tình trạng hiện tại
            }
        }

        // Phương thức lấy danh sách tình trạng đơn hàng
        private List<OrderStatus> GetOrderStatusList()
        {
            return new List<OrderStatus>
            {
                new OrderStatus { Tinhtrang = 1, TenTrangThai = "Đang xử lý" },
                new OrderStatus { Tinhtrang = 2, TenTrangThai = "Đã giao" },
                new OrderStatus { Tinhtrang = 3, TenTrangThai = "Đã hủy" },
                // Thêm các tình trạng khác nếu có
            };
        }

        // Lớp OrderStatus (nếu chưa có)
        public class OrderStatus
        {
            public int Tinhtrang { get; set; }
            public string TenTrangThai { get; set; }
        }

        protected void Capnhat_Click(object sender, EventArgs e)
        {
            int Madon = Convert.ToInt32(txtMahon.Text);
            int Tinhtrang = Convert.ToInt32(ddTinhtrang.SelectedValue);

            // Cập nhật tình trạng đơn hàng
            OrderData orderData = new OrderData();
            orderData.UpdateOrderStatus(Madon, Tinhtrang);

            // Sau khi cập nhật, chuyển hướng về trang danh sách đơn hàng hoặc thông báo
            Response.Redirect("/Admin/Views/order.aspx");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            // Quay lại trang danh sách đơn hàng nếu hủy
            Response.Redirect("/Admin/Views/order.aspx");
        }
    }
}
