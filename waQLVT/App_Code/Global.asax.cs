using System;
using System.Web;
using System.Collections;
using System.Security.Principal; 
using System.Web.Security;

namespace wQLTBV3 
{ 
	public class Global : System.Web.HttpApplication 
	{ 

		public static string GetAppPath(HttpRequest request) 
		{
			string path = string.Empty; 
			try 
			{ 
				if (request.ApplicationPath != "/") 
					path = request.ApplicationPath + "/"; 
				else 
					path = request.ApplicationPath; 
			} 
			catch (Exception e){ 
				throw e; 
			} 
			return path; 
		}
		
		void Application_Start(object sender, EventArgs e) 
		{ 
			Application["AppPath"] = GetAppPath(HttpContext.Current.Request);
		}

		void Application_BeginRequest(object sender, EventArgs e) 
		{ 

		} 
		
		void Application_Error(object sender,EventArgs e)
		{
			
		}

		void Application_AuthenticateRequest(object sender, EventArgs e) 
		{ 
			
		} 
	}
}