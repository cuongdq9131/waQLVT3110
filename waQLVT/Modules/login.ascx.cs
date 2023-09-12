using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLVT.Common;  


namespace waQLVT.Modules
{
    public partial class login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["myCookie"] != null)
                {
                    HttpCookie getCookie = Request.Cookies.Get("myCookie");
                    string sUserName = getCookie.Values["username"].ToString();
                    string sPassword = getCookie.Values["password"].ToString();

                    txtUsername.Text = sUserName;

                    if (sUserName == "")
                        txtUsername.Focus();
                    else
                        txtPassword.Focus();

                    txtPassword.Text = sPassword;

                    chkSaveLogin.Checked = true;
                }
                else
                    chkSaveLogin.Checked = false;  
            }

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string sPassword;
            string sUsername;

            HttpCookie myCookie = new HttpCookie("myCookie");

            sUsername =  Functions.RemoveHTMLTags(txtUsername.Text.Trim());
            sPassword =  Functions.RemoveHTMLTags(txtPassword.Text.Trim());

            MyDBDataContext db = new MyDBDataContext();
            int id = db.st_Login(txtUsername.Text.Trim(), txtPassword.Text.Trim());
            if (id > 0)
            {
                bool IsRemember = chkSaveLogin.Checked;

                if (IsRemember)
                {
                    myCookie.Values.Add("username", sUsername);
                    myCookie.Values.Add("password", "");
                    myCookie.Expires = DateTime.Now.AddDays(15);
                }
                else
                {
                    myCookie.Values.Add("username", string.Empty);
                    myCookie.Values.Add("password", string.Empty);
                    myCookie.Expires = DateTime.Now.AddMinutes(5);
                }

                Session["idlogin"] = id;
                Response.Redirect("~/vattu.aspx");

            }
            else
            {
                Session["IsLoged"] = "No";
                Response.Write("<script>alert('Đăng nhập thất bại');</script>");
            }
        }
    }
}