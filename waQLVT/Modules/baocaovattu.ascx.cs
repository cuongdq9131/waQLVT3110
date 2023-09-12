using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLVT.DataAccess;
using QLVT.DataEntities;
using CrystalDecisions.CrystalReports.Engine;
namespace waQLVT.Modules
{
    public partial class baocaovattu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getvattu();
        }
        public void getvattu()
        {
            NhapVatTuDA vtda = new NhapVatTuDA();
            NhapVatTuData dt = new NhapVatTuData();
            dt = vtda.GetVT();

            ReportDocument report = new ReportDocument();
            report.Load(Server.MapPath("../baocaovattu.rpt"));
            report.SetDataSource(dt);
            crystal1.ReportSource = report;
        }

        
    }
}