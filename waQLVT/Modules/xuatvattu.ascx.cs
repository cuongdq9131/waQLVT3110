using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using QLVT.DataAccess;
using QLVT.DataEntities;
using QLVT.Common;
using QLVT.BusinessEntities;
using System.Collections;
namespace waQLVT.Modules
{
    public partial class xuatvattu : System.Web.UI.UserControl
    {
        int slx;
        int e_slx;
        bool kt = true;//ktradieukiensoluong
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { //do something 
                GetAll();
                BindVatTu();
                getVTdetail();
                BindSL();
                if (maloaivt.SelectedValue != "VT")
                {
                    drmavtd.Enabled = true;
                }
                else
                {
                    drmavtd.Enabled = false;
                }
            }
        }
        public void GetAll()
        {
            XuatVatTuDA xuatda = new XuatVatTuDA();
            XuatVatTuData xuatdata = new XuatVatTuData();
            xuatdata = xuatda.GetXuatVatTu();
            gr.DataSource = xuatdata;
            gr.DataBind();
            DateTime t = DateTime.Now;
            txtNgayXuat.Text = String.Format("{0:dd/MM/yyyy}", t);
            
            /*************************
             * Phan Quyen
             * ***********************/
            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            st_GetUserInfoResult user = db.st_GetUserInfo(iduser).FirstOrDefault();
            if (user != null)
            {
                if (user.MaQuyen <= 1) { gr.Columns[0].Visible = true; gr.Columns[9].Visible = true; }

                else
                { gr.Columns[0].Visible = false; gr.Columns[9].Visible = false; } 
            }

            xuatda.Dispose();
            xuatdata.Dispose();
            xuatdata = null;
            xuatda = null;
           /////////////////////////////////////////////  
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            long lnVatTuID = 0;
            if (drVatTu.SelectedValue != "")
            {
                lnVatTuID = long.Parse(drVatTu.SelectedValue);
            }
            int donvinhan = int.Parse(drmadvn.Text);
            int vitridat = int.Parse(drmavtd.Text);
            string xuatdate = txtNgayXuat.Text;
            string sSoChungTu = Functions.RemoveHTMLTags(txtSoChungTu.Text.TrimEnd());
            try
            {
                if (txtsl.Text == "") { alert.Text = "Vui lòng kiểm tra lại thông tin"; }           
                else
                {
                    if (Functions.isInteger(txtsl.Text.Trim()) == false)
                    {
                        alert.Text = "Nhập số lượng kiểu số";
                    }
                    else
                    {
                        slx = int.Parse(txtsl.Text);
                        if (hiSoLuong.Value != "")
                        {
                            if (int.Parse(hiSoLuong.Value) < slx)
                            {
                                kt = false;
                            }
                        }
                        DateTime d = DateTime.ParseExact(xuatdate, "dd/MM/yyyy", null);

                        XuatVatTuDA xuatvattuda = new XuatVatTuDA();
                        XuatVatTuEntity xvt = new XuatVatTuEntity(lnVatTuID,"", "", "", "",1, d.ToString(), slx, "", Convert.ToInt32(MaDonVi.mKho), 
                            donvinhan, vitridat,"", DateTime.Now, true, sSoChungTu);

                        getVTdetail();
                        BindSL();

                        if (kt)
                        {
                            xuatvattuda.ThemVatTu(xvt);
                            GetAll();
                            BindSL();
                            alert.Text = "Xuất thành công ";
                        }
                        else
                        {
                            alert.Text = "Bạn không thể xuất, kiểm tra lại giá trị xuất";
                            kt = true;
                        }
                        xuatvattuda.Dispose();
                        xuatvattuda = null;
                    }
                }
            }
            catch
            {
                alert.Text = "Lỗi xuất vật tư";
            }             
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
            DateTime engaytl = new DateTime();
            long lnVatTuID = 0;
            int inMaDonViNhan = 0;
            int inMaViTriDat = 0;
            GridViewRow row = gr.Rows[e.RowIndex];
            try
            {
                DropDownList drMaVatTu = (DropDownList)row.FindControl("e_drmavt");

                TextBox t_txtsl = (TextBox)row.FindControl("e_txtsl");
                 TextBox txtSoChungTu = (TextBox)row.FindControl("eSoChungTu");

                DropDownList drmadonvinhan = (DropDownList)row.FindControl("e_drmadvn");
                DropDownList drmavtd = (DropDownList)row.FindControl("e_drvitridat");
                TextBox l = (TextBox)row.FindControl("engaynhap");
                string ethlydate = l.Text;
                try
                {
                   engaytl = DateTime.ParseExact(ethlydate, "dd/MM/yyyy", null);

                   if (drMaVatTu.SelectedValue != "")
                   {
                       lnVatTuID = long.Parse(drMaVatTu.SelectedValue);
                   }
                    if(drmadonvinhan.Text!="")
                        inMaDonViNhan = int.Parse(drmadonvinhan.SelectedValue);
                    if(drmavtd.SelectedValue!="")
                        inMaViTriDat = int.Parse(drmavtd.SelectedValue);
                    string sSoChungTu = Functions.RemoveHTMLTags(txtSoChungTu.Text.Trim());
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
                           e_slx = int.Parse(t_txtsl.Text);
                           

                           long lnXuatVatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
                           XuatVatTuEntity xvtett = new XuatVatTuEntity(lnVatTuID,"", "", "", "", 1,engaytl.ToString(),
                               e_slx, "", 1, inMaDonViNhan, inMaViTriDat, "admin", DateTime.Now, true, sSoChungTu);

                           xvtett.lnXuatVatTuID = lnXuatVatTuID;

                           XuatVatTuDA xuatvtda = new XuatVatTuDA();
                           BindSL();
                          
                            xuatvtda.SuaVatTu(xvtett);
                            gr.EditIndex = -1;
                            GetAll();
                            BindSL();
                            alert.Text = "Cập nhật thành công";
                           
                           xuatvtda.Dispose();
                           xuatvtda = null;
                       }
                   }   
                   
                }
                catch
                {
                    alert.Text = "Lỗi, kiểm tra lại thông tin";
                }
                
            }
            catch
            {
                alert.Text = "Cập nhật vật tư";
            }
        }

        protected void gr_Delete(object senderm, GridViewDeleteEventArgs e)
        {
            try
            {
                XuatVatTuDA xuatvtda = new XuatVatTuDA();
                long VatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
                xuatvtda.XoaVatTu(VatTuID);
                GetAll();
                BindSL();
                alert.Text = "Xóa thành công";
                xuatvtda.Dispose();
                xuatvtda = null;
            }
            catch
            {
                alert.Text = "Xóa thất bại";
            }
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
            }
            else
            {
                drmavtd.Enabled = false;
            }
            BindVatTu();
            getVTdetail();
            BindSL();
        }
        protected void BindVatTu()
        {
            VatTuData vattuData = new VatTuData();
            VatTuDA vattuDA = new VatTuDA();
            string loaivt = (maloaivt.SelectedValue);
            int makho = int.Parse(drkho.SelectedValue);

            vattuData = vattuDA.GetVTKho(loaivt, makho);
            drVatTu.DataSource = vattuData;
            drVatTu.DataValueField = VatTuData.IDVATTU_FIELD;
            drVatTu.DataTextField = VatTuData.TENVATTU_FIELD;
            drVatTu.DataBind();

            vattuData.Dispose();
            vattuData = null;

            vattuDA.Dispose();
            vattuDA = null;
        }

        
        protected void BindSL()
        {
            if (drVatTu.SelectedValue != "")
            {

                long inVatTuID = long.Parse(drVatTu.SelectedValue.ToString());
                VatTuData vattuData = new VatTuData();
                VatTuDA vattuda = new VatTuDA();
                vattuData = vattuda.GetMaterialDetail(inVatTuID);

                int i;
                int iCount;

                iCount = vattuData.Tables[VatTuData.VATTU_TABLE].Rows.Count;

                if (iCount == 0)
                {
                    lblSoLuongVT.Text = "Chưa có vật tư này trong kho";
                }
                else
                {
                    string sSoLuong = (vattuData.Tables[0].Rows[0][VatTuData.TONCUOIKY_FIELD]).ToString();
                    lblSoLuongVT.Text = "Hiện có " + sSoLuong + " vật tư";
                    hiSoLuong.Value = sSoLuong;
                }

                vattuData.Dispose();
                vattuData = null;
                vattuda.Dispose();
                vattuda = null;
            }
            else
            {
                lblSoLuongVT.Text = "";
            }
            
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
        

        protected void gr_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[9].Attributes.Add("onclick", "return confirm('Bạn thật sự muốn xóa tin này không?');");
            }
        }

        protected void drkho_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindVatTu();
            getVTdetail();
            BindSL();
        }

        protected DonViData GetAllDonVi()
        {
            DonViData donviData = new DonViData();
            DonViDA donviDA = new DonViDA();
            donviData = donviDA.GetDonVi();

            donviDA.Dispose();
            donviDA = null;
            donviData.Dispose();
            donviData = null;
            return donviData;
        }

       

        protected void drmadvn_Init1(object sender, EventArgs e)
        {
            DonViData donviData = new DonViData();
            DonViDA donviDA = new DonViDA();
            donviData = donviDA.GetDonVi();

            drmadvn.DataSource = donviData;
            drmadvn.DataTextField = DonViData.TENDONVI_FIELD;
            drmadvn.DataValueField = DonViData.MADONVI_FIELD;
            drmadvn.DataBind();

            donviDA.Dispose();
            donviDA = null;

            donviData.Dispose();
            donviData = null;
        }

        protected void drVatTu_SelectedIndexChanged(object sender, EventArgs e)
        {
            getVTdetail();
            BindSL();
        }

        protected void maloaivt_Init(object sender, EventArgs e)
        {
            LoaiVatTuDA loaivattuda = new LoaiVatTuDA();
            LoaiVatTuData loaivattudata = new LoaiVatTuData();
            loaivattudata = loaivattuda.GetLoaiVatTu();
            maloaivt.DataSource = loaivattudata;
            maloaivt.DataTextField = LoaiVatTuData.TENLOAIVATTU_FIELD;
            maloaivt.DataValueField = LoaiVatTuData.MALOAIVATTU_FIELD;
            maloaivt.DataBind();

            loaivattuda.Dispose();
            loaivattuda = null;
            loaivattudata.Dispose();
            loaivattudata = null;
            
        }

        protected void drkho_Init(object sender, EventArgs e)
        {
            KhoDA khoda = new KhoDA();
            KhoData khodata = new KhoData();
            khodata = khoda.GetKho(0);
            drkho.DataSource = khodata;
            drkho.DataTextField = KhoData.TENKHO_FIELD;
            drkho.DataValueField = KhoData.MAKHO_FIELD;
            drkho.DataBind();

            khoda.Dispose();
            khoda = null;
            khodata.Dispose();
            khodata = null;
        }
    }
}