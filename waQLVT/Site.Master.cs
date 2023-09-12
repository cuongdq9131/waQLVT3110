using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using QLVT.DataAccess;
using waQLVT.Modules;

namespace waQLVT
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        bool success = false;
        bool up = false;
        public static void ShowAlert(string stMsg)
        {
            string stScript = " <script language='javascript'> " +
                " alert('" + stMsg + "'); " +
                " history.go(-1) " +
                " </script> ";
            HttpContext.Current.Response.Write(stScript);
        }
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
                menutop ctlMenuTop = Page.LoadControl("Modules/menutop.ascx") as menutop;
                ctlMenuTop.FullName = user.HoTen;
                phMenuTop.Controls.Add(ctlMenuTop);
            }

            CreateMenuControl();
            if (up)
            {
                updateTonCuoi();
            }
        }

        

        protected void lkbt_SignOut_Click(object sender, EventArgs e)
        {
            Session["IsLoged"] = "No";
            Session.Abandon();
            Response.Redirect("~/default.aspx");
        }

        protected void lnkBtn_DoiMatKhau_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ChangePassword.aspx");
        }

        protected void lnkBtn_Vattu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/vattu.aspx");
        }

        
        protected void updateTonCuoi()
        {
               SqlDataAdapter dsCommand = new SqlDataAdapter();
                dsCommand.SelectCommand = new SqlCommand();
                dsCommand.SelectCommand.Connection = new SqlConnection(MaterialConfiguration.ConnectionString);
                SqlCommand command = dsCommand.SelectCommand;

                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "updateTonCuoi";
                command.Connection.Open();
                command.ExecuteNonQuery();
                success = true;
                command.Connection.Close();
            
        }
        protected void checkDate()
        {
            if (((DateTime.Now.ToString("d") == "1") && (DateTime.Now.ToString("M") == "4"))||  
                ((DateTime.Now.ToString("d") == "1") && (DateTime.Now.ToString("M") == "9"))||
                ((DateTime.Now.ToString("d") == "1") && (DateTime.Now.ToString("M") == "10"))||
                ((DateTime.Now.ToString("d") == "1") && (DateTime.Now.ToString("M") == "11")))
            {
                up = true;
            }
        }

        private void CreateMenuControl()
        {
            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            st_GetUserInfoResult user = db.st_GetUserInfo(iduser).FirstOrDefault();
            if (user != null)
            {
                if (user.MaQuyen == 0)
                    sm1.SiteMapProvider = "admin";
                else if (user.MaQuyen > 1)
                {
                    sm1.SiteMapProvider = "manager";
                }
                else
                    sm1.SiteMapProvider = "user";
            }
            
        }
        
    }
}
