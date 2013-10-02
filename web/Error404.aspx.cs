using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conference
{
	public partial class Error404 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string strPath = Request.Params["aspxerrorpath"];

			string strFileName = System.IO.Path.GetFileName(strPath);

			switch (strFileName.ToUpper())
			{
				case "DEFALT.ASPX":
				case "DIFALT.ASPX":
				case "DEFUALT.ASPX":
					{
						Response.Clear();
						Response.Redirect("~/UploadPage.aspx", true);
						break;
					}
				default:
					break;
			}
		}
	}
}