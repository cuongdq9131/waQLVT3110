using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using QLVT.DataAccess;
using QLVT.DataEntities;
using QLVT.BusinessEntities;
using System.Data.SqlClient;
using System.Collections;
using QLVT.Common;
namespace waQLVT.Modules
{
    public partial class ImportData : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {

            // Chuỗi kiểm tra xem có phải file excel ko
            string excelContentType = "application/vnd.ms-excel";
            // Chuỗi kiểm tra với excel 2010
            string excel2010ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            if (!FileUpload1.HasFile)
            {
                lbThongbao.Text = "Vui lòng nhập file!";
            }
            else
            {
                try
                {
                    if (FileUpload1.PostedFile.ContentType != excelContentType && FileUpload1.PostedFile.ContentType != excel2010ContentType)
                    {
                        lbThongbao.Text = "Vui lòng chọn file excel!";
                    }
                    else
                    {
                        //Post lên thư mục tạm (Temp)
                        string filePath = string.Concat(Server.MapPath("~/Temp/" + FileUpload1.FileName));
                        FileUpload1.SaveAs(filePath);


                        if (!System.IO.File.Exists(filePath))
                        {
                            return;
                        }

                        // Cắt đường dẫn tập tin để kiểm tra xem là xls hay xlsx
                        string[] fileParts = filePath.Split('.');

                        string connString = "";
                        if (filePath.Length > 1 && fileParts[1] == "xls")
                        {
                            connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties=Excel 8.0";
                        }
                        else 
                        {
                            connString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=Excel 12.0";
                        }

                        // Tạo đối tượng kết nối
                        OleDbConnection oledbConn = new OleDbConnection(connString);
                        try
                        {
                            // Mở kết nối
                            oledbConn.Open();

                            // Tạo đối tượng OleDBCommand và query data từ sheet 
                            OleDbCommand cmd = new OleDbCommand("SELECT * FROM [" + txtSheet.Text + "$]", oledbConn);

                            // Tạo đối tượng OleDbDataAdapter để thực thi việc query lấy dữ liệu từ tập tin excel
                            OleDbDataAdapter oleda = new OleDbDataAdapter();

                            oleda.SelectCommand = cmd;

                            // Tạo đối tượng DataSet để hứng dữ liệu từ tập tin excel
                            DataSet ds = new DataSet();
                            
                            // Đổ đữ liệu từ tập excel vào DataSet
                            oleda.Fill(ds);


                            // Lấy dữ liệu từng cột đưa vào csdl
                            DataTable dt = ds.Tables[0];
                            int colume = dt.Columns.Count;
                            int row = dt.Rows.Count;
                            
                            
                            string[] tenvt;
                            string[] mavt;
                            string[] partnovt;
                            string[] loaivt;
                            string[] model;
                            string[] xuatxu;
                            string[] dvt;
                            int[] madvt;
                            long[] tondau;
                            long[] toncuoi;
                            int[] soluong;
                            string[] vitri;
                            int[] mavitri;
                            string[] ngaynhap;
                            string[] ngaycapnhat;
                            string[] dvqls;
                            int[] dvqli;
                            string[] matt;
                            int[] bxuat;

                            tenvt = new string[65000];
                            mavt = new string[65000];
                            partnovt = new string[65000];
                            loaivt = new string[65000];
                            model = new string[65000];
                            xuatxu = new string[65000];
                            dvt = new string[65000];
                            madvt = new int[65000];
                            tondau = new long[65000];
                            toncuoi = new long[65000];
                            soluong = new int[65000];
                            vitri = new string[65000];
                            mavitri = new int[65000];
                            ngaynhap = new string[65000];
                            ngaycapnhat = new string[65000];
                            dvqls = new string[65000];
                            dvqli = new int[65000];
                            matt = new string[65000];
                            bxuat = new int[65000];

                            for (int i = 0; i < colume; i++)
                            {
                                if (dt.Columns[i].ToString().ToUpper() == "NAME")
                                {
                                    for (int j = 0; j < row; j++)
                                    {
                                        tenvt[j] = dt.Rows[j][i].ToString().Trim();
                                    }
                                }

                                if (dt.Columns[i].ToString().ToUpper() == "MA")
                                {
                                    for (int j = 0; j < row; j++)
                                    {
                                        mavt[j] = dt.Rows[j][i].ToString().Trim();
                                    }
                                }

                                if (dt.Columns[i].ToString().ToUpper() == "PARTNO")
                                {
                                    for (int j = 0; j < row; j++)
                                    {
                                        partnovt[j] = dt.Rows[j][i].ToString().Trim();
                                    }
                                }

                                if (dt.Columns[i].ToString().ToUpper() == "LOAIVT")
                                {
                                    for (int j = 0; j < row; j++)
                                    {
                                        loaivt[j] = dt.Rows[j][i].ToString().Trim();
                                    }
                                }

                                if (dt.Columns[i].ToString().ToUpper() == "DVT")
                                {
                                    for (int j = 0; j < row; j++)
                                    {
                                        dvt[j] = Functions.RemoveHTMLTags(dt.Rows[j][i].ToString().Trim());
                                        switch (dvt[j])
                                        {
                                            case "Chiếc": madvt[j] = 1;
                                                break;
                                            case "cái": madvt[j] = 2;
                                                break;
                                            case "bộ": madvt[j] = 3;
                                                break;
                                            case "gr": madvt[j] = 4;
                                                break;
                                            case "Cuộn": madvt[j] = 5;
                                                break;
                                            case "hộp": madvt[j] = 6;
                                                break;
                                            case "lọ": madvt[j] = 7;
                                                break;
                                            case "tập": madvt[j] = 8;
                                                break;
                                            case "quyển": madvt[j] = 9;
                                                break;
                                            case "cụm": madvt[j] = 10;
                                                break;
                                            case "lạng": madvt[j] = 11;
                                                break;
                                            case "dl": madvt[j] = 12;
                                                break;
                                            case "mét": madvt[j] = 13;
                                                break;
                                            case "tấm": madvt[j] = 14;
                                                break;
                                            case "viên": madvt[j] = 15;
                                                break;
                                            case "kẹp": madvt[j] = 16;
                                                break;
                                           
                                        }
                                    }
                                }

                                
                                if (dt.Columns[i].ToString().ToUpper() == "SOLUONG")
                                {
                                    for (int j = 0; j < row; j++)
                                    {
                                        if (dt.Rows[j][i].ToString().Trim() != "")
                                        {
                                            soluong[j] = int.Parse(dt.Rows[j][i].ToString().Trim());
                                        }
                                        else
                                            soluong[j] = 0;
                                        
                                    }
                                }

                                // Với các cột khác lấy tương tự

                            }

                            for (int k = 0; k < row; k++)
                            {

                                VatTuDA nhapda = new VatTuDA();
                                if (nhapda.ImportVatTu(loaivt[k], mavt[k], tenvt[k], partnovt[k], madvt[k], soluong[k]))
                                    lbThongbao.Text = "thanh cong";

                                nhapda.Dispose();
                                nhapda = null;

                            }
                                // Hiển thị dữ liệu đọc từ tập tin excel lên trên GridView
                                GridView1.DataSource = ds.Tables[0].DefaultView;
                            GridView1.DataBind();
                        }
                        catch
                        {
                        }
                        finally
                        {
                            // Đóng chuỗi kết nối
                            oledbConn.Close();
                        }
                    }
                }
                catch
                {
                    lbThongbao.Text = "Lỗi import!";
                }
            }


           
        }
    }
}