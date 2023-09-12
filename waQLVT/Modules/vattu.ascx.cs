using System;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Collections.Generic;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using QLVT.DataAccess;
using QLVT.DataEntities;
using QLVT.BusinessEntities;
using QLVT.Common;


namespace waQLVT.Modules
{
    public partial class vattu : System.Web.UI.UserControl
    {
        
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { //do something 
                info.AddMergedColumns(new int[] { 1, 2, 3, 4 }, "VẬT TƯ HÀNG HÓA");
                
            }
        }
        protected void TaoItemChon(DropDownList ddl, string title)
        {
            ListItem itm = new ListItem("-- Chọn " + title + " --", "0");
            ddl.Items.Add(itm);
            ddl.SelectedValue = "0";
        }

        protected void TaoToolTipDDL(DropDownList ddl)
        {
            for (int i = 0; i < ddl.Items.Count; i++)
            {
                ddl.Items[i].Attributes.Add("Title", ddl.Items[i].Text);
            }
        }

        protected void ddl_DanhMuc_DataBound(object sender, EventArgs e)
        {
            //TaoItemChon(ddlDonvi, "đơn vị");
            //TaoToolTipDDL(ddlDonvi);
        }

        protected void ddl_ViTri_DataBound(object sender, EventArgs e)
        {
            //ddlVitri.SelectedValue = "0";
           // TaoToolTipDDL(ddlVitri);
        }

        protected void drdonvinhan_DataBound(object sender, EventArgs e)
        {
            //TaoItemChon(drdonvinhan, "đơn vị");
           // TaoToolTipDDL(drdonvinhan);
        }       
        protected void gr_PageChange(object c, GridViewPageEventArgs e)
        {
            gr1.PageIndex = e.NewPageIndex;
            int pageindex = e.NewPageIndex;
            
            string sLoaiVT = Functions.RemoveHTMLTags(txtLoaiVT.Text.TrimEnd()).TrimEnd();
            string sMaVT = Functions.RemoveHTMLTags(txtMaVT.Text.TrimEnd()).TrimEnd();
            string sTenVT = Functions.RemoveHTMLTags(txtTenVT.Text.Trim()).Trim();
            string sTungay = Functions.RemoveHTMLTags(txtTuNgay.Text.Trim()).Trim();
            string sDenngay = Functions.RemoveHTMLTags(txtDenNgay.Text.Trim()).Trim();
            int sDonVi = int.Parse(ddlDonvi.SelectedItem.Value.ToString().Trim());
           
            int sVitri = int.Parse((ddlVitri.SelectedItem.Value.ToString().Trim()));
            //gr.EditIndex = -1;


           
            SearchVatTuKho(sLoaiVT, sMaVT, sTenVT, sVitri, sTungay, sDenngay,sDonVi);
            //SearchVatTuXuat(sLoaiVT,sMaVT,sTenVT,s
            //gr.DataBind();
        }

        protected void btnTimkiem_Click(object sender, EventArgs e)
        {
            string sLoaiVT = Functions.RemoveHTMLTags(txtLoaiVT.Text.TrimEnd()).TrimEnd();
            string sMaVT = Functions.RemoveHTMLTags(txtMaVT.Text.TrimEnd()).TrimEnd();
            string sTenVT = Functions.RemoveHTMLTags(txtTenVT.Text.Trim()).Trim();
            string sTungay = Functions.RemoveHTMLTags(txtTuNgay.Text.Trim()).Trim();
            string sDenngay = Functions.RemoveHTMLTags(txtDenNgay.Text.Trim()).Trim();

            string sTungayXuat = Functions.RemoveHTMLTags(txtTuNgayXuat.Text.Trim()).Trim();
            string sDenngayXuat = Functions.RemoveHTMLTags(txtDenNgayXuat.Text.Trim()).Trim();
            int DonViQL = int.Parse(ddlDonvi.Text);
            string sDonVi = Functions.RemoveHTMLTags(drdonvinhan.Text.Trim()).Trim();
            string sViTriX = Functions.RemoveHTMLTags(drvitridat.Text.Trim()).Trim();
            int sVitri = int.Parse(ddlVitri.Text);
            //gr.EditIndex = -1;

            if (CheckBox1.Checked)
            {
                
               //SearchVatTuXuat(sLoaiVT, sMaVT, sTenVT,  sVitri, "",  sTungay,sDenngay, sTungayXuat, sDenngayXuat, sDonVi, sViTriX);
            }
            else
            {
                if (CheckBox2.Checked)
                {
                    //SearchVatTuThanhLy(sLoaiVT, sMaVT, sTenVT, sVitri, "", sTungay, sDenngay, sTungayXuat, sDenngayXuat, sDonVi);
                }
                else
                {
                    SearchVatTuKho(sLoaiVT, sMaVT, sTenVT, sVitri, sTungay, sDenngay,DonViQL);
                }
            }
            if (CheckBox2.Checked)
            {
                
                //SearchVatTuThanhLy(sLoaiVT, sMaVT, sTenVT, sVitri, "", sTungay, sDenngay, sTungayXuat, sDenngayXuat, sDonVi);
            }
            else
            {
                if (CheckBox1.Checked)
                {
                    //SearchVatTuXuat(sLoaiVT, sMaVT, sTenVT, sVitri, "", sTungay, sDenngay, sTungayXuat, sDenngayXuat, sDonVi, sViTriX);
                }
                else
                {

                    SearchVatTuKho(sLoaiVT, sMaVT, sTenVT, sVitri, sTungay, sDenngay, DonViQL);
                }
            }
            
        }

        public void SearchVatTuKho(string sLoaiVT, string sMaVT, string sTenVT, int Kho, string sTungay, string sDenngay,int donvi)
        {
            DateTime dtTuNgay;
            DateTime dtDenNgay;

            if (sTungay != string.Empty)
            {
                if (sDenngay == string.Empty) sDenngay = "31/12/3000";

                if (!Functions.IsDate(sTungay, out dtTuNgay))
                {
                    

                    FindNewsResult(sLoaiVT, sMaVT, sTenVT, "", "", Kho,donvi);
                }
                else if (!Functions.IsDate(sDenngay, out dtDenNgay))
                {
                   

                    FindNewsResult(sLoaiVT, sMaVT, sTenVT, "", "", Kho,donvi);
                }
                else
                {
                    FindNewsResult(sLoaiVT, sMaVT, sTenVT, sTungay, sDenngay, Kho,donvi);
                }
            }
            else
            {
                FindNewsResult(sLoaiVT, sMaVT, sTenVT, "", "", Kho,donvi);
            }
        }

        public void SearchVatTuIn(string sLoaiVT, string sMaVT, string sTenVT, int Kho, string sTungay, string sDenngay, int donvi)
        {
            DateTime dtTuNgay;
            DateTime dtDenNgay;

            if (sTungay != string.Empty)
            {
                if (sDenngay == string.Empty) sDenngay = "31/12/3000";

                if (!Functions.IsDate(sTungay, out dtTuNgay))
                {


                    FindNewsResultIn(sLoaiVT, sMaVT, sTenVT, "", "", Kho, donvi);
                }
                else if (!Functions.IsDate(sDenngay, out dtDenNgay))
                {


                    FindNewsResultIn(sLoaiVT, sMaVT, sTenVT, "", "", Kho, donvi);
                }
                else
                {
                    FindNewsResultIn(sLoaiVT, sMaVT, sTenVT, sTungay, sDenngay, Kho, donvi);
                }
            }
            else
            {
                FindNewsResultIn(sLoaiVT, sMaVT, sTenVT, "", "", Kho, donvi);
            }
        }


        private void FindNewsResult(string sLoaiVT, string sMaVT, string sTenVT, string sTungay, string sDenngay, int Kho, int DonViQL)
        {
            VatTuDA vattuda = new VatTuDA();
            VatTuData vattudata = new VatTuData();
            vattudata = vattuda.GetSearchVT(sLoaiVT, sMaVT, sTenVT, Kho, sTungay, sDenngay,DonViQL);

            gr1.Visible = true;
            gr1.DataSource = vattudata.Tables[VatTuData.VATTU_TABLE];
            gr1.DataBind();

            vattuda.Dispose(); vattuda = null;
            vattudata.Dispose(); vattudata = null;
            

        }

        private void FindNewsResultIn(string sLoaiVT, string sMaVT, string sTenVT, string sTungay, string sDenngay, int Kho, int DonViQL)
        {
            VatTuDA vattuda = new VatTuDA();
            VatTuData vattudata = new VatTuData();
            vattudata = vattuda.GetSearchVT(sLoaiVT, sMaVT, sTenVT, Kho, sTungay, sDenngay, DonViQL);
            
            gr_in.DataSource = vattudata.Tables[VatTuData.VATTU_TABLE];
            gr_in.DataBind();

            vattuda.Dispose(); vattuda = null;
            vattudata.Dispose(); vattudata = null;
            //ltrReportHeader.Text = GetReportHeader("TRUNG TÂM KĨ THUẬT", "SẢN XUẤT CHƯƠNG TRÌNH", "SỔ TỔNG HỢP VẬT TƯ - HÀNG HÓA ", "Vật tư linh kiện chuyên dụng");
        }


        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                txtTuNgayXuat.Enabled = true;
                txtDenNgayXuat.Enabled = true;
                drdonvinhan.Enabled = true;
                drvitridat.Enabled = true;
                CheckBox2.Enabled = false;
            }
            else
            {
                txtTuNgayXuat.Enabled = false;
                txtDenNgayXuat.Enabled = false;
                drdonvinhan.Enabled = false;
                drvitridat.Enabled = false;
                CheckBox2.Enabled = true;
            }
        }



        protected void drvitridat_DataBound(object sender, EventArgs e)
        {
            TaoItemChon(drvitridat, "đơn vị");
            TaoToolTipDDL(drvitridat);
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked)
            {
                txtTuNgayXuat.Enabled = true;
                txtDenNgayXuat.Enabled = true;
                drdonvinhan.Enabled = true;
                //drvitridat.Enabled = true;
                CheckBox1.Enabled = false;
            }
            else
            {
                txtTuNgayXuat.Enabled = false;
                txtDenNgayXuat.Enabled = false;
                drdonvinhan.Enabled = false;
                //drvitridat.Enabled = false;
                CheckBox1.Enabled = true;
            }
        }

        protected void BindDuLieuIn()
        {
            string sLoaiVT = Functions.RemoveHTMLTags(txtLoaiVT.Text.TrimEnd()).TrimEnd();
            string sMaVT = Functions.RemoveHTMLTags(txtMaVT.Text.TrimEnd()).TrimEnd();
            string sTenVT = Functions.RemoveHTMLTags(txtTenVT.Text.Trim()).Trim();
            string sTungay = Functions.RemoveHTMLTags(txtTuNgay.Text.Trim()).Trim();
            string sDenngay = Functions.RemoveHTMLTags(txtDenNgay.Text.Trim()).Trim();

            string sTungayXuat = Functions.RemoveHTMLTags(txtTuNgayXuat.Text.Trim()).Trim();
            string sDenngayXuat = Functions.RemoveHTMLTags(txtDenNgayXuat.Text.Trim()).Trim();
            int DonViQL = int.Parse(ddlDonvi.Text);
            string sDonVi = Functions.RemoveHTMLTags(drdonvinhan.Text.Trim()).Trim();
            string sViTriX = Functions.RemoveHTMLTags(drvitridat.Text.Trim()).Trim();
            int sVitri = int.Parse(ddlVitri.Text);
            SearchVatTuIn(sLoaiVT, sMaVT, sTenVT, sVitri, sTungay, sDenngay, DonViQL);
        }

        protected void btnIn_Click(object sender, EventArgs e)
        {
            BindDuLieuIn();

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=danhsachvattu.doc");
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());
            
            Response.Charset = "";
            //Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            //Response.ContentType = "application/vnd.ms-word";
            Response.ContentType = "application/vnd.word";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            
            gr_in.RenderControl(hw);

            tbl.Visible = true;

            StringWriter sw1 = new StringWriter();
            HtmlTextWriter hw1 = new HtmlTextWriter(sw1);
            tbl.RenderControl(hw1);

           
            Response.Output.Write(sw1.ToString());
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();

            gr_in.Visible = false;
            tbl.Visible = false;
        }

        private string GetQuy()
        {
            string sQuy = "";
            string sThangHienTai = DateTime.Now.Month.ToString();
            if (sThangHienTai == "1" || sThangHienTai == "2" || sThangHienTai == "3")
            {
                sQuy = "1/" + DateTime.Now.Year.ToString();
            }
            else if (sThangHienTai == "5" || sThangHienTai == "4" || sThangHienTai == "6")
            {
                sQuy = "2/" + DateTime.Now.Year.ToString();
            }
            else if (sThangHienTai == "7" || sThangHienTai == "8" || sThangHienTai == "9")
            {
                sQuy = "3/" + DateTime.Now.Year.ToString();
            }
            else
            {
                sQuy = "4/" + DateTime.Now.Year.ToString();
            }
            return sQuy;
        }

        

        protected void gr1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.SetRenderMethodDelegate(RenderHeader);
        }

        protected void gr1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridViewRow headerow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                for (int i = 1; i < 11; i++)
                {
                    TableCell headercell = new TableCell()
                    {

                        ColumnSpan = 1,
                        Text = i.ToString(),
                        HorizontalAlign = HorizontalAlign.Center

                    };

                    headerow.Cells.Add(headercell);
                }
                gr1.Controls[0].Controls.AddAt(1, headerow);
            }
        }


        private MergedColumnsInfo info
        {
            get
            {
                if (ViewState["info"] == null)
                    ViewState["info"] = new MergedColumnsInfo();
                return (MergedColumnsInfo)ViewState["info"];
            }
        }
        [Serializable]
        private class MergedColumnsInfo
        {
            // indexes of merged columns
            public List<int> MergedColumns = new List<int>();
            // key-value pairs: key = the first column index, value = number of the merged columns
            public Hashtable StartColumns = new Hashtable();
            // key-value pairs: key = the first column index, value = common title of the merged columns 
            public Hashtable Titles = new Hashtable();

            //parameters: the merged columns indexes, common title of the merged columns 
            public void AddMergedColumns(int[] columnsIndexes, string title)
            {
                MergedColumns.AddRange(columnsIndexes);
                StartColumns.Add(columnsIndexes[0], columnsIndexes.Length);
                Titles.Add(columnsIndexes[0], title);
            }
        }

        private void RenderHeader(HtmlTextWriter output, Control container)
        {
            for (int i = 0; i < container.Controls.Count; i++)
            {
                TableCell cell = (TableCell)container.Controls[i];
                //stretch non merged columns for two rows
                if (!info.MergedColumns.Contains(i))
                {
                    cell.Attributes["rowspan"] = "2";
                    cell.RenderControl(output);
                }
                else //render merged columns common title
                    if (info.StartColumns.Contains(i))
                    {
                        output.Write(string.Format("<th align='center' colspan='{0}'>{1}</th>",
                                 info.StartColumns[i], info.Titles[i]));
                    }
            }

            //close the first row	
            output.RenderEndTag();
            //set attributes for the second row
            gr1.HeaderStyle.AddAttributesToRender(output);
            //start the second row
            output.RenderBeginTag("tr");

            //render the second row (only the merged columns)
            for (int i = 0; i < info.MergedColumns.Count; i++)
            {
                TableCell cell = (TableCell)container.Controls[info.MergedColumns[i]];
                cell.RenderControl(output);
            }
        }

        private void RenderHeaderIn(HtmlTextWriter output, Control container)
        {
            for (int i = 0; i < container.Controls.Count; i++)
            {
                TableCell cell = (TableCell)container.Controls[i];
                //stretch non merged columns for two rows
                if (!info.MergedColumns.Contains(i))
                {
                    cell.Attributes["rowspan"] = "2";
                    cell.RenderControl(output);
                }
                else //render merged columns common title
                    if (info.StartColumns.Contains(i))
                    {
                        output.Write(string.Format("<th align='center' colspan='{0}'>{1}</th>",
                                 info.StartColumns[i], info.Titles[i]));
                    }
            }

            //close the first row	
            output.RenderEndTag();
            //set attributes for the second row
            gr_in.HeaderStyle.AddAttributesToRender(output);
            //start the second row
            output.RenderBeginTag("tr");

            //render the second row (only the merged columns)
            for (int i = 0; i < info.MergedColumns.Count; i++)
            {
                TableCell cell = (TableCell)container.Controls[info.MergedColumns[i]];
                cell.RenderControl(output);
            }
        }
        public string GetReportHeader(object text1, object text2, object Header, object text3)
        {
            string retVal = "";
            retVal += "<table>" + Environment.NewLine;
            retVal += "   <tr><td align=\"left\">" + Environment.NewLine;
            retVal += text1.ToString() + Environment.NewLine;
            retVal += "   </td><tr><td align=\"left\">" + Environment.NewLine;
            retVal += text2.ToString() + Environment.NewLine;
            retVal += "   </td></tr><tr><td align=\"center\">" + Header.ToString() + "</td></tr>" + Environment.NewLine;

            retVal += "   <tr><td align=\"center\">" + Environment.NewLine;
            retVal += "Quý  năm " + Environment.NewLine;
            retVal += "   </td></tr><tr><td align=\"center\">" + Environment.NewLine;
            retVal += text3.ToString() + Environment.NewLine;
            retVal += "   </td></tr>" + Environment.NewLine;

            retVal += "</table>" + Environment.NewLine;

            return retVal;


        }

        protected void gr_in_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.SetRenderMethodDelegate(RenderHeaderIn);
        }

        protected void gr_in_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridViewRow headerow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                for (int i = 1; i < 11; i++)
                {
                    TableCell headercell = new TableCell()
                    {

                        ColumnSpan = 1,
                        Text = i.ToString(),
                        HorizontalAlign = HorizontalAlign.Center

                    };

                    headerow.Cells.Add(headercell);
                }
                gr_in.Controls[0].Controls.AddAt(1, headerow);
            }
        }

        protected void txtLoaiVT_Init(object sender, EventArgs e)
        {
            LoaiVatTuDA loaivattuda = new LoaiVatTuDA();
            LoaiVatTuData loaivattudata = new LoaiVatTuData();
            loaivattudata = loaivattuda.GetAllLoaiVatTu();
            txtLoaiVT.DataSource = loaivattudata;
            txtLoaiVT.DataTextField = LoaiVatTuData.TENLOAIVATTU_FIELD;
            txtLoaiVT.DataValueField = LoaiVatTuData.MALOAIVATTU_FIELD;
            txtLoaiVT.DataBind();

            loaivattuda.Dispose();
            loaivattuda = null;
            loaivattudata.Dispose();
            loaivattudata = null;
        }
         
    }
         
}
        