using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLVT.BusinessAccess;
using QLVT.DataEntities;
using QLVT.BusinessEntities;
using QLVT.Common;
using QLVT.DataAccess;

namespace waQLVT.Modules
{
    public partial class travattu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { //do something 
                GetAll();               
                BindVatTu();               
                getVTdetail();
                BindSL();
            }
        }
        public void GetAll()
        {
            TraVeAccess dta = new TraVeAccess();
            TraVeData qdata = new TraVeData();       
            qdata = dta.LayDuLieu();
            gr.DataSource = qdata;
            gr.DataBind();
            DateTime t = DateTime.Now;
            txtNgayXuat.Text = String.Format("{0:dd/MM/yyyy}", t);
            gr.Focus();

            //////////
            getVTdetail();
            /*************************
             * Phan Quyen
             * ***********************/
            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            st_GetUserInfoResult user = db.st_GetUserInfo(iduser).FirstOrDefault();
            if (user != null)
            {
                if (user.MaQuyen <= 1) { gr.Columns[0].Visible = true; gr.Columns[8].Visible = true; }

                else
                { gr.Columns[0].Visible = false; gr.Columns[8].Visible = false; }
            }
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            
                string tenvattu = (drvattu.Text);
                string mavattu = drmavattu.Text;
                string part = drpartno.Text;
                string model = drmodel.Text;
                int tendonvi = int.Parse(drmadvn.Text);
                string xuatdate = txtNgayXuat.Text;
                string tt = drtinhtrang.SelectedValue;
                DateTime d = DateTime.ParseExact(xuatdate, "dd/MM/yyyy", null);
                if (mavattu == "") mavattu = "a";
                if (part == "") part = "a";
                if (model == "") model = "a";    
                
                if (txtsl.Text == "")
                {
                    alert.Text = " Bạn chưa nhập số lượng";

                }
                else
                {
                    if (Functions.isInteger(txtsl.Text) == false)
                    {
                        alert.Text = "Nhập số lượng kiểu số";
                    }
                    else
                    {
                        int slx = int.Parse(txtsl.Text);
                        TraVeAccess dta = new TraVeAccess();
                        TraVeEntity xvt = new TraVeEntity(2,tenvattu, mavattu,part,model, tt,2, d.ToString(), slx, tendonvi, DateTime.Now, DateTime.Now);
                        dta.ThemVatTu(xvt);
                        GetAll();
                        BindSL();
                        alert.Text = "Thêm thành công";
                    }
                }
            
           
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
            TraVeAccess nhapvtda = new TraVeAccess();
            GridViewRow row = gr.Rows[e.RowIndex];

            DropDownList t_txtmavt = (DropDownList)row.FindControl("e_drmavt");
            DropDownList t_txttenvt = (DropDownList)row.FindControl("e_drtenvt");
            DropDownList t_txtpartno = (DropDownList)row.FindControl("e_drpartno");
            DropDownList t_txtmodel = (DropDownList)row.FindControl("e_drmodel");
            DropDownList t_txttrangthai = (DropDownList)row.FindControl("e_drtinhtrang");
            TextBox t_txtsl = (TextBox)row.FindControl("e_txtsl");
            DropDownList t_txtmadonvi = (DropDownList)row.FindControl("e_drmadvlc");
            TextBox l = (TextBox)row.FindControl("engaynhap");
            string ethlydate = l.Text;           
            try
            {
                
                DateTime d = DateTime.ParseExact(ethlydate, "dd/MM/yyyy", null);
                //////
                //DropDownList t_txtmavtd = (DropDownList)row.FindControl("e_drvitridat");
               
                
                int e_txtmadv = int.Parse(t_txtmadonvi.Text);
                if (t_txtsl.Text == "")
                {
                    alert.Text = " Bạn chưa nhập số lượng";
                }
                else if (Functions.isInteger(t_txtsl.Text) == false)
                {
                    alert.Text = "Nhập số lượng kiểu số";
                }
                else
                {
                    string e_txtmavt = t_txtmavt.Text;
                    string e_txttenvt = t_txttenvt.Text;
                    string e_txtpartno = t_txtpartno.Text;
                    string e_txtmodel = t_txtmodel.Text;
                    string e_tinhtrang = t_txttrangthai.Text;
                    int e_txtsl = int.Parse(t_txtsl.Text);
                    if (e_txtmavt == "") e_txtmavt = "a";
                    if (e_txtpartno == "") e_txtpartno = "a";
                    if (e_txtmodel == "") e_txtmodel = "a"; 
                    long VatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
                    TraVeEntity xvtett = new TraVeEntity(VatTuID,e_txttenvt, e_txtmavt, e_txtpartno, e_txtmodel,e_tinhtrang,1, d.ToString(),
                        e_txtsl, e_txtmadv, DateTime.Now, DateTime.Now);
                    nhapvtda.Update(xvtett);

                    gr.EditIndex = -1;
                    GetAll();
                    BindSL();
                    alert.Text = "Cập nhật thành công";
                }
            }
            catch
            {
                alert.Text = "Kiểm tra định dạng ngày";
            }
        }

        protected void gr_PageChange(object c, GridViewPageEventArgs e)
        {
            gr.PageIndex = e.NewPageIndex;
            GetAll();
        }

        protected void gr_Delete(object senderm, GridViewDeleteEventArgs e)
        {
            TraVeAccess xuatvtda = new TraVeAccess();
            long VatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
            xuatvtda.Delete(VatTuID);
            GetAll();
            alert.Text = "Xóa thành công";
        }

        protected void maloaivt_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindVatTu();
            BindSL();
        }
        protected void BindVatTu()
        {
            VatTuData vattu = new VatTuData();
            VatTuAccess vtaccess = new VatTuAccess();
           string loaivt = (maloaivt.SelectedValue);
           int madonvi = int.Parse(drmadvn.SelectedValue);
           vattu = vtaccess.LayDuLieu(loaivt, madonvi);
            drvattu.DataSource = vattu;
            drvattu.DataValueField = "TenVatTu";
            drvattu.DataTextField = "TenVatTu";
            drvattu.DataBind();           
        }

        protected void drvattu_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            getVTdetail();
            BindSL();
        }
        protected void BindSL()
        {
            if (drvattu.Text != "")
            {
                string vatuid = (drvattu.Text);
                string ma = drmavattu.Text;
                string part = drpartno.Text;
                string model = drmodel.Text;

                if (ma == "")
                {
                    ma = "a";}
                if (part == "") { part = "a"; }
                if (model == "") { model = "a"; }
                
                int madonvi = int.Parse(drmadvn.SelectedValue);
                VatTuData vattu1 = new VatTuData();
                VatTuAccess vtaccess1 = new VatTuAccess();
                vattu1 = vtaccess1.LaySoLuong(vatuid,ma,part,model,madonvi);

                DropDownList d = new DropDownList();
                d.DataSource = vattu1;
                d.DataTextField = "SL";
                d.DataValueField = "SL";
                d.DataBind();

                tclb.Text = "Hiện có " + d.Text + " vật tư";
                //if ((int.Parse(d.Text)) == 0)
                //{
                //    alert.Text = "Bạn không thể xuất";
                //}
                //else
                //{
                //    alert.Text = "";
                //}
            }
            else
            {
                tclb.Text = "";
                alert.Text = "Chưa có vật tư ở đơn vị này";
            }
        }
        protected void getVTdetail()
        {
            if (drvattu.Text != "")
            {
                string vattuid = (drvattu.Text);
                int madonvi = int.Parse(drmadvn.SelectedValue);
                VatTuData vattu1 = new VatTuData();
                VatTuDA vtaccess1 = new VatTuDA();
                vattu1 = vtaccess1.GetMaterialDetail(vattuid, madonvi);

                drmavattu.DataSource = vattu1;
                //drmavattu.DataValueField = "VatTuID";
                drmavattu.DataTextField = "MaVatTu";
                drmavattu.DataBind();

                drmodel.DataSource = vattu1;
                //drmodel.DataValueField = "VatTuID";
                drmodel.DataTextField = "Model";
                drmodel.DataBind();

                drpartno.DataSource = vattu1;
                //drmodel.DataValueField = "VatTuID";
                drpartno.DataTextField = "Part_No";
                drpartno.DataBind();
            }
        }

        protected void gr_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[8].Attributes.Add("onclick", "return confirm('Bạn thật sự muốn xóa tin này không?');");
            }
        }

        protected void drmadvn_Init(object sender, EventArgs e)
        {
            DonViData dv = new DonViData();
            DonViAccess dvac = new DonViAccess();
            dv = dvac.LayDuLieu();
            drmadvn.DataSource = dv;
            drmadvn.DataTextField = "TenDonVi";
            drmadvn.DataValueField = "MaDonVi";
            drmadvn.DataBind();
        }

        protected void drmadvn_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindVatTu();
            
            getVTdetail();
            BindSL();
        }

        protected void drmodel_SelectedIndexChanged(object sender, EventArgs e)
        {
            //getVTdetail();
            BindSL();
        }

        protected void drmavattu_SelectedIndexChanged(object sender, EventArgs e)
        {
            //etVTdetail();
            BindSL();
        }

        protected void drpartno_SelectedIndexChanged(object sender, EventArgs e)
        {
            //getVTdetail();
            BindSL();
        }
           
        
    }
}