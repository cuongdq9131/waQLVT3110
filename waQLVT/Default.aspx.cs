using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using waQLVT.Modules;

namespace waQLVT
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string m_sMode = "";

            if (Request.QueryString["mod"] == null)
                m_sMode = "";
            else
                m_sMode = Request.QueryString["mod"].ToString().Trim();

            switch (m_sMode)
            {
                case "signout":
                    Session["IsLoged"] = "No";
                    Session.Abandon();

                    Login.Controls.Add(Page.LoadControl("Modules/login.ascx"));

                    break; 
                case "changepass":
                    Login.Controls.Add(Page.LoadControl("Modules/changepassword.ascx"));

                    break;
                default:

                    Login.Controls.Add(Page.LoadControl("Modules/login.ascx"));

                    break; 
            }
        }
    }
}