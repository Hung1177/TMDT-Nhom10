<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="updateSP.aspx.cs" Inherits="WebApplication9.Admin.Views.updateSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titlec" runat="server">
    UPDATE PRODUCT CAR
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="server">
        <asp:Table ID="Table1Sua" runat="server" >
        <asp:TableRow>
            <asp:TableCell>Mã sản phẩm</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtMasp" runat="server" Enabled="false"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Tên sản phẩm</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtTensp" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Số lượng</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtSoluong" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Dòng xe</asp:TableCell>
            <asp:TableCell><asp:DropDownList ID="dlDongxe" runat="server"></asp:DropDownList></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Hãng</asp:TableCell>
            <asp:TableCell><asp:DropDownList ID="dlHang" runat="server"></asp:DropDownList></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Mô tả</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtMoTa" runat="server"  TextMode="MultiLine" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Giá tiền</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtGia" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Ảnh</asp:TableCell>
            <asp:TableCell><asp:FileUpload ID="linkanh" runat="server" /></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Button ID="Capnhat" runat="server" Text="Update" OnClick="Capnhat_Click" />
    <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />
</asp:Content>

