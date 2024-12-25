<%@ Page Title="" Language="C#" MasterPageFile="~/User/Views/Index.Master" AutoEventWireup="true" CodeBehind="ShopOto.aspx.cs" Inherits="WebApplication9.User.Views.ShopOto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vinfast Shop</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link rel="stylesheet" href="../../root/css/ShopOto.css">
        <style type="text/css">
            .auto-style1 {
                left: 0;
                top: 0;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
            <div class="MainContent">
            <section id="slider">
                <div class="aspect-ratio-169">
                    <img src="image/Banner Number 1.webp" alt="">
                    <img src="image/Drgnfly Banner.jpg" alt="" class="auto-style1">
                    <img src="image/WEB_PC_Homepage banner_3060 x 1406.jpg" alt="">
                    <img src="image/campaign-pxvn-20240927.jpg" alt="">
                    <img src="image/Banner-Home.jpg" alt="">
                    <img src="image/campaign-20240927.jpg" alt="">
                    <img src="image/26Aug_Vinfast-Website_3060x1406px.webp" alt="">
                    <img src="image/Slider-VF8-25Aug-Desktop_3060x1406.jpg" alt="">
                </div>
                <div class="dot-container">
                    <div class="dot active"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                </div>
            </section>
        </div>
        <div class="Content">
            <main class="text=center py-8">
                <div class="main-title1">
                    <h1>Ô tô</h1>
                    <h2>Mẫu bán chạy gần đây</h2>
                </div>

                    <!-- Repeater for the first 3 products -->
                    <asp:Repeater ID="rdProduct" runat="server">
                        <ItemTemplate>
                            <div class="Sanpham1"> <!-- Đảm bảo chỉ có một div cho tất cả sản phẩm -->
                                <div class="product">
                                    <div class="badge">Bán chạy</div>
                                    <asp:Image ID="img" runat="server" ImageUrl='<%# "~/root/image/" + Eval("Anhbia") %>'  />
                                    <h3><%# Eval("Tensp") %></h3>
                                    <p class="mota"><%# Eval("Mota") %></p>
                                    <p class="price"><%# Eval("Giatien", "{0:N0}") %> ₫</p>
                                    <p class="hangxe"><%# Eval("Tenhang") %></p>
                                    <p class="dongxe"><%# Eval("Tendongxe") %></p>
                                    <a class="buy-now" href="DatHang.html">MUA NGAY</a>
                                    <a class="buy-now" href="DatHang.html">THÊM</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                <div class="main-title1" style="margin-top: 50px;">
                    <h2>Mẫu xe mới </h2>
                </div>
                <asp:Repeater ID="rdMoinat" runat="server">
                        <ItemTemplate>
                            <div class="Sanpham1"> <!-- Đảm bảo chỉ có một div cho tất cả sản phẩm -->
                                <div class="product">
                                    <div class="badge">Bán chạy</div>
                                   <asp:Image ID="img" runat="server" ImageUrl='<%# "~/root/image/" + Eval("Anhbia") %>'  />
                                    <h3><%# Eval("Tensp") %></h3>
                                    <p class="mota"><%# Eval("Mota") %></p>
                                    <p class="price"><%# Eval("Giatien", "{0:N0}") %> ₫</p>
                                    <p class="hangxe"><%# Eval("Tenhang") %></p>
                                    <p class="dongxe"><%# Eval("Tendongxe") %></p>
                                    <a class="buy-now" href="DatHang.html">MUA NGAY</a>
                                    <a class="buy-now" href="DatHang.html">THÊM</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                <div class="main-title1">
                    <h1></h1>
                    <h2>Tất cả</h2>
                </div>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="Masp" DataSourceID="SqlDataSource1" Height="680px" Width="1496px" RepeatColumns="3" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        Tensp:
                        <asp:Label ID="TenspLabel" runat="server" Text='<%# Eval("Tensp") %>' />
                        <br />
                        Giatien:
                        <asp:Label ID="GiatienLabel" runat="server" Text='<%# Eval("Giatien") %>' />
                        <br />
                        Mota:
                        <asp:Label ID="MotaLabel" runat="server" Text='<%# Eval("Mota") %>' />
                        <br />
                        Mahang:
                        <asp:Label ID="MahangLabel" runat="server" Text='<%# Eval("Mahang") %>' />
                        <br />
                        Madongxe:
                        <asp:Label ID="MadongxeLabel" runat="server" Text='<%# Eval("Madongxe") %>' />
                        <br />
                        Anhbia:
                        <asp:Image ID="img" runat="server" ImageUrl='<%# "~/root/image/" + Eval("Anhbia") %>' width="300" />

                         <br />
                        <br />
                    </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLoto1ConnectionString %>" SelectCommand="SELECT * FROM [Sanpham]"></asp:SqlDataSource>
            </main>
            

        </div>
        <script src="app.js"></script>
</asp:Content>
