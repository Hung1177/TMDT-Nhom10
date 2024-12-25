<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="hangxe.aspx.cs" Inherits="WebApplication9.Admin.Views.hangxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="<%= ResolveUrl("~/root/css/dongxe.css") %>?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titlec" runat="server">
    Hãng xe
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="server">
        <div class="student">
    <div class="student-controller">
        <div class="controller-top">
           <a href="<%= ResolveUrl("~/Admin/Views/addNXX.aspx") %>" class="btn-link">
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
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Mahang" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Mahang" HeaderText="Mã hãng" InsertVisible="False" ReadOnly="True" SortExpression="Mahang" />
                <asp:BoundField DataField="Tenhang" HeaderText="Tên hãng" SortExpression="Tenhang" />
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLotoConnectionString4 %>" DeleteCommand="DELETE FROM [Hangsanxuat] WHERE [Mahang] = @Mahang" InsertCommand="INSERT INTO [Hangsanxuat] ([Tenhang]) VALUES (@Tenhang)" SelectCommand="SELECT * FROM [Hangsanxuat]" UpdateCommand="UPDATE [Hangsanxuat] SET [Tenhang] = @Tenhang WHERE [Mahang] = @Mahang">
            <DeleteParameters>
                <asp:Parameter Name="Mahang" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Tenhang" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Tenhang" Type="String" />
                <asp:Parameter Name="Mahang" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <a href="car.aspx">List Car</a>
</div>  
</asp:Content>
