using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLVT.DataAccess;
using QLVT.DataEntities;

using QLVT.BusinessEntities;
using System.Data.SqlClient;
using System.Collections;

namespace waQLVT.Modules
{
    public partial class nguoidung : System.Web.UI.UserControl
    {
        int curr_page = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { //do something 
                GetAll();

            }
        }


        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            NguoiDungDA userda = new NguoiDungDA();
            int maUser = int.Parse(txtmnd.Text.Trim());
            string hoten = txthoten.Text.Trim();
            string tendn = txttendn.Text.Trim();
            string pass = txtpass.Text.Trim();
            int mann = 0;
            if (txtmanguoinhap.Text != "")
              mann = int.Parse(txtmanguoinhap.Text.Trim());
            else 
              mann = 0;
            string sodt = txtdienthoai.Text.Trim();
            string email = txtemail.Text.Trim();
            string diachi = txtdiachi.Text.Trim();
            bool iactive = false;
            if (rdlActive.Checked)
                iactive = true;
            else if (rdlAndanh.Checked)
                iactive = false;
            int quyen = 0;
            if (drquyen.Text.Trim() == "admin")
                quyen = 3;
            else if (drquyen.Text.Trim() == "manager")
                quyen = 2;
            else if (drquyen.Text.Trim() == "user")
                quyen = 1;

            //DateTime ngaynhap = ngaythanhly.SelectedDate;
            NguoiDungEntity nt = new NguoiDungEntity(maUser, hoten, tendn, pass, sodt, email, diachi, iactive, quyen, DateTime.Now, DateTime.Now, mann);
            userda.ThemNguoiDung(nt);
            GetAll();
            userda.Dispose();
            userda = null;

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            //txtmvt.Text = "";
            //txtpartno.Text = "";
            //txtsl.Text = "";
            //txttenvt.Text = "";



        }

        public bool GetShow(object objDate)
        {
            bool retVal;

            switch (objDate.ToString())
            {
                case "True":
                    retVal = true;
                    break;
                case "False":
                    retVal = false;
                    break;
                default:
                    retVal = false;
                    break;
            }

            return retVal;
        }

        public void GetAll()
        {
            NguoiDungDA userda= new NguoiDungDA();
            NguoiDungData userdata = new NguoiDungData();
            userdata = userda.GetND();
            gr.DataSource = userdata;
            gr.DataBind();

            userda.Dispose();
            userda = null;
            userdata.Dispose();
            userda = null;

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

            TextBox t_txtmauser = (TextBox)row.FindControl("e_txtmauser");
            TextBox t_txtht = (TextBox)row.FindControl("e_txtht");
            TextBox t_txtdn = (TextBox)row.FindControl("e_txtdn");
            TextBox t_txtmk = (TextBox)row.FindControl("e_txtmk");
            TextBox t_txtsdt = (TextBox)row.FindControl("e_txtsdt");
            TextBox t_txtemail = (TextBox)row.FindControl("e_txtemail");
            TextBox t_txtdc = (TextBox)row.FindControl("e_txtdc");
            DropDownList t_txtquyen = (DropDownList)row.FindControl("e_txtquyen");
            CheckBox c_Active = (CheckBox)row.FindControl("chkBox_Active");

            TextBox l = (TextBox)row.FindControl("engaytao");
            string ethlydate = l.Text;
            DateTime d = DateTime.ParseExact(ethlydate, "dd/MM/yyyy", null);

            TextBox t_txtmanhap = (TextBox)row.FindControl("e_txtmanhap");

            int e_txtmauser = int.Parse(t_txtmauser.Text);
            string e_txtht = t_txtht.Text;
            string e_txtdn = t_txtdn.Text;
            string e_txtmk = t_txtmk.Text;
            string e_txtsdt = t_txtsdt.Text;
            string e_txtemail = t_txtemail.Text;
            string e_txtdc = t_txtdc.Text;
            int e_txtquyen = int.Parse(t_txtquyen.Text);
            bool chkBox_Active = false;
            if (c_Active.Checked)
                chkBox_Active = true;
            int e_txtmanhap = int.Parse(t_txtmanhap.Text);

            NguoiDungEntity entt = new NguoiDungEntity(e_txtmauser, e_txtht, e_txtdn, e_txtmk, e_txtsdt, e_txtemail, e_txtdc, chkBox_Active, e_txtquyen, d, DateTime.Now, e_txtmanhap);
            NguoiDungDA userda = new NguoiDungDA();
            userda.UpdateNguoidung(entt);

            gr.EditIndex = -1;
            GetAll();
            userda.Dispose();
            userda = null;
        }

        protected void gr_Delete(object senderm, GridViewDeleteEventArgs e)
        {
            NguoiDungDA userda = new NguoiDungDA();
            long UserID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
            userda.XoaNguoidung(UserID);
            GetAll();

            userda.Dispose();
            userda = null;
        }

        protected void gr_PageChange(object c, GridViewPageEventArgs e)
        {
            gr.PageIndex = e.NewPageIndex;
            gr.DataBind();
        }

        protected void gr_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[14].Attributes.Add("onclick", "return confirm('Bạn thật sự muốn xóa người dùng này không?');");
            }
        }
    }
}