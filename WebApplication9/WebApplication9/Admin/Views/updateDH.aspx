<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="updateDH.aspx.cs" Inherits="WebApplication9.Admin.Views.updateDH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titlec" runat="server">
    UPDATE ORDER CAR
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="server">
    <asp:Table ID="Table1Sua" runat="server" Width="326px">
        <asp:TableRow>
            <asp:TableCell>Mã order</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtMahon" runat="server" Enabled="false"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Ngày đặt hàng</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtDathang" runat="server" Enabled="false"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Tình trạng</asp:TableCell>
            <asp:TableCell><asp:DropDownList ID="ddTinhtrang" runat="server"></asp:DropDownList></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Người đặt</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtUser" runat="server" Enabled="false"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Button ID="Capnhat" runat="server" Text="Update" OnClick="Capnhat_Click" />
    <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />
</asp:Content>
