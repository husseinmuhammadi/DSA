using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Conference
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
			string strPath = "";
			string strPathName = "";
			string strErrorMessage = "";

			if ((Server != null) && (Server.GetLastError() != null) && (Server.GetLastError().GetBaseException() != null))
			{
				System.Exception ex = Server.GetLastError().GetBaseException();

				strErrorMessage = "'<b>" + ex.Message + "'</b> Occured on " + System.DateTime.Now.ToString("yyyy/mm/dd - hh:mm:ss");
				strErrorMessage += "<br />Error Message: " + strErrorMessage;
				strErrorMessage += "<br />User IP: " + Request.UserHostAddress;
				strErrorMessage += "<br />Physical Path: " + Request.PhysicalPath;

				//Server.ClearError();

				Response.Write("<br />" + strErrorMessage + "<br /><br />");
			}

			System.IO.StreamWriter sw = null;
			strPath = Server.MapPath("~/bin/");
			strPathName = strPath + "\\ApplicationError.log";

			Application.Lock();

			try
			{
				sw = new System.IO.StreamWriter(strPathName, true, System.Text.Encoding.UTF8);
				sw.Write("Application Error:\r\n" + strErrorMessage.Replace("<br />", "\r\n") + "\r\n");
				sw.Close();
			}
			catch (Exception ex)
			{
				Response.Write("<br />" + ex.Message);
			}
			finally
			{
				if (sw != null)
				{
					sw.Dispose();
					sw = null;
				}
			}

			Application.UnLock();
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}