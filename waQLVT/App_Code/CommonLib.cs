using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wQLTBV3
{
    /// <summary>
    /// Summary description for CommonLib
    /// </summary>
    public class CommonLib
    {
        public CommonLib()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static string NavURL()
        {
            return Global.GetAppPath(HttpContext.Current.Request);
        }
    }
}
