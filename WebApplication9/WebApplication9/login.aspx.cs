using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication9
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra nếu đã có session thì chuyển hướng đến trang phù hợp
            if (Session["UserID"] != null)
            {
                Response.Redirect("TrangChu.aspx");
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=LEGION5;Initial Catalog=QLoto1;User ID=sa;Password=123456;";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Hoten, IDQuyen FROM Nguoidung WHERE Email=@Email AND Matkhau=@Matkhau";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", emailInput.Text.Trim());
                cmd.Parameters.AddWithValue("@Matkhau", passwordInput.Text.Trim());
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Lưu thông tin người dùng vào session
                    Session["username"] = reader["Hoten"].ToString();
                    int userRole = Convert.ToInt32(reader["IDQuyen"]);

                    // Điều hướng tùy thuộc vào IDQuyen
                    if (userRole == 1)
                    {
                        Response.Redirect("/User/Views/TrangChu.aspx");
                    }
                    else if (userRole == 2)
                    {
                        Response.Redirect("/Admin/Views/car.aspx");
                    }
                    else
                    {
                        // Nếu IDQuyen không hợp lệ, bạn có thể xử lý thêm
                        loginError.Text = "User role is invalid.";
                    }
                }
                else
                {
                    // Sai thông tin đăng nhập
                    loginError.Text = "Invalid username or password.";
                }
                con.Close();
            }
        }
        protected void SignUp_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=LEGION5;Initial Catalog=QLoto1;User ID=sa;Password=123456;";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    // Kiểm tra nếu email đã tồn tại
                    string checkQuery = "SELECT COUNT(*) FROM Nguoidung WHERE Email = @Email";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                    checkCmd.Parameters.AddWithValue("@Email", emailInputSignUp.Text.Trim());
                    con.Open();
                    int count = (int)checkCmd.ExecuteScalar();
                    con.Close();

                    if (count > 0)
                    {
                        // Thông báo lỗi nếu email đã tồn tại
                        loginError.Text = "Email đã được sử dụng.";
                        return;
                    }

                    // Thêm người dùng mới
                    string query = "INSERT INTO Nguoidung (Hoten, Email, Dienthoai, Diachi, Matkhau, IDQuyen) VALUES (@Name, @Email, @Phone, @Address, @Password, 1)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", nameInput.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", emailInputSignUp.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", phoneInput.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", addressInput.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", passwordInputSignUp.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Chuyển hướng đến trang đăng nhập
                    Response.Redirect("login.aspx");
                }
                catch (Exception ex)
                {
                    loginError.Text = "Lỗi khi tạo tài khoản: " + ex.Message;
                }
            }
        }
    }
}