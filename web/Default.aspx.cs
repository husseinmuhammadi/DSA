using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Conference
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Initialize();

			//int intFirstNum = 3;
			//int intSecondNum = 0;
			//int intResultNum = 3;

			//intResultNum = intFirstNum / intSecondNum;
        }

        private void Initialize()
        {
			//if (!Roles.RoleExists("managers"))
			//{
			//    Roles.CreateRole("managers");
			//}

			//Roles.AddUserToRole("admin", "managers");
        }

        protected void Page_Error(object sender, EventArgs e)
        {
            {
                if ((Server != null) && (Server.GetLastError() != null) && (Server.GetLastError().GetBaseException() != null))
                {
                    System.Exception ex = Server.GetLastError().GetBaseException();
                    string strErrorMassage = "'<b>" + ex.Message + "'</b> Occured on " + System.DateTime.Now.ToString("yyyy/mm/dd - hh:mm:ss");
                    Response.Write("<br />" + strErrorMassage + "<br />");
                    // Server.ClearError();
                }
            }
        }
    }
}
