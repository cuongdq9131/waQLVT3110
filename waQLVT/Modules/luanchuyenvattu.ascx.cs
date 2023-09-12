using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using QLVT.DataEntities;
using QLVT.BusinessEntities;
using QLVT.Common;
using QLVT.DataAccess;

namespace waQLVT.Modules
{
    public partial class luanchuyenvattu : System.Web.UI.UserControl
    {
        int slx;
        int e_txtsl;
        bool kt = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { //do something 
                GetAll();
                if (maloaivt.SelectedValue != "VT")
                {
                    drmavtd.Enabled = true;
                    txtmucdich.Enabled = true;
                    txtnglapphieu.Enabled = true;
                }
                else
                {

                    txtmucdich.Enabled = false;
                    txtnglapphieu.Enabled = false;
                    drmavtd.Enabled = false;
                }
                BindVatTu();
                getVTdetail();
                BindSL();
            }
        }

        public void GetAll()
        {
            XuatVatTuDA xuatvtda = new XuatVatTuDA();
            XuatVatTuData xuatvtdata = new XuatVatTuData();
            xuatvtdata = xuatvtda.GetLuanChuyen();
            gr.DataSource = xuatvtdata;
            gr.DataBind();
            DateTime t = DateTime.Now;
            txtNgayXuat.Text = String.Format("{0:dd/MM/yyyy}", t);

            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            st_GetUserInfoResult user = db.st_GetUserInfo(iduser).FirstOrDefault();
            if (user != null)
            {
                if (user.MaQuyen <= 1) { gr.Columns[0].Visible = true; gr.Columns[10].Visible = true; }

                else
                { gr.Columns[0].Visible = false; gr.Columns[10].Visible = false; }
            }
            xuatvtda.Dispose();
            xuatvtda = null;
            xuatvtdata.Dispose();
            xuatvtdata = null;
        }
        protected void getVTdetail()
        {
            if (drVatTu.SelectedValue.ToString() != "")
            {

                long inVatTuID = long.Parse(drVatTu.SelectedValue.ToString());
                VatTuData vattu1 = new VatTuData();
                VatTuDA vtda = new VatTuDA();
                vattu1 = vtda.GetMaterialDetail(inVatTuID);

                drmavattu.DataSource = vattu1;
                //drmavattu.DataValueField = "VatTuID";
                drmavattu.DataTextField = VatTuData.MAVATTU_FIELD;
                drmavattu.DataBind();

                drmodel.DataSource = vattu1;
                //drmodel.DataValueField = "VatTuID";
                drmodel.DataTextField = VatTuData.MODEL_FIELD;
                drmodel.DataBind();

                drpartno.DataSource = vattu1;
                //drmodel.DataValueField = "VatTuID";
                drpartno.DataTextField = VatTuData.PARTNO_FIELD;
                drpartno.DataBind();
                vattu1.Dispose();
                vattu1 = null;
                vtda.Dispose();
                vtda = null;
            }
            else
            {
                drmavattu.Items.Clear();
                drmodel.Items.Clear();
                drpartno.Items.Clear();
            }
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            long lnVatTuID = 0;
            if (drVatTu.SelectedValue != "")
            {
                lnVatTuID = long.Parse(drVatTu.SelectedValue);
            }

            int donvixuat = int.Parse(drmadvlc.Text);
            int donvinhan = int.Parse(drmadvn.Text);
            int vitridat = int.Parse(drmavtd.Text);
            
            string mucdichxuat = txtmucdich.Text;
            string nglap = txtnglapphieu.Text;
            string kydate = txtNgayXuat.Text;
            DateTime d = DateTime.ParseExact(kydate, "dd/MM/yyyy", null);
            
            if (mucdichxuat == "") { alert.Text = "Bạn chưa nhập mục đích xuất"; }
            else if (txtsl.Text == "")
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

     
                    slx = int.Parse(txtsl.Text);
                    XuatVatTuDA xuatvattuda = new XuatVatTuDA();
                    if (hiSoLuong.Value != "")
                    {
                        if (int.Parse(hiSoLuong.Value) < slx)
                        {
                            kt = false;
                        }
                    }
                    XuatVatTuEntity xvt = new XuatVatTuEntity(lnVatTuID, "", "", "", "", 2, d.ToString(), slx, mucdichxuat, donvixuat, 
                        donvinhan, vitridat, nglap, DateTime.Now, false, "");
                        
                    getVTdetail();
                    BindSL();
                    if (kt)
                    {
                        xuatvattuda.ThemVatTu(xvt);
                        GetAll();
                        BindSL();
                        alert.Text = "Luân chuyển thành công";
                    }
                    else
                    {
                        alert.Text = " Kiểm tra lại số lượng luân chuyển";
                    }

                    xuatvattuda.Dispose();
                    xuatvattuda = null;
                }
            }
           

        }
        protected void btnReset_Click(object sender, EventArgs e)
        {

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
            DateTime engaylc = new DateTime();
            long lnVatTuID = 0;
            GridViewRow row = gr.Rows[e.RowIndex];
            try
            {
                TextBox t_txtsl = (TextBox)row.FindControl("e_txtsl");

                DropDownList drMaVatTu = (DropDownList)row.FindControl("e_drmavt");

                DropDownList t_txtmadonvixuat = (DropDownList)row.FindControl("e_drmadvlc");
                DropDownList t_txtmadonvinhan = (DropDownList)row.FindControl("e_drmadvn");
                DropDownList t_txtmavtd = (DropDownList)row.FindControl("e_drvitridatlc");
                TextBox l = (TextBox)row.FindControl("engayxuat");
                string ethlydate = l.Text;
                try
                {

                    engaylc = DateTime.ParseExact(ethlydate, "dd/MM/yyyy", null);
                   
                    int e_txtmadvx = int.Parse(t_txtmadonvixuat.Text);
                     int e_txtmadvn = int.Parse(t_txtmadonvinhan.Text);
                    int e_txtmavtd = int.Parse(t_txtmavtd.Text);
                    if (t_txtsl.Text == "")
                    {
                        alert.Text = "Chưa nhập số lượng";
                    }
                   
                    else
                    {
                        if (Functions.isInteger(t_txtsl.Text) == false)
                        {
                            alert.Text = "Nhập số lượng kiểu số";
                        }
                        else
                        {
                            if (drMaVatTu.SelectedValue != "")
                            {
                                lnVatTuID = long.Parse(drMaVatTu.SelectedValue);
                            }
                            e_txtsl = int.Parse(t_txtsl.Text);
                            long lnXuatVatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
                            XuatVatTuEntity xvtett = new XuatVatTuEntity(lnVatTuID, "", "", "", "",1, engaylc.ToString(), 
                                e_txtsl, "", e_txtmadvx, e_txtmadvn, e_txtmavtd,"", DateTime.Now, false, "");
                            xvtett.lnXuatVatTuID = lnXuatVatTuID;
                            XuatVatTuDA xuatvtda = new XuatVatTuDA();
                            BindSL();
                            if(kt)
                            {
                                xuatvtda.SuaVatTu(xvtett);
                                gr.EditIndex = -1;
                                GetAll();
                                BindSL();
                                alert.Text = " Cập nhật thành công";
                            }
                            else
                            {
                                alert.Text = "Kiểm tra lại số lượng";
                            }
                            xuatvtda.Dispose();
                            xuatvtda = null;
                        }
                    }
                }
                catch
                {
                    alert.Text = "Kiểm tra lại định dạng ngày";
                }

            }
            catch
            {
                alert.Text = "Lỗi cập nhật";
            }
        }
        protected void gr_Delete(object senderm, GridViewDeleteEventArgs e)
        {
            XuatVatTuDA xuatvtda = new XuatVatTuDA();
            long VatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
            xuatvtda.XoaVatTu(VatTuID);
            GetAll();
            alert.Text = "Xóa thành công";
            xuatvtda.Dispose();
            xuatvtda = null;
        }
        protected void gr_PageChange(object c, GridViewPageEventArgs e)
        {
            gr.PageIndex = e.NewPageIndex;
            GetAll();
        }

        protected void maloaivt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (maloaivt.SelectedValue != "VT")
            {
                drmavtd.Enabled = true;
                txtmucdich.Enabled = true;
                txtnglapphieu.Enabled = true;
            }
            else
            {

                txtmucdich.Enabled = false;
                txtnglapphieu.Enabled = false;
                drmavtd.Enabled = false;
            }
            BindVatTu();
            getVTdetail();
            BindSL();

        }

        protected void maloaivt_Init(object sender, EventArgs e)
        {
            LoaiVatTuDA loaivattuda = new LoaiVatTuDA();
            LoaiVatTuData loaivattudata = new LoaiVatTuData();
            loaivattudata = loaivattuda.GetLoaiVatTu();
            maloaivt.DataSource = loaivattudata;
            maloaivt.DataTextField = LoaiVatTuData.MALOAIVATTU_FIELD;
            maloaivt.DataValueField = LoaiVatTuData.TENLOAIVATTU_FIELD;
            maloaivt.DataBind();

            loaivattuda.Dispose();
            loaivattuda = null;
            loaivattudata.Dispose();
            loaivattudata = null;

        }

        protected void BindVatTu()
        {
            VatTuData vattuData = new VatTuData();
            VatTuDA vattuDA = new VatTuDA();
            string loaivt = (maloaivt.SelectedValue);
            int madonvi = int.Parse(drmadvlc.SelectedValue);
            vattuData = vattuDA.GetVT(loaivt, madonvi);
            drVatTu.DataSource = vattuData;
            drVatTu.DataValueField = VatTuData.IDVATTU_FIELD;
            drVatTu.DataTextField = VatTuData.TENVATTU_FIELD;
            drVatTu.DataBind();

            vattuData.Dispose();
            vattuData = null;

            vattuDA.Dispose();
            vattuDA = null;
            BindSL();

        }


        protected void BindSL()
        {
            if (drVatTu.SelectedValue != "")
            {
                if (Functions.isInteger(drmadvlc.SelectedValue) && Functions.isLong(drVatTu.SelectedValue))
                {

                    int inDonViID = int.Parse(drmadvlc.SelectedValue);
                    long lnVatTuID = long.Parse(drVatTu.SelectedValue);
                    VatTuData vattuData = new VatTuData();
                    VatTuDA vattuda = new VatTuDA();
                    vattuData = vattuda.getVatTuDetailByDonViID(inDonViID, lnVatTuID);

                    int iCount;

                    iCount = vattuData.Tables[VatTuData.VATTU_TABLE].Rows.Count;

                    if (iCount == 0)
                    {
                        lblSoLuongVT.Text = "Chưa có vật tư này trong kho";
                    }
                    else
                    {
                        string sSoLuong = vattuData.Tables[0].Rows[0][VatTuData.SOLUONG_FIELD].ToString();
                        lblSoLuongVT.Text = "Hiện có " + sSoLuong + " vật tư";
                        hiSoLuong.Value = sSoLuong;
                    }

                    vattuData.Dispose();
                    vattuData = null;
                    vattuda.Dispose();
                    vattuda = null;
                }
            }
            else
            {
                lblSoLuongVT.Text = "";
            }
        }

        protected void gr_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[10].Attributes.Add("onclick", "return confirm('Bạn thật sự muốn xóa tin này không?');");
            }
        }

        protected void drmadvlc_Init(object sender, EventArgs e)
        {
            DonViData donviData = new DonViData();
            DonViDA donviDA = new DonViDA();
            donviData = donviDA.GetDonVi();

            drmadvlc.DataSource = donviData;
            drmadvlc.DataTextField = DonViData.TENDONVI_FIELD;
            drmadvlc.DataValueField = DonViData.MADONVI_FIELD;
            drmadvlc.DataBind();

            donviDA.Dispose();
            donviDA = null;

            donviData.Dispose();
            donviData = null;

        }

        protected void drmadvlc_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindVatTu();
            getVTdetail();
            BindSL();
            
        }

        protected void drmadvn_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        protected void drmodel_SelectedIndexChanged(object sender, EventArgs e)
        {
            //getVTdetail();
            BindSL();
        }

        protected void drmavattu_SelectedIndexChanged(object sender, EventArgs e)
        {
            //getVTdetail();
            BindSL();
        }

        protected void drpartno_SelectedIndexChanged(object sender, EventArgs e)
        {
            //getVTdetail();
            BindSL();
        }
        protected void drVatTu_SelectedIndexChanged(object sender, EventArgs e)
        {
            getVTdetail();
            BindSL();
        }
        protected void drmadvn_Init(object sender, EventArgs e)
        {
            DonViData donvidata = new DonViData();
            DonViDA donvida = new DonViDA();
            donvidata = donvida.GetDonVi();
            drmadvn.DataSource = donvidata;
            drmadvn.DataTextField = DonViData.TENDONVI_FIELD;
            drmadvn.DataValueField = DonViData.MADONVI_FIELD;
            drmadvn.DataBind();

            donvida.Dispose();
            donvida = null;
            donvidata.Dispose();
            donvidata = null;
        }
    }
}