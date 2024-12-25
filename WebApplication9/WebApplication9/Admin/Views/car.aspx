<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="car.aspx.cs" Inherits="WebApplication9.Admin.Views.car" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Liên kết CSS -->
    <link href="<%= ResolveUrl("~/root/css/car1.css") %>?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    <!-- Liên kết JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</asp:Content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="titlec" runat="server">
    Car Management
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="noidung" runat="server">
    <div class="student">
    <div class="student-controller">
        <div class="controller-top">
           <a href="<%= ResolveUrl("~/Admin/Views/addSP.aspx") %>" class="btn-link">
                <i class="fas fa-plus"></i>Thêm mới
            </a>
            <a href="<%= ResolveUrl("~/Admin/Views/dongxe.aspx") %>" class="btn-link">
                <i class="fas fa-plus"></i>Dòng xe
            </a>
            <a href="<%= ResolveUrl("~/Admin/Views/hangxe.aspx") %>" class="btn-link">
                <i class="fas fa-plus"></i>Hãng sản xuất
            </a>
            <div class="top-right">
                <a  class="btn-link">
                     <i class="fas fa-plus"></i>Export Excel
                 </a>
                <a  class="btn-link">
                     <i class="fas fa-plus"></i>Import Excel
                 </a>
            </div>
        </div>
        <div class="controller-bottom">
            <input type="text" placeholder="Name or Id ..." id="searchName">
            <select id="searchHang" runat="server">
                <option value="">Hãng</option>
            </select>
            <select id="searchDongxe" runat ="server">
                <option value="">Dòng xe</option>
            </select>
            <a class="btn-link" >
                 <i class="fas fa-plus"></i>Search
             </a>

            <a  class="btn-link" >
                 <i class="fas fa-plus"></i>Reset
             </a>
        </div>
    </div>
    <div class="table">
        <h2>List Car</h2>
        <table>
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã SP</th>
                    <th>Tên SP</th>
                    <th>Số lượng</th>
                    <th>Giá xe</th>
                    <th>Tên hãng</th>
                    <th>Dòng xe</th>
                    <th>Mô tả</th>
                    <th>Ảnh</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="carTableBody" runat="server"></tbody>
        </table>
        <div class="pagination" id="paginationContainer" runat="server">
            <!-- Các nút phân trang sẽ được tạo động ở đây -->
        </div>

    </div>
</div>  
<script>
    function confirmDelete(masp) {
        var result = confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");
        if (result) {
            // Điều hướng đến URL xóa sản phẩm
            window.location.href = '/Admin/Views/car.aspx?deleteMasp=' + masp;
        }
    }
</script>
<script>
    $(document).ready(function () {
        // Khi người dùng nhập vào ô tìm kiếm
        $('#searchName').on('input', function () {
            var name = $(this).val();
            var hang = $('#searchHang').val();
            var dongxe = $('#searchDongxe').val();

            // Gửi yêu cầu Ajax
            $.ajax({
                url: '/Admin/Views/car/car.aspx/GetCarData',
                type: 'POST',
                data: {
                    name: name,
                    hang: hang,
                    dongxe: dongxe
                },
                success: function (response) {
                    // Cập nhật lại bảng dữ liệu
                    $('#carTableBody').html(response);
                }
            });
        });

        // Cập nhật khi thay đổi hãng hoặc dòng xe
        $('#searchHang, #searchDongxe').on('change', function () {
            var name = $('#searchName').val();
            var hang = $('#searchHang').val();
            var dongxe = $('#searchDongxe').val();

            // Gửi yêu cầu Ajax
            $.ajax({
                url: '/Admin/Views/car/car.aspx/GetCarData',
                type: 'POST',
                data: {
                    name: name,
                    hang: hang,
                    dongxe: dongxe
                },
                success: function (response) {
                    // Cập nhật lại bảng dữ liệu
                    $('#carTableBody').html(response);
                }
            });
        });

        // Xử lý khi nhấn reset
        $('#resetBtn').click(function () {
            $('#searchName').val('');
            $('#searchHang').val('');
            $('#searchDongxe').val('');
            $('#searchName').trigger('input'); // Gọi lại để cập nhật bảng
        });
    });


</script>



</asp:Content>

