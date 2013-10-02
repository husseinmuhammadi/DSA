using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Profile;

namespace Conference.Account
{
	public class AccountProfile : ProfileBase
	{
		static public AccountProfile CurrentUser
		{
			get
			{
				return (AccountProfile)(ProfileBase.Create(Membership.GetUser().UserName));
			}
		}

		public string FirstName
		{
			get
			{
				return ((string)(base["FirstName"]));
			}
			set
			{
				base["FirstName"] = value;
				Save();
			}
		}

		public string LastName
		{
			get
			{
				return ((string)(base["LastName"]));
			}
			set
			{
				base["LastName"] = value;
				Save();
			}
		}


	}
}