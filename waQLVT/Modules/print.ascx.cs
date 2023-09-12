using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLVT.DataAccess;
using QLVT.DataEntities;
using QLVT.Common;
using System.IO;

namespace waQLVT.Modules
{
    public partial class print : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string sLoai;
                string sMaVatTu;
                string sTenVatTu;
                string sTuNgay;
                string sDenNgay;
                
                string sDonVi;
                string sViTriDat;

                if (Request.QueryString["loai"] == null)
                    sLoai = "";
                else
                    sLoai = Request.QueryString["loai"].ToString().Trim();
                    
                sLoai = Server.UrlDecode(sLoai);

                if (Request.QueryString["mavt"] == null)
                    sMaVatTu = "";
                else
                    sMaVatTu = Request.QueryString["mavt"].ToString().Trim();

                sMaVatTu = Server.UrlDecode(sMaVatTu);

                if (Request.QueryString["ten"] == null)
                    sTenVatTu = "";
                else
                    sTenVatTu = Request.QueryString["ten"].ToString().Trim();

                sTenVatTu = Server.UrlDecode(sTenVatTu);

                if (Request.QueryString["tungay"] == null)
                    sTuNgay = "";
                else
                    sTuNgay = Request.QueryString["tungay"].ToString().Trim();

                sTuNgay = Server.UrlDecode(sTuNgay);

                if (Request.QueryString["denngay"] == null)
                    sDenNgay = "";
                else
                    sDenNgay = Request.QueryString["denngay"].ToString().Trim();

                sDenNgay = Server.UrlDecode(sDenNgay);

                

                if (Request.QueryString["vitridat"] == null)
                    sViTriDat = "";
                else
                    sViTriDat = Request.QueryString["vitridat"].ToString().Trim();
                

                sViTriDat = Server.UrlDecode(sViTriDat);
                int ViTri = int.Parse(sViTriDat);

                if (Request.QueryString["madonvi"] == null)
                    sDonVi = "";
                else
                    sDonVi = Request.QueryString["madonvi"].ToString().Trim();
               
                sDonVi = Server.UrlDecode(sDonVi);
                int DonVi = int.Parse(sDonVi);
                //if (sTenTin == "" && sMaBang == "" && sTuNgay == "" && sDenNgay == "" && sPhanCanh == "" && sMaQG == "" && sDiaDanh == "")
                //    GetAllData();
                //else
                //    SearchNews(sTenTin, sMaBang, sTuNgay, sDenNgay, sPhanCanh, sMaQG, sDiaDanh, m_inFullTextSearch);
                SearchVatTuKho(sLoai, sMaVatTu, sTenVatTu, ViTri, sTuNgay, sDenNgay, DonVi);
            }
        }
        public void SearchVatTuKho(string sLoaiVT, string sMaVT, string sTenVT, int Kho, string sTungay, string sDenngay, int donvi)
        {
            DateTime dtTuNgay;
            DateTime dtDenNgay;

            if (sTungay != string.Empty)
            {
                if (sDenngay == string.Empty) sDenngay = "31/12/3000";

                if (!Functions.IsDate(sTungay, out dtTuNgay))
                {


                    FindNewsResult(sLoaiVT, sMaVT, sTenVT, "", "", Kho, donvi);
                }
                else if (!Functions.IsDate(sDenngay, out dtDenNgay))
                {


                    FindNewsResult(sLoaiVT, sMaVT, sTenVT, "", "", Kho, donvi);
                }
                else
                {
                    FindNewsResult(sLoaiVT, sMaVT, sTenVT, sTungay, sDenngay, Kho, donvi);
                }
            }
            else
            {
                FindNewsResult(sLoaiVT, sMaVT, sTenVT, "", "", Kho, donvi);
            }
        }
        private void FindNewsResult(string sLoaiVT, string sMaVT, string sTenVT, string sTungay, string sDenngay, int Kho, int DonViQL)
        {
            VatTuDA vattuta = new VatTuDA();
            VatTuData vattudata = new VatTuData();
            vattudata = vattuta.GetSearchVT(sLoaiVT, sMaVT, sTenVT, Kho, sTungay, sDenngay, DonViQL);
            //GetQuy();
            gr1.DataSource = vattudata;
            gr1.DataBind();

            vattudata.Dispose();
            vattudata = null;
            vattuta.Dispose();
            vattuta = null;

                      
        }

        
    }
}