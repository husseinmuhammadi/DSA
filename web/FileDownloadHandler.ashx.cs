using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Conference
{
	/// <summary>
	/// Summary description for FileDownloadHandler
	/// </summary>
	public class FileDownloadHandler : IHttpHandler
	{

		public void ProcessRequest(HttpContext context)
		{
			System.Configuration.Configuration rootWebConfig1 =
					System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(null);
			if (rootWebConfig1.AppSettings.Settings.Count > 0)
			{
				System.Configuration.KeyValueConfigurationElement customSetting =
					rootWebConfig1.AppSettings.Settings["customsetting1"];
				if (customSetting != null)
					Console.WriteLine("customsetting1 application string = \"{0}\"",
						customSetting.Value);
				else
					Console.WriteLine("No customsetting1 application string");
			}

			if (!String.IsNullOrWhiteSpace(context.Request.QueryString["FileID"]))
			{
				int iFileID = Int32.Parse(context.Request.QueryString["FileID"]);

				DAL.ConferenceDataSet.FilesDataTable dataTableFiles = new DAL.ConferenceDataSet.FilesDataTable();
				DAL.ConferenceDataSetTableAdapters.FilesTableAdapter adapterFilesTable = new DAL.ConferenceDataSetTableAdapters.FilesTableAdapter();
				adapterFilesTable.FillByFileID(dataTableFiles, iFileID);

				if (dataTableFiles.Rows.Count > 0)
				{
					DAL.ConferenceDataSet.FilesRow rowFiles = dataTableFiles[0];
					context.Response.ContentType = rowFiles.ContentType;
					context.Response.AddHeader("Content-Disposition", String.Format("attachment;filename=\"{0}\"", rowFiles.ClientFileName));
					context.Response.AddHeader("Content-Length", rowFiles.ContentLength.ToString());
					context.Response.BinaryWrite(rowFiles.Content);
					context.Response.End();
				}
			}
			else
			{
				context.Response.ContentType = "text/html";
				context.Response.Write("<p>Need a valid id</p>");
			}
		}

		private System.Drawing.Image GetImage(int id)
		{
			// Not sure how you are building your MemoryStream    
			// Once you have it, you just use the Image class to    
			// create the image from the stream.       
			System.IO.MemoryStream stream = new System.IO.MemoryStream();
			return System.Drawing.Image.FromStream(stream);
		}

		public bool IsReusable
		{
			get
			{
				return false;
			}
		}
	}
}