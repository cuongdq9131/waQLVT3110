using System;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLVT.DataAccess;
using QLVT.DataEntities;
using QLVT.BusinessEntities;

namespace waQLVT.Modules
{
    public partial class donvi : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { //do something 
                GetAll();
            }
        }
        public void GetAll()
        {
            DonViDA donvida = new DonViDA();
            DonViData donvidata = new DonViData();
            donvidata = donvida.GetDonVi();
            gr.DataSource = donvidata;
            gr.DataBind();

            /*********************
             ******************/
            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            st_GetUserInfoResult user = db.st_GetUserInfo(iduser).FirstOrDefault();
            if (user != null)
            {
                if (user.MaQuyen <= 1) { gr.Columns[0].Visible = true; gr.Columns[7].Visible = true; }

                else
                { gr.Columns[0].Visible = false; gr.Columns[7].Visible = false; }
            }

            donvida.Dispose();
            donvida = null;
            donvidata.Dispose();
            donvidata = null;

        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            DonViDA donvida = new DonViDA();

            string maldv = txtmldv.Text;
            string tendv = txttendv.Text;
            DonViEntity et = new DonViEntity(maldv,tendv,1,DateTime.Now,DateTime.Now);

            donvida.ThemDonVi(et);
            GetAll();

            donvida.Dispose();
            donvida = null;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtmldv.Text = "";
            txttendv.Text = "";
        }

        protected void gr_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gr.EditIndex = e.NewEditIndex;
            GetAll();
        }

        protected void gr_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gr.EditIndex = -1;
            GetAll();
        }
        protected void gr_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DonViDA dvda = new DonViDA();
            GridViewRow row = gr.Rows[e.RowIndex];

            
            TextBox t_txtmalvt = (TextBox)row.FindControl("e_maldv");
            TextBox t_txttenvt = (TextBox)row.FindControl("e_tendv");
           
            string e_txtmalvt = t_txtmalvt.Text;
            string e_txttenvt = t_txttenvt.Text;

            int DonViID = int.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
            DonViEntity et = new DonViEntity(e_txtmalvt, e_txttenvt, 1, DateTime.MinValue, DateTime.Now);
            et.lnDonViID = DonViID;
            dvda.CapNhatDonVi(et);
            gr.EditIndex = -1;
            GetAll();

            dvda.Dispose();
            dvda = null;
        }

        protected void gr_Delete(object senderm, GridViewDeleteEventArgs e)
        {
            DonViDA donvida = new DonViDA();
            int dvID = int.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
            donvida.XoaDonVi(dvID);
            GetAll();
            donvida.Dispose();
            donvida = null;
        }
        protected void gr_PageChange(object c, GridViewPageEventArgs e)
        {
            gr.PageIndex = e.NewPageIndex;
            GetAll();
        }

        protected void gr_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[7].Attributes.Add("onclick", "return confirm('Bạn thật sự muốn xóa tin này không?');");
            }
        }

       
    }
}