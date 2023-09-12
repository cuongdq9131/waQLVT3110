using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using QLVT.Common;
using QLVT.DataAccess;
using QLVT.DataEntities;
using QLVT.BusinessEntities; 

/// <summary>
/// Summary description for AutocompleteService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class AutocompleteService : System.Web.Services.WebService {

    [WebMethod]
    public string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        HttpResponse response = HttpContext.Current.Response;
        List<string> CompletionSet = new List<string>();
        TableName tnTable = TableName.tnNone;

        switch (contextKey)
        {
            case "sgTenVatTu":
                tnTable = TableName.tnsgTenVatTu;

                break;
            case "sgMaVatTu":
                tnTable = TableName.tnsgMaVatTu;

                break;
            
        }

        try
        {
            VatTuDA vattuda = new VatTuDA();
            VatTuData vattudata = new VatTuData();

            vattudata = vattuda.GetSuggestionByKeyword(tnTable, prefixText);

            int i;
            int iCount = vattudata.Tables[VatTuData.VATTU_TABLE].Rows.Count;

            CompletionSet.Clear();

            if (iCount > 0)
            {
                for (i = 0; i < iCount; i++)
                {
                    if (contextKey == "sgTenVatTu")
                        CompletionSet.Add(Functions.RemoveHTMLTags(vattudata.Tables[0].Rows[i][VatTuData.TENVATTU_FIELD].ToString()));
                    else if(contextKey == "sgMaVatTu")
                        CompletionSet.Add(Functions.RemoveHTMLTags(vattudata.Tables[0].Rows[i][VatTuData.MAVATTU_FIELD].ToString()));
                }
            }

            vattuda.Dispose(); vattuda = null;
            vattudata.Dispose(); vattudata = null;
            
        }
        catch
        {
            response.Write("{{\"message\": \"action failed!\"}}");
        }
        return CompletionSet.ToArray();
        
    }
    
}
