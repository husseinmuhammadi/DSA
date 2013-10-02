using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conference
{
	public partial class GenericErrorPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!this.IsPostBack)
			{
				Initialize();
			}

			string strErrorPagePath = Request.Params["aspxerrorpath"];

			lnkRedirectUrl.NavigateUrl = strErrorPagePath;
			lnkRedirectUrl.Text = "Try Again...";
		}

		private void Initialize()
		{
		}
	}
}