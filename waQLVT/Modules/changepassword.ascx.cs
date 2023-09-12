using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace waQLVT.Modules
{
    public partial class changepassword : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["idlogin"])))
            {
                Response.Redirect("~/default.aspx");
            }
            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            st_GetUserInfoResult user = db.st_GetUserInfo(iduser).FirstOrDefault();
            if (user != null)
            {
                txtUsername.Text = user.DangNhap;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtNewpassword.Text.Trim() != txtConfirm.Text.Trim())
            {
                Response.Write("<script>alert('Xác nhận mật khẩu không đúng');</script>");
                return;
            }

            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            int kq = db.st_changePassword(iduser, txtPassword.Text.Trim(), txtNewpassword.Text.Trim());
            if (kq == -1)
            {
                Response.Write("<script>alert('Mật khẩu cũ không đúng');</script>");
                return;
            }
            if (kq == 0)
            {
                Response.Write("<script>alert('Phát sinh lỗi. Không thể đổi mật khẩu vào lúc này');</script>");
                return;
            }
            else
            {
                //Response.Write("<script>alert('Đổi mật khẩu thành công');</script>");
                Response.Redirect("~/NhapVatTu.aspx");
                return;
            }
        }
    }
}