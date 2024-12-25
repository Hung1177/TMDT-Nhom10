using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication9.Admin.Controllers;

namespace WebApplication9.Admin.Views
{
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderTable();
            }
            string deleteMasp = Request.QueryString["deleteMadon"];
            if (!string.IsNullOrEmpty(deleteMasp))
            {
                int Madon;
                if (int.TryParse(deleteMasp, out Madon))
                {
                    DeleteOrder(Madon); // Xóa đơn hàng
                }
            }

        }
        private void DeleteOrder(int Madonhang)
        {
            // Tạo đối tượng DataUtil và gọi phương thức xóa sản phẩm
            OrderData orderData = new OrderData();
            orderData.DeleteOrder(Madonhang);

            // Sau khi xóa, tải lại bảng sản phẩm
            Response.Redirect(Request.Url.AbsoluteUri.Split('?')[0]); // Xóa tham số trong URL
        }

        private void LoadOrderTable()
        {
            // Lấy trang hiện tại từ query string, mặc định là trang 1
            int currentPage = 1;
            if (Request.QueryString["page"] != null)
            {
                int.TryParse(Request.QueryString["page"], out currentPage);
            }

            // Số đơn hàng mỗi trang
            int pageSize = 9;
            int skip = (currentPage - 1) * pageSize;

            // Tạo đối tượng DataUtil và lấy danh sách đơn hàng
            OrderData orderData = new OrderData();
            var dsDonhang = orderData.dsDonhang();

            // Lọc ra đơn hàng của trang hiện tại
            var pagedOrders = dsDonhang.Skip(skip).Take(pageSize).ToList();

            // Tạo nội dung bảng
            string tableContent = "";
            int stt = skip + 1; // Số thứ tự bắt đầu từ trang hiện tại
            foreach (var order in pagedOrders)
            {
                tableContent += $@"
                <tr>
                    <td>{stt++}</td>
                    <td>{order.Madon}</td>
                    <td>{order.Ngaydat:dd/MM/yyyy}</td>
                    <td>{order.MaNguoidung}</td>
                    <td>{order.Hoten}</td>
                    <th>{order.Tinhtrang}</th>
                    <td>{order.TenTrangThai}</td>
                    <td>
                        <a href='/Admin/Views/updateDH.aspx?madon={order.Madon}' class='icon-btn update-btn'>
                            <span class='material-icons-sharp'>edit</span>
                        </a>
                        <a href='javascript:confirmDelete({order.Madon})' class='icon-btn delete-btn'>
                            <span class='material-icons-sharp'>delete</span>
                        </a>
                    </td>
                </tr>";
            }

            orderTableBody.InnerHtml = tableContent; // Gán nội dung vào tbody

            // Lấy tổng số trang
            int totalPages = (int)Math.Ceiling((double)dsDonhang.Count / pageSize);

            // Tạo nội dung phân trang
            string pagination = "";

            // Thêm nút "Previous" nếu trang hiện tại lớn hơn 1
            if (currentPage > 1)
            {
                pagination += $"<a href='/Admin/Views/order.aspx?page={currentPage - 1}' class='pagination-link previous'>Previous</a>";
            }

            // Nút "First" nếu không phải trang đầu tiên
            if (currentPage > 1)
            {
                pagination += $"<a href='/Admin/Views/order.aspx?page=1' class='pagination-link first'>First</a>";
            }

            // Các trang số
            for (int i = 1; i <= totalPages; i++)
            {
                string activeClass = (i == currentPage) ? "active" : "";  // Đánh dấu trang hiện tại
                pagination += $"<a href='/Admin/Views/order.aspx?page={i}' class='pagination-link {activeClass}'>{i}</a>";
            }

            // Nút "Last" nếu không phải trang cuối cùng
            if (currentPage < totalPages)
            {
                pagination += $"<a href='/Admin/Views/order.aspx?page={totalPages}' class='pagination-link last'>Last</a>";
            }

            // Thêm nút "Next" nếu trang hiện tại nhỏ hơn tổng số trang
            if (currentPage < totalPages)
            {
                pagination += $"<a href='/Admin/Views/order.aspx?page={currentPage + 1}' class='pagination-link next'>Next</a>";
            }

            // Gán nội dung phân trang vào phần tử phân trang
            paginationContainer.InnerHtml = pagination;
        }

    }
}