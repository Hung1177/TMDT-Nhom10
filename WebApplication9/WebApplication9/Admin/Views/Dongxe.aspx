<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="Dongxe.aspx.cs" Inherits="WebApplication9.Admin.Views.Dongxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <link href="<%= ResolveUrl("~/root/css/dongxe.css") %>?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titlec" runat="server">
    Dòng xe 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="server">
    <div class="student">
    <div class="student-controller">
        <div class="controller-top">
           <a href="<%= ResolveUrl("~/Admin/Views/addDX.aspx") %>" class="btn-link">
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
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Madongxe" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Width="338px">
            <Columns>
                <asp:BoundField DataField="Madongxe" HeaderText="Mã dòng xe" InsertVisible="False" ReadOnly="True" SortExpression="Madongxe" />
                <asp:BoundField DataField="Tendongxe" HeaderText="Tên dòng xe" SortExpression="Tendongxe" />
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"
                        OnClientClick="return confirm('Ban cos chac chan khong')"
                            ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView> 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLotoConnectionString2 %>" DeleteCommand="DELETE FROM [Dongxe] WHERE [Madongxe] = @Madongxe" InsertCommand="INSERT INTO [Dongxe] ([Tendongxe]) VALUES (@Tendongxe)" ProviderName="<%$ ConnectionStrings:QLotoConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Dongxe]" UpdateCommand="UPDATE [Dongxe] SET [Tendongxe] = @Tendongxe WHERE [Madongxe] = @Madongxe">
            <DeleteParameters>
                <asp:Parameter Name="Madongxe" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Tendongxe" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Tendongxe" Type="String" />
                <asp:Parameter Name="Madongxe" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <a href="car.aspx">List Car</a>
</div>  
</asp:Content>
