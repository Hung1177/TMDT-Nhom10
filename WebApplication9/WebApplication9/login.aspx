<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication9.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="root/css/style.css">
    <title>Modern Login Page | AsmrProg</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container" id="container">
                <div class="form-container sign-up">
                    <div class="cont">
                        <h1>Create Account</h1>
                        <span>or use your email for registration</span>
                        <asp:TextBox ID="nameInput" runat="server" CssClass="input" placeholder="Name"></asp:TextBox>
                        <asp:TextBox ID="emailInputSignUp" runat="server" CssClass="input" TextMode="Email" placeholder="Email"></asp:TextBox>
                        <asp:TextBox ID="phoneInput" runat="server" CssClass="input" placeholder="Phone"></asp:TextBox>
                        <asp:TextBox ID="addressInput" runat="server" CssClass="input" placeholder="Address"></asp:TextBox>
                        <asp:TextBox ID="passwordInputSignUp" runat="server" CssClass="input" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <asp:Button ID="btnSignUp" runat="server" CssClass="btn" Text="Sign Up" OnClick="SignUp_Click" />
                    </div>
                </div>

                <div class="form-container sign-in">
                    <div class="cont">
                        <h1>Sign In</h1>
                        <span>or use your email password</span>
                        <asp:TextBox ID="emailInput" runat="server" CssClass="input" placeholder="Email"></asp:TextBox>
                        <asp:TextBox ID="passwordInput" runat="server" CssClass="input" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <a href="#">Forget Your Password?</a>
                        <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Sign In" OnClick="Login_Click"   />
                        <asp:Label ID="loginError" runat="server" ForeColor="Red" />
                    </div>
                </div>
                <div class="toggle-container">
                    <div class="toggle">
                        <div class="toggle-panel toggle-left">
                            <h1>Welcome Back!</h1>
                            <p>Nhập Email và mật khẩu của bạn để đăng nhập</p>
                            <button class="hidden" id="btnLoginToggle">Sign In</button>
                        </div>
                        <div class="toggle-panel toggle-right">
                            <h1>Hello, Friend!</h1>
                            <p>Nếu bạn không có tài khoản hay nhấn tạo.</p>
                            <button class="hidden" id="btnRegisterToggle">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

<script>
    const container = document.getElementById('container');
    const registerBtn = document.getElementById('btnRegisterToggle');
    const loginBtn = document.getElementById('btnLoginToggle');

    registerBtn.addEventListener('click', (event) => {
        event.preventDefault(); // Ngăn hành vi mặc định của nút
        container.classList.add("active");
    });

    loginBtn.addEventListener('click', (event) => {
        event.preventDefault(); // Ngăn hành vi mặc định của nút
        container.classList.remove("active");
    });

</script>

</body>
</html>
