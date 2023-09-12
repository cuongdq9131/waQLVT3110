using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.ComponentModel;
using System.Globalization;

using QLVT.BusinessEntities;
using QLVT.DataEntities;
using QLVT.Common;
using QLVT.DataAccess;
namespace waQLVT.Modules
{
    public partial class thanhlyvattu : System.Web.UI.UserControl
    {
        int slx;
        int e_slx;
        bool kt = true;
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

        public void GetAll()
        {
            ThanhLyDA thanhlyda = new ThanhLyDA();
            ThanhLyData thanhlydata = new ThanhLyData();
            thanhlydata = thanhlyda.GetThanhLy();
            gr.DataSource = thanhlydata;
            gr.DataBind();
            DateTime t = DateTime.Now;
            txtNgayThanhLy.Text = String.Format("{0:dd/MM/yyyy}", t);
            

            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            st_GetUserInfoResult user = db.st_GetUserInfo(iduser).FirstOrDefault();
            if (user != null)
            {
                if (user.MaQuyen <= 1) { gr.Columns[0].Visible = true; gr.Columns[8].Visible = true; }

                else
                { gr.Columns[0].Visible = false; gr.Columns[8].Visible = false; }
            }

            thanhlyda.Dispose();
            thanhlyda = null;
            thanhlydata.Dispose();
            thanhlydata = null;
            
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
               if(drVatTu.SelectedValue!="")
               {
                    long lnVatTuID = long.Parse(drVatTu.SelectedValue);
                    string ldtl = Functions.RemoveHTMLTags(txtmucdich.Text.Trim());
               
                    string thanhlydate = txtNgayThanhLy.Text;
                    DateTime d = DateTime.ParseExact(thanhlydate, "dd/MM/yyyy", null);
                       
                    if (ldtl == "") { alert.Text = "Bạn chưa nhập lí do thanh lý"; }
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
                            slx = int.Parse(txtsl.Text.Trim());
                            if (hiSoLuong.Value != "")
                            {
                                if (int.Parse(hiSoLuong.Value) < slx)
                                {
                                    kt = false;
                                }
                            }
                            ThanhLyDA thanhlyda = new ThanhLyDA();
                            ThanhLyEntity xvt = new ThanhLyEntity(lnVatTuID,"","", "", "", 2, d.ToString(), slx, DateTime.Now, DateTime.Now, ldtl);
                            BindSL();
                            if (kt)
                            {
                                thanhlyda.ThemVatTu(xvt);

                                GetAll();
                                getVTdetail();
                                BindSL();
                                alert.Text = "Thanh lý thành công";
                            }
                            else
                            {
                                alert.Text = "Không thể thanh lý, kiểm tra lại số lượng";
                                kt = true;
                            }
                            thanhlyda.Dispose();
                            thanhlyda = null;
                        }
                    }
               }
            }
            catch
            {
                alert.Text = "Thêm thất bại";
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
            
            GridViewRow row = gr.Rows[e.RowIndex];

            DropDownList t_txtmavt = (DropDownList)row.FindControl("e_drmavt");
            DropDownList t_txttenvt = (DropDownList)row.FindControl("e_drtenvt");
            DropDownList t_txtpartno = (DropDownList)row.FindControl("e_drpartno");
            DropDownList t_txtmodel = (DropDownList)row.FindControl("e_drmodel"); 
            TextBox t_txtsl = (TextBox)row.FindControl("e_txtsl");
          
            TextBox l = (TextBox)row.FindControl("engaynhap");
            
            string ethlydate = l.Text;
            
            TextBox t_mucdich = (TextBox)row.FindControl("e_txtldtl");

            try
            {
                DateTime d = DateTime.ParseExact(ethlydate, "dd/MM/yyyy", null);
                
              
                if (t_mucdich.Text == "" || t_txtsl.Text == "")
                {
                    alert.Text = "Cần nhập đầy đủ thông tin để cập nhật";
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
                    string e_lido = t_mucdich.Text;
                    e_slx = int.Parse(t_txtsl.Text);
                    
                    long VatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
                    ThanhLyEntity xvtett = new ThanhLyEntity(VatTuID,e_txttenvt, e_txtmavt, e_txtpartno, e_txtmodel, 1, d.ToString(),
                        e_slx, DateTime.MaxValue, DateTime.Now, e_lido);
                    
                    BindSL();
                    ThanhLyDA thanhlyda = new ThanhLyDA();
                    if (kt)
                    {
                       
                        thanhlyda.SuaVatTuTL(xvtett);
                        gr.EditIndex = -1;
                        GetAll();
                        BindSL();
                        alert.Text = "Cập nhật thành công";
                    }
                    else
                    {
                        alert.Text = "Kiểm tra lại số lượng";
                    }
                    thanhlyda.Dispose();
                    thanhlyda = null;
                }
            }
            catch
            {
                alert.Text = "Kiểm tra định dạng ngày";
            }
        }
        
        protected void gr_Delete(object senderm, GridViewDeleteEventArgs e)
        {
            try
            {
                ThanhLyDA thanhlyda = new ThanhLyDA();
                long VatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
                thanhlyda.XoaVatTu(VatTuID);
                GetAll();
                BindSL();
                alert.Text = "Xóa thành công";
                thanhlyda.Dispose();
                thanhlyda = null;
            }
            catch
            {
                alert.Text = "Xóa thật bại";
            }
        }
        protected void gr_PageChange(object c, GridViewPageEventArgs e)
        {
            gr.PageIndex = e.NewPageIndex;
            GetAll();
        }

        protected void maloaivt_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindVatTu();
            getVTdetail();
            BindSL();
        }
        protected void BindVatTu()
        {
            VatTuData vattudata = new VatTuData();
            VatTuDA vtda = new VatTuDA();
            string loaivt = (maloaivt.SelectedValue);
            int makho = int.Parse(drkho.SelectedValue);

            vattudata = vtda.GetVTKho(loaivt, makho);
            drVatTu.DataSource = vattudata;
            drVatTu.DataValueField = VatTuData.IDVATTU_FIELD;
            drVatTu.DataTextField = VatTuData.TENVATTU_FIELD;
            drVatTu.DataBind();
            BindSL();

            vtda.Dispose();
            vtda = null;
            vattudata.Dispose();
            vattudata = null;

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
       
        protected void drkho_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindVatTu();
            getVTdetail();
            BindSL();
        }
        protected void getVTdetail()
        {
            if (Functions.isInteger(drVatTu.SelectedValue.ToString()))
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
                    string sSoLuong = vattuData.Tables[0].Rows[0][VatTuData.TONCUOIKY_FIELD].ToString();
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

        protected void gr_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[8].Attributes.Add("onclick", "return confirm('Bạn thật sự muốn xóa tin này không?');");
            }
        }

        protected void drVatTu_SelectedIndexChanged(object sender, EventArgs e)
        {
            getVTdetail();
            BindSL();
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