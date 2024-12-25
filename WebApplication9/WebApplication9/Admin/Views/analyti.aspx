<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Views/Admin.Master" AutoEventWireup="true" CodeBehind="analyti.aspx.cs" Inherits="WebApplication9.Admin.Views.analyti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   <link href="<%= ResolveUrl("~/root/css/analyti.css") %>?v=<%= DateTime.Now.Ticks %>" rel="stylesheet" />
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titlec" runat="server">
    Analytics
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noidung" runat="server">
    <div class="content-analyti">
        <div class="charts-container">
            <canvas id="ordersChart"></canvas>
            <canvas id="profitChart"></canvas>
            <canvas id="statusChart"></canvas>
            <canvas id="topProductsChart"></canvas>
        </div>
    </div>
    <script src="../../root/js/analyti.js"></script>
</asp:Content>
