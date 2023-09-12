using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLVT.Common;

namespace waQLVT.Modules
{
    public partial class menutop : System.Web.UI.UserControl
    {

        string m_sFullName = "";

        int m_inStatusCur = 0;

        public int StatusCur
        {
            get
            {
                return m_inStatusCur;
            }

            set
            {
                m_inStatusCur = value;
            }
        }

        public string FullName
        {
            get
            {
                return m_sFullName;
            }

            set
            {
                m_sFullName = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sCurDate;
                string[] Days = new string[] { };

                Functions.initDays(ref Days, Languages.VietNam);

                sCurDate = Days[(int)DateTime.Today.DayOfWeek] + ", ngày: " + Functions.ChangeDate(DateTime.Today.ToShortDateString());

                ltrCurDate.Text = sCurDate;

                if (m_sFullName == "")
                {
                    ltrHoTen.Text = "";
                    ltrChangePass.Text = "";
                }
                else
                {
                    ltrHoTen.Text = "Chào bạn:&nbsp;<B>" + m_sFullName + "</B><A class = 'signout' href = \"Default.aspx?mod=signout\">&nbsp;&nbsp;(Thoát)&nbsp;&nbsp;</A>";

                    if (m_inStatusCur == 0)
                        ltrChangePass.Text = "<A class = 'changepass' href = \"Default.aspx?mod=changepass\">(Đổi mật khẩu)</A>&nbsp;&nbsp;";
                    else
                        ltrChangePass.Text = "<A class = 'changepass' href = \"Default.aspx\">(Trang chủ)</A>&nbsp;&nbsp;";
                }
            }
        }
    }
}