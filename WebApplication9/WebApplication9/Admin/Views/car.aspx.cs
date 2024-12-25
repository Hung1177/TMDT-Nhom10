using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication9.Admin.Controllers;

namespace WebApplication9.Admin.Views
{
    public partial class car : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropdowns();
                LoadCarTable();
            }

            // Kiểm tra tham số "deleteMasp" trong URL
            string deleteMasp = Request.QueryString["deleteMasp"];
            if (!string.IsNullOrEmpty(deleteMasp))
            {
                int masp;
                if (int.TryParse(deleteMasp, out masp))
                {
                    DeleteCar(masp); // Xóa sản phẩm
                }
            }
        }
        private void DeleteCar(int masp)
        {
            // Tạo đối tượng DataUtil và gọi phương thức xóa sản phẩm
            DataUtil dataUtil = new DataUtil();
            dataUtil.DeleteSanpham(masp);

            // Sau khi xóa, tải lại bảng sản phẩm
            Response.Redirect(Request.Url.AbsoluteUri.Split('?')[0]); // Xóa tham số trong URL
        }
        private void LoadCarTable()
        {
            // Lấy trang hiện tại từ query string, mặc định là trang 1
            int currentPage = 1;
            if (Request.QueryString["page"] != null)
            {
                int.TryParse(Request.QueryString["page"], out currentPage);
            }

            // Số sản phẩm mỗi trang
            int pageSize = 9;
            int skip = (currentPage - 1) * pageSize;

            // Tạo đối tượng DataUtil và lấy danh sách sản phẩm
            DataUtil dataUtil = new DataUtil();
            var dsSanpham = dataUtil.dsSanpham();

            // Lọc ra sản phẩm của trang hiện tại
            var pagedProducts = dsSanpham.Skip(skip).Take(pageSize).ToList();

            // Tạo nội dung bảng
            string tableContent = "";
            int stt = skip + 1; // Số thứ tự bắt đầu từ trang hiện tại
            foreach (var sp in pagedProducts)
            {
                tableContent += $@"
        <tr>
            <td>{stt++}</td>
            <td>{sp.Masp}</td>
            <td>{sp.Tensp}</td>
            <td>{sp.Soluong}</td>
            <td>{sp.Giatien:0,0} VND</td>
            <td>{sp.Tenhang}</td>
            <td>{sp.Tendongxe}</td>
            <td>{sp.Mota}</td>
            <td><img src='/root/image/{sp.Anhbia}' alt='{sp.Tensp}' style='width:75px; max-height:45px;' /></td>
            <td>
                <a href='/Admin/Views/updateSP.aspx?masp={sp.Masp}' class='icon-btn update-btn'>
                    <span class='material-icons-sharp'>edit</span>
                </a>
                <a href='javascript:confirmDelete({sp.Masp})' class='icon-btn delete-btn'>
                    <span class='material-icons-sharp'>delete</span> 
                </a>                        
            </td>
        </tr>";
            }

            carTableBody.InnerHtml = tableContent; // Gán nội dung vào tbody

            // Lấy tổng số trang
            int totalPages = (int)Math.Ceiling((double)dsSanpham.Count / pageSize);

            // Tạo nội dung phân trang
            string pagination = "";

            // Thêm nút "Previous" nếu trang hiện tại lớn hơn 1
            if (currentPage > 1)
            {
                pagination += $"<a href='/Admin/Views/car.aspx?page={currentPage - 1}' class='pagination-link previous'>Previous</a>";
            }

            // Nút "First" nếu không phải trang đầu tiên
            if (currentPage > 1)
            {
                pagination += $"<a href='/Admin/Views/car.aspx?page=1' class='pagination-link first'>First</a>";
            }

            // Các trang số
            for (int i = 1; i <= totalPages; i++)
            {
                string activeClass = (i == currentPage) ? "active" : "";  // Đánh dấu trang hiện tại
                pagination += $"<a href='/Admin/Views/car.aspx?page={i}' class='pagination-link {activeClass}'>{i}</a>";
            }

            // Nút "Last" nếu không phải trang cuối cùng
            if (currentPage < totalPages)
            {
                pagination += $"<a href='/Admin/Views/car.aspx?page={totalPages}' class='pagination-link last'>Last</a>";
            }

            // Thêm nút "Next" nếu trang hiện tại nhỏ hơn tổng số trang
            if (currentPage < totalPages)
            {
                pagination += $"<a href='/Admin/Views/car.aspx?page={currentPage + 1}' class='pagination-link next'>Next</a>";
            }

            // Gán nội dung phân trang vào phần tử phân trang
            paginationContainer.InnerHtml = pagination;

        }
        private void LoadDropdowns()
        {
            DataUtil dataUtil = new DataUtil();

            // Lấy danh sách hãng xe và dòng xe từ DataUtil
            var hangList = dataUtil.dsHangsanxuat();
            var dongxeList = dataUtil.dsDongxe();

            foreach (var hang in hangList)
            {
                searchHang.Items.Add(new ListItem(hang.Tenhang, hang.Mahang.ToString()));
            }

            foreach (var dongxe in dongxeList)
            {
                searchDongxe.Items.Add(new ListItem(dongxe.Tendongxe, dongxe.Madongxe.ToString()));
            }
        }
    }
}