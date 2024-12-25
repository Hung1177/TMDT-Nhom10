<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="addDX.aspx.cs" Inherits="WebApplication9.Admin.Views.addDX" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
            <link href="<%= ResolveUrl("~/root/css/dongxe.css") %>?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titlec" runat="server">
    Thêm dòng xe
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
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Madongxe" DataSourceID="SqlDataSource1" Height="90px" Width="138px"
                DefaultMode="Insert">
                <EditItemTemplate>
                    Madongxe:
                    <asp:Label ID="MadongxeLabel1" runat="server" Text='<%# Eval("Madongxe") %>' />
                    <br />
                    Tendongxe:
                    <asp:TextBox ID="TendongxeTextBox" runat="server" Text='<%# Bind("Tendongxe") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Tendongxe:
                    <asp:TextBox ID="TendongxeTextBox" runat="server" Text='<%# Bind("Tendongxe") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Madongxe:
                    <asp:Label ID="MadongxeLabel" runat="server" Text='<%# Eval("Madongxe") %>' />
                    <br />
                    Tendongxe:
                    <asp:Label ID="TendongxeLabel" runat="server" Text='<%# Bind("Tendongxe") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLotoConnectionString4 %>" DeleteCommand="DELETE FROM [Dongxe] WHERE [Madongxe] = @Madongxe" InsertCommand="INSERT INTO [Dongxe] ([Tendongxe]) VALUES (@Tendongxe)" ProviderName="<%$ ConnectionStrings:QLotoConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [Dongxe]" UpdateCommand="UPDATE [Dongxe] SET [Tendongxe] = @Tendongxe WHERE [Madongxe] = @Madongxe">
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
    <asp:Label ID="txt1" runat="server" ForeColor="Red"></asp:Label>
    <a href="Dongxe.aspx">Dòng xe</a>
</div>  
</asp:Content>
