<%@ Page Title="" Language="C#" MasterPageFile="~/User/Views/Index.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="WebApplication9.User.Views.TrangChu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
           <div class="MainContent">
            <section id="slider">
                <div class="aspect-ratio-169">
                    <img src="image/Banner Number 1.webp" alt="">
                    <img src="image/Drgnfly Banner.jpg" alt="">
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
            <!-- Pin trạm sạc -->
            <div  class="pin-content" >
                <div class="left-column">
                    <a href="pin-tramsac.html">
                    <div  class="card">
                        <img alt="Car charging at a station" height="300px" src="/image/img-fon-end/tramoto.jpg" width="500px"/>
                        <p>
                            Pin &amp; Trạm sạc ô tô điện
                        </p>
                    </div>
                    </a>
                    <a href="pin-tramsac.html">
                    <div  class="card">
                        <img class="img2" alt="Scooter charging at a station" height="400" src="/image/img-fon-end/pinxemay.jpg" width="600"/>
                        <p>
                        Pin &amp; Trạm sạc xe máy điện
                        </p>
                    </div>
                    </a>
                </div>
                <a href="pin-tramsac.html"></a>
                <div  class="right-column">
                    <a href="pin-tramsac.html" style="color: black;">
                    <h2>Thiết bị sạc di động</h2>
                    <p>
                        VinFast cung cấp đa dạng giải pháp sạc để đáp ứng nhu cầu sử dụng của 
                        khách hàng một cách thuận tiện nhất.
                    </p>
                    </a>
                    <a href="pin-tramsac.html">Xem chi tiết</a>
                    <a href="pin-tramsac.html">
                    <img alt="Mobile charging device" height="400" src="/image/img-fon-end/cucsac.png" width="300"/>
                    </a>
                </div>
                </a>
            </div>
            <!-- bảo hành -->
            <div class="baohang">
                <div class="lg:w-1/2">
                    <h1 class="text-3xl font-bold text-gray-800 mb-4">Bảo hành &amp; Dịch vụ</h1>
                    <p class="text-gray-600 mb-6" style="color: aliceblue;">
                        VinFast đã đầu tư nghiêm túc và bài bản để phát triển hệ thống Showroom, 
                        Nhà phân phối và xưởng dịch vụ rộng khắp, đáp ứng tối đa nhu cầu của Khách hàng.
                    </p>
                    <div class="flex space-x-4">
                        <a href="datlich.html">
                        <button  id="xemlich" class="bg-blue-500 text-white px-8 py-2 rounded">Đặt lịch bảo dưỡng</button>
                        </a>
                        <a href="baohang.html">
                        <button id="xemct" class="border border-blue-500 text-blue-500 px-8 py-2 rounded">Chính sách</button>
                        </a>
                    </div>
                </div>
            </div>
            <!-- Tương lai -->
            <div class="tuonglai">
                <div style="position: relative;">
                    <img alt="Car on road surrounded by trees" height="400" src="/image/img-fon-end/xanh1.jpeg" width="1200"/>
                    <div class="text-overlay">
                            <h2>Phủ xanh tương lai</h2>
                        <p>
                            Dự án Phủ xanh Tương lai là minh chứng cho cam kết mạnh mẽ của VinFast hướng tới cuộc cách mạng di chuyển điện hóa và một 
                            tương lai xanh trên toàn cầu. Một trong những mục tiêu của dự án là hiện thực hóa "món quà" từ những khách hàng tiên phong 
                            dành cho môi trường, cùng chung tay kiến tạo một tương lai phát triển bền vững cho tất cả.
                        </p>
                        <a href="#">XEM CHI TIẾT</a>
                    </div>
                </div>
                <div class="sub-content">
                    <div class="sub-item">
                        <img alt="VinFast showroom and charging station" height="400" src="/image/img-fon-end/showroom.jpg" width="600"/>
                        <div class="caption">Showroom &amp; Trạm sạc</div>
                    </div>
                    <div class="sub-item">
                        <img alt="VinFast global community" height="400" src="/image/img-fon-end/congdong.jpg" width="600"/>
                        <div class="caption">Cộng đồng VinFast Toàn cầu</div>
                    </div>
                </div>
               </div>
            <!-- Email -->
</asp:Content>
