<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="WebApplication9.Admin.Views.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <link href="<%= ResolveUrl("~/root/css/order.css") %>?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titlec" runat="server">
    ORDER
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="server">
        <div class="student">
    <div class="student-controller">
        <div class="controller-top">
            <div class="top-right">
                <a  class="btn-link">
                     <i class="fas fa-plus"></i>Export Excel
                 </a>
                <a  class="btn-link">
                     <i class="fas fa-plus"></i>Import Excel
                 </a>
            </div>
        </div>

    </div>
    <div class="table">
        <h2>List Order</h2>
        <table>
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã đơn hàng</th>
                    <th>Ngày đặt</th>
                    <th>Mã người dùng</th>
                    <th>Tên người dùng</th>
                    <th class="matt">Mã tình trạng</th>
                    <th>Tình trạng</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="orderTableBody" runat="server"></tbody>
        </table>
        <div class="pagination" id="paginationContainer" runat="server">
            <!-- Các nút phân trang sẽ được tạo động ở đây -->
        </div>

    </div>
</div>  
    <script>
    function confirmDelete(madon) {
        if (confirm("Bạn có chắc chắn muốn xóa đơn hàng này?")) {
            window.location.href = '/Admin/Views/order.aspx?deleteMadon=' + madon;
        }
    }
</script>
</asp:Content>
