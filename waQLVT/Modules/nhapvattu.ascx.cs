using System;
using System.Data;
using System.Linq;
using System.Data.SqlClient;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using QLVT.DataAccess;
using QLVT.DataEntities;
using QLVT.BusinessEntities;
using QLVT.Common;

namespace waQLVT.Modules
{
    public partial class nhapvattu : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { //do something
                GetAll();
                if (maloaivt.SelectedValue.Trim() != "VT")
                {
                    drmavtd.Enabled = true;
                    drmahd.Enabled = true;
                    drmadonvi.Enabled = true;
                }
                else
                {
                    
                    drmahd.Enabled = false;
                    drmadonvi.Enabled = false;
                    drmavtd.Enabled = false;
                }
            }
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            int donviql = Convert.ToInt32(MaDonVi.mKho);
            int mavitridat = Convert.ToInt32(MaViTriDat.mAll);
            string mahd = "Mua lẻ";
            
            NhapVatTuDA nhapvattuda = new NhapVatTuDA();
            string mavt = Functions.RemoveHTMLTags(txtmvt.Text.Trim());
            string partno = Functions.RemoveHTMLTags(txtpartno.Text.Trim());
            string tenvt = Functions.RemoveHTMLTags(txttenvt.Text.Trim());
            int madvt = int.Parse(drmadvt.Text);
            
            string maloai = maloaivt.Text;
            string model = Functions.RemoveHTMLTags(txtmodel.Text.Trim());
            string sSoChungTu = Functions.RemoveHTMLTags(txtSoChungTu.Text.Trim());
            string xuatdate = txtNgayNhap.Text;

            if (maloaivt.SelectedValue.Trim() != "VT")
            {
                donviql = int.Parse(drmadonvi.Text);
                mahd = drmahd.Text;
                mavitridat = int.Parse(drmavtd.Text);
            }
            
            DateTime date = DateTime.ParseExact(xuatdate, "dd/MM/yyyy", null);
                       
            if(Functions.IsDate(date.ToString()))
            {
                if (Functions.isInteger(txtsl.Text) == false)
                {
                    alert.Text = "Nhập số lượng kiểu số";

                }
                else
                {
                    int sl = int.Parse(txtsl.Text);
                    NhapVatTuEntity nt = new NhapVatTuEntity(1,mavt, partno, model,tenvt,"" ,madvt, mavitridat, 1, date.ToString(), sl, mahd, DateTime.Now,donviql, sSoChungTu);
                    nt.sMaLoaiVatTu = maloai;
                    nhapvattuda.ThemVatTu(nt);

                    nhapvattuda.Dispose();
                    nhapvattuda = null;
                    GetAll();
                    ltrSave.Text = "<input id=\"hiSave\" type=\"hidden\" Value = \"1\">";                   
                    alert.Text = "Thêm thành công vật tư";
                }
            }
        
        }
        
        public void GetAll()
        {
            NhapVatTuDA nhapvtda = new NhapVatTuDA();
            NhapVatTuData qdata = new NhapVatTuData();
            qdata = nhapvtda.GetVT();
            gr.DataSource = qdata;
            gr.DataBind();

            DateTime t = DateTime.Now;
            txtNgayNhap.Text = String.Format("{0:dd/MM/yyyy}", t);
            gr.Focus();
            gethopdong();
            getdonvit();
            getvitri();
            drmahd.SelectedValue = "Mua lẻ";
            drmadvt.SelectedValue = MaViTriDat.mAll.ToString("d");
            drmavtd.SelectedValue = MaViTriDat.mAll.ToString("d");
            MyDBDataContext db = new MyDBDataContext();
            int iduser = Convert.ToInt32(Session["idlogin"]);
            st_GetUserInfoResult user = db.st_GetUserInfo(iduser).FirstOrDefault();
            if (user != null)
            {
                if (user.MaQuyen <= 1) { gr.Columns[0].Visible = true; gr.Columns[11].Visible = true; }

                else
                { gr.Columns[0].Visible = false; gr.Columns[13].Visible = false; }
            }

            qdata.Dispose();
            qdata = null;
            nhapvtda.Dispose();
            nhapvtda = null;

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
            NhapVatTuDA nhapvtda = new NhapVatTuDA();
            GridViewRow row = gr.Rows[e.RowIndex];

            TextBox t_txtmavt = (TextBox)row.FindControl("e_txtmavt");
            TextBox t_txtmodel= (TextBox)row.FindControl("e_txtmodel");
            TextBox t_txtpn = (TextBox)row.FindControl("e_txtpn");
            TextBox t_txttenvt = (TextBox)row.FindControl("e_txttenvt");
            TextBox t_txtsl = (TextBox)row.FindControl("e_txtsl");
            TextBox txtSoChungTu = (TextBox)row.FindControl("eSoChungTu");
            

            DropDownList t_txtdvt = (DropDownList)row.FindControl("e_txtdvt");
            DropDownList t_txtmahopdong = (DropDownList)row.FindControl("e_drmahd");
            DropDownList t_txtmakho = (DropDownList)row.FindControl("e_drmakho");
            DropDownList t_txtmadvql = (DropDownList)row.FindControl("e_drmadvql");
            TextBox l = (TextBox)row.FindControl("engaynhap");
            string ethlydate = l.Text;
            try
            {
                DateTime d = DateTime.ParseExact(ethlydate, "dd/MM/yyyy", null);
                string e_txtmavt = t_txtmavt.Text;
                string e_txttenvt = t_txttenvt.Text;
                string e_txtpn = t_txtpn.Text;
                string sSoChungTu = Functions.RemoveHTMLTags(txtSoChungTu.Text.Trim());

                if (t_txtsl.Text==""||t_txttenvt.Text=="")
                {
                    alert.Text = "Cần nhập đầy đủ thông tin để cập nhật";
                }
                else if (Functions.isInteger(t_txtsl.Text) == false)
                {
                    alert.Text = "Nhập số lượng kiểu số";
                }
                
                else
                {
                    int e_txtsl = int.Parse(t_txtsl.Text);
                    
                    int e_txtdvt = int.Parse(t_txtdvt.Text);
                    int e_txtmakho = int.Parse(t_txtmakho.Text);
                    string e_txtmahopdong = t_txtmahopdong.Text;
                    long VatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
                    NhapVatTuEntity entt = new NhapVatTuEntity(1, e_txtmavt, e_txtpn, t_txtmodel.Text, e_txttenvt, "", e_txtdvt,
                        e_txtmakho, 2, d.ToString(), e_txtsl, e_txtmahopdong, DateTime.Now, int.Parse(t_txtmadvql.Text), sSoChungTu);
                    entt.lnVatTuID = VatTuID;
                    nhapvtda.UpdateMaterial(entt);
                    gr.EditIndex = -1;
                    GetAll();
                    alert.Text = "Cập nhật thành công";

                    nhapvtda.Dispose();
                    nhapvtda = null;
                }
            }
            catch
            {
                alert.Text = "Kiểm tra lại định dạng ngày";
            }
        }

        protected void gr_Delete(object senderm, GridViewDeleteEventArgs e)
        {
            try
            {
                NhapVatTuDA nhapvtda = new NhapVatTuDA();
                long VatTuID = long.Parse(gr.DataKeys[e.RowIndex].Value.ToString());
                nhapvtda.XoaVatTu(VatTuID);
                GetAll();
                alert.Text = "Xóa thành công";
                nhapvtda.Dispose();
                nhapvtda = null;
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

        protected void gr_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[13].Attributes.Add("onclick", "return confirm('Bạn thật sự muốn xóa tin này không?');");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
        protected void gethopdong()
        {
            HopDongDA hdda = new HopDongDA();
            HopDongData hddata = new HopDongData();
            hddata = hdda.GetHD();
            drmahd.DataSource = hddata;
            drmahd.DataTextField = HopDongData.MAHOPDONG_FIELD;
            drmahd.DataValueField = HopDongData.MAHOPDONG_FIELD;
            
            drmahd.DataBind();

            hdda.Dispose();
            hdda = null;
            hddata.Dispose();
            hddata = null;
            

        }
        protected void getdonvit()
        {
            DonViTinhDA dvtda = new DonViTinhDA();
            DonViTinhData dvtdata = new DonViTinhData();
            dvtdata = dvtda.GetHD();
            drmadvt.DataSource = dvtdata;
            drmadvt.DataTextField = DonViTinhData.TENDONVITINH_FIELD;
            drmadvt.DataValueField = DonViTinhData.MADVT_FIELD;

            drmadvt.DataBind();

            dvtda.Dispose();
            dvtda = null;
            dvtdata.Dispose();
            dvtdata = null;

        }
        protected void getvitri()
        {
            ViTriDA vitrida = new ViTriDA();
            ViTriDatData vitridata = new ViTriDatData();
            vitridata = vitrida.GetHD();
            drmavtd.DataSource = vitridata;
            drmavtd.DataTextField = ViTriDatData.TENVITRIDAT_FIELD;
            drmavtd.DataValueField = ViTriDatData.MAVITRIDAT_FIELD;

            drmavtd.DataBind();

            vitrida.Dispose(); vitrida = null;
            vitridata.Dispose(); vitridata = null;


        }
        protected void add_Click(object sender, ImageClickEventArgs e)
        {
            HopDongDA hdda = new HopDongDA();
            string maldv = Functions.RemoveHTMLTags(nmahd.Text.Trim());

            string kydate = txtNgayKy.Text;
            DateTime d = DateTime.ParseExact(kydate, "dd/MM/yyyy", null);
            if (maldv == "")
            {
                alert.Text = "Cần nhập đầy đủ thông tin";
            }
            else
            {
                HopDongEntity hdet = new HopDongEntity(1, maldv, d.ToString(), DateTime.Now, DateTime.Now, 1);
                hdda.ThemHopDong(hdet);
                gethopdong();
                alert.Text = "Thêm thành công gói thầu";


            }
            hdda.Dispose();
            hdda = null;
        }

        protected void add_dvt_Click(object sender, ImageClickEventArgs e)
        {
            DonViTinhDA da = new DonViTinhDA();
            string dvt = Functions.RemoveHTMLTags(txtdvt.Text.Trim());
            da.ThemDVT(dvt);
            getdonvit();

            da.Dispose();
            da = null;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ViTriDA da = new ViTriDA();
            string dvt = Functions.RemoveHTMLTags(txtdiadiem.Text.Trim());
            da.ThemVT(dvt);
            getvitri();

            da.Dispose();
            da = null;
        }

        protected DonViData GetAllDonVi()
        {
            DonViData donviData = new DonViData();
            DonViDA donviDA = new DonViDA();
            donviData = donviDA.GetDonVi();

            donviDA.Dispose();
            donviDA = null;
            
            return donviData;  
        }

        protected ViTriDatData GetAllViTriDat()
        {
            ViTriDatData vitriData = new ViTriDatData();
            ViTriDA vitriDA = new ViTriDA();
            vitriData = vitriDA.GetHD();

            vitriDA.Dispose();
            vitriDA = null;

            return vitriData;
        }

        protected HopDongData GetAllHopDong()
        {
            HopDongData hopdongData = new HopDongData();
            HopDongDA hopdongDA = new HopDongDA();
            hopdongData = hopdongDA.GetHD();

            hopdongDA.Dispose();
            hopdongDA = null;

            return hopdongData;
        }

        protected void drmadonvi_Init(object sender, EventArgs e)
        {
            DonViData donviData = new DonViData();
            DonViDA donviDA = new DonViDA();
            donviData = donviDA.GetDonVi();

            drmadonvi.DataSource = donviData;
            drmadonvi.DataTextField = DonViData.TENDONVI_FIELD;
            drmadonvi.DataValueField = DonViData.MADONVI_FIELD;
            drmadonvi.DataBind();

            donviDA.Dispose();
            donviDA = null;

            donviData.Dispose();
            donviData = null;
        }

        protected void maloaivt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (maloaivt.SelectedValue != "VT")
            {
                drmavtd.Enabled = true;
                drmahd.Enabled = true;
                drmadonvi.Enabled = true;
            }
            else
            {

                drmahd.Enabled = false;
                drmadonvi.Enabled = false;
                drmavtd.Enabled = false;
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
    }
}