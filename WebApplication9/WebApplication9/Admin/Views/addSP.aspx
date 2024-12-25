<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="addSP.aspx.cs" Inherits="WebApplication9.Admin.Views.addSP" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Liên kết CSS -->
    <link href="<%= ResolveUrl("~/root/css/add-car.css") %>?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
    <!-- Liên kết JS -->
</asp:Content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="titlec" runat="server">
    ADD PRODUCT CAR
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="server">
<div class="add-sv">
    <div class="left-section">
        <div class="form-group">
            <div class="form-group-half">
                <label for="ten-sp">Tên sản phẩm</label>
                <asp:TextBox ID="txtTenSP" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group-half">
                <label for="so-luong">Số lượng <span style="color: red;">*</span></label>
                <asp:TextBox ID="txtSoLuong" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <div class="form-group-half">
                <label for="ddlHangsanxuat">Hãng <span style="color: red;">*</span></label>
                <asp:DropDownList ID="ddlHangSanXuat" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group-half">
                <label for="ddlDongxe">Dòng xe <span style="color: red;">*</span></label>
                <asp:DropDownList ID="ddlDongXe" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <div class="form-group-half">
                <label for="mo-tan">Mô tả <span style="color: red;">*</span></label>
                 <asp:TextBox ID="txtMoTa" runat="server" CssClass="form-control" TextMode="MultiLine" />
            </div>
            <div class="form-group-half">
                <label for="gia-tien">Giá tiền</label>
                <asp:TextBox ID="txtGiaTien" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="button-group">
            <asp:Button CssClass="btn-add" Text="Thêm sản phẩm"  OnClick="AddProduct" runat="server" />
             <a href="<%= ResolveUrl("~/Admin/Views/car.aspx") %>"><button class="btn-cancel" type="button" onclick="Cancel()">Cancel</button></a>
        </div>
    </div>
    <div class="right-section">
        <div class="form-group">
            <label for="anh-sinh-vien">Image <span style="color: red;">*</span></label>
            <asp:FileUpload ID="fileUpload" runat="server" />
            <img alt="Placeholder for product image" src="" id="preview-image" height="auto" width="auto"/>
        </div>
    </div>
    <asp:Label ID="lblError" CssClass="error-message" runat="server" ForeColor="Red" />

</div>
</asp:Content>

