using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Conference
{
	public partial class PaperList : System.Web.UI.Page
	{
		private DAL.ConferenceDataSet.PaperListDataTable dataTablePaperList;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
				Initialize();
			odsUserPaperList.SelectParameters["UserName"].DefaultValue = Membership.GetUser().UserName;
		}

		private void Initialize()
		{
			if (User.Identity.IsAuthenticated)
			{
 				
			}
		}

		protected void txtCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Default.aspx");
		}

		protected void gvwPaperList_SelectedIndexChanged(object sender, EventArgs e)
		{

		}
	}
}