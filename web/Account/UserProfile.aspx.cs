using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conference.Account
{
	public partial class UserProfile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
				Initialize();
		}

		private void Initialize()
		{
			if (User.Identity.IsAuthenticated)
			{
				txtFirstName.Text = AccountProfile.CurrentUser.FirstName;
				txtLastName.Text = AccountProfile.CurrentUser.LastName;
			}
		}

		protected void btnSave_Click(object sender, EventArgs e)
		{
			AccountProfile.CurrentUser.FirstName = txtFirstName.Text;
			AccountProfile.CurrentUser.LastName	= txtLastName.Text;
		}
	}
}