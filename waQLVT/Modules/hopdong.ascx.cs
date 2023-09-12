using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using QLVT.DataEntities;
using QLVT.BusinessEntities;
using QLVT.DataAccess;

namespace waQLVT.Modules
{
    public partial class hopdong : System.Web.UI.UserControl
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
            HopDongDA hopdongda = new HopDongDA();
            HopDongData hopdongdata = new HopDongData();
            hopdongdata = hopdongda.GetHD();
            gr.DataSource = hopdongdata;
            gr.DataBind();
            DateTime t = DateTime.Now;
            txtNgayKy.Text = String.Format("{0:dd/MM/yyyy}", t);

            ///////
            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            st_GetUserInfoResult user = db.st_GetUserInfo(iduser).FirstOrDefault();
            if (user != null)
            {
                if (user.MaQuyen <= 1) { gr.Columns[0].Visible = true; gr.Columns[6].Visible = true; }

                else
                { gr.Columns[0].Visible = false; gr.Columns[6].Visible = false; }
            }

            hopdongda.Dispose();
            hopdongda = null;
            hopdongdata.Dispose();
            hopdongdata = null;
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            HopDongDA hopdongda = new HopDongDA();

            string maldv = mahopdong.Text;
           
            string kydate = txtNgayKy.Text;
            DateTime d = DateTime.ParseExact(kydate, "dd/MM/yyyy", null);
            if (maldv == "")
            {
                alert.Text = "Cần nhập đầy đủ thông tin";
            }
            else
            {
                HopDongEntity et = new HopDongEntity(1, maldv, d.ToString(), DateTime.Now, DateTime.Now, 1);
                hopdongda.ThemHopDong(et);
                GetAll();
                alert.Text = "Thêm thành công";
            }
            hopdongda.Dispose();
            hopdongda = null;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            mahopdong.Text = "";
            
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
            
            GridViewRow row = gr.Rows[e.RowIndex];


            TextBox t_txtmahd = (TextBox)row.FindControl("e_mahd");
            string e_txtmahd = t_txtmahd.Text.TrimEnd();
             
            TextBox txtNgayKy = (TextBox)row.FindControl("engayky");
            string ekydate = txtNgayKy.Text;
            try
            {
            DateTime d = DateTime.ParseExact(ekydate, "dd/MM/yyyy", null);
           
                if (e_txtmahd == "")
                {
                    alert.Text = "Cần nhập đầy đủ thông tin cập nhật";
                }
                else
                {
                    HopDongDA hopdongda = new HopDongDA();
                    long HopDongID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
                    HopDongEntity et = new HopDongEntity(HopDongID, e_txtmahd, d.ToString(), DateTime.Now, DateTime.Now, 1);
                    hopdongda.CapNhatHD(et);
                    gr.EditIndex = -1;
                    GetAll();
                    alert.Text = "Cập nhật thành công";
                    hopdongda.Dispose();
                    hopdongda = null;
                }
            }
            catch
            {
                alert.Text = "Kiểm tra định dạng ngày";
            }
        }

        protected void gr_Delete(object senderm, GridViewDeleteEventArgs e)
        {
            HopDongDA hopdongda = new HopDongDA();
            long dvID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
            hopdongda.XoaHopDong(dvID);
            GetAll();
            alert.Text = "Xóa thành công";
            hopdongda.Dispose();
            hopdongda = null;
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
                e.Row.Cells[6].Attributes.Add("onclick", "return confirm('Bạn thật sự muốn xóa tin này không?');");
            }
        }
    }
}