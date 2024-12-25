<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="addNXX.aspx.cs" Inherits="WebApplication9.Admin.Views.addNXX" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="<%= ResolveUrl("~/root/css/dongxe.css") %>?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titlec" runat="server">
    Thêm mới hãng xe
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="server">
        <div class="student">
<div class="student-controller">
    <div class="controller-top">
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
</div>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Mahang" DataSourceID="SqlDataSource1" Width="128px" DefaultMode="Insert">
                <EditItemTemplate>
                    Mahang:
                    <asp:Label ID="MahangLabel1" runat="server" Text='<%# Eval("Mahang") %>' />
                    <br />
                    Tenhang:
                    <asp:TextBox ID="TenhangTextBox" runat="server" Text='<%# Bind("Tenhang") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Tenhang:
                    <asp:TextBox ID="TenhangTextBox" runat="server" Text='<%# Bind("Tenhang") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Mahang:
                    <asp:Label ID="MahangLabel" runat="server" Text='<%# Eval("Mahang") %>' />
                    <br />
                    Tenhang:
                    <asp:Label ID="TenhangLabel" runat="server" Text='<%# Bind("Tenhang") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
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
<asp:Label ID="txt1" runat="server" ForeColor="Red"></asp:Label>
<a href="Dongxe.aspx">Dòng xe</a>
</asp:Content>
