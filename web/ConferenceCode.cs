namespace Conference
{
	/// <summary>
	/// Summary description for MyClass
	/// </summary>
	public class GeneralPorpose
	{
		private GeneralPorpose()
		{
			//
			// TODO: Add constructor logic here
			//
		}

        public enum RegularExpressionValidatorEnum { Url, Email, UserName, Password }

		public static void SetRequiredFieldValidator(System.Web.UI.WebControls.RequiredFieldValidator validator, string controlToValidate, string caption, string strValidationGroup)
		{
			validator.ControlToValidate = controlToValidate;
			validator.CssClass = "FValidator";
			validator.Display = System.Web.UI.WebControls.ValidatorDisplay.Dynamic;
			validator.EnableClientScript = true;
			validator.Enabled = true;
			validator.EnableViewState = true;
			validator.ErrorMessage = "You did not specify [" + caption + "]!";
			validator.InitialValue = "";
			validator.Text = "*";
			validator.ToolTip = validator.ErrorMessage;
			validator.Visible = true;
			validator.ValidationGroup = strValidationGroup;
		}

		public static void SetRequiredFieldValidator(System.Web.UI.WebControls.RequiredFieldValidator validator, System.Web.UI.Control control, string caption, string strValidationGroup)
		{
			validator.ControlToValidate = control.ID;
			validator.CssClass = "FValidator";
			validator.Display = System.Web.UI.WebControls.ValidatorDisplay.Dynamic;
			validator.EnableClientScript = true;
			validator.Enabled = true;
			validator.EnableViewState = true;
			validator.ErrorMessage = "You did not specify [" + caption + "]!";
			validator.InitialValue = "";
			validator.Text = "*"; //  "<img src=\"Images/Next.gif\" />";
			validator.ToolTip = validator.ErrorMessage;
			validator.Visible = true;
			validator.ValidationGroup = strValidationGroup;
		}

		public static void SetRegularExpressionValidator(System.Web.UI.WebControls.RegularExpressionValidator validator, System.Web.UI.Control control, RegularExpressionValidatorEnum expr, string strValidationGroup)
		{
			validator.ControlToValidate = control.ID;
			validator.CssClass = "FValidator";
			validator.Display = System.Web.UI.WebControls.ValidatorDisplay.Dynamic;
			validator.EnableClientScript = true;
			validator.Enabled = true;
			validator.EnableViewState = true;
			validator.ErrorMessage = "You did not specify [" + /*caption*/ "" + "]!";
			validator.Text = "<img src=\"Images/Next.gif\" />";
			validator.ToolTip = validator.ErrorMessage;
			validator.Visible = true;
			validator.ValidationGroup = strValidationGroup;
			switch (expr)
			{
 				case RegularExpressionValidatorEnum.Email:
					validator.ValidationExpression = "";
					break;
			}
		}

		public static string GetMimeType(System.Drawing.Image i)
		{
			foreach (System.Drawing.Imaging.ImageCodecInfo codec in System.Drawing.Imaging.ImageCodecInfo.GetImageDecoders())
			{
				if (codec.FormatID == i.RawFormat.Guid)
					return codec.MimeType;
			}

			return "image/unknown";
		}
	}
}