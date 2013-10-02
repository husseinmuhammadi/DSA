using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Conference.Account;
using System.Web.Security;
using System.Web.Profile;

namespace Conference
{
	public partial class PaperSubmission : System.Web.UI.Page
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
				txtFirstName.Enabled = false;
				txtLastName.Text = AccountProfile.CurrentUser.LastName;
				txtLastName.Enabled = false;
				txtEmail.Text = Membership.GetUser().Email;
				txtEmail.Enabled = false;
			}
		}

		protected void btnSubmit_Click(object sender, EventArgs e)
		{
			if (!Page.IsValid)
				return;

			// Upload Attachment File
			try
			{
				int iAuthorID = -1;
				// Upload Author Information
				DAL.ConferenceDataSet.AuthorsDataTable dataTableAuthors = new DAL.ConferenceDataSet.AuthorsDataTable();
				DAL.ConferenceDataSet.AuthorsRow rowAuthors = dataTableAuthors.NewAuthorsRow();
				if (!User.Identity.IsAuthenticated)
				{
					rowAuthors.FirstName = txtFirstName.Text;
					rowAuthors.LastName = txtLastName.Text;
					rowAuthors.Email = txtEmail.Text;
				}
				else
				{
					rowAuthors.FirstName = AccountProfile.CurrentUser.FirstName;
					rowAuthors.LastName = AccountProfile.CurrentUser.LastName;
					rowAuthors.Email = Membership.GetUser().Email;
				}
				dataTableAuthors.AddAuthorsRow(rowAuthors);
				DAL.ConferenceDataSetTableAdapters.AuthorsTableAdapter tableAdapterAuthors = new DAL.ConferenceDataSetTableAdapters.AuthorsTableAdapter();
				tableAdapterAuthors.Update(dataTableAuthors);
				iAuthorID = rowAuthors.AuthorID;

				DAL.ConferenceDataSet.DocumentsDataTable dataTableDocuments = new DAL.ConferenceDataSet.DocumentsDataTable();
				DAL.ConferenceDataSet.DocumentsRow drDocument = dataTableDocuments.NewDocumentsRow();

				drDocument.Title = txtTitle.Text;
				drDocument.DocumentSummary = txtDocumentSummary.Text;
				drDocument.SetStatusIDRefNull();

				int iIndex = ddlLanguage.SelectedIndex;
				if (iIndex > -1)
					drDocument.LanguageLCID = System.Convert.ToInt32(ddlLanguage.Items[iIndex].Value);
				else
					drDocument.LanguageLCID = 1033; // en-us

				if (User.Identity.IsAuthenticated)
					drDocument.UserName = Membership.GetUser().UserName;
				else
					drDocument.UserName = null;

				drDocument.ModifiedDate = DateTime.Now;

				dataTableDocuments.AddDocumentsRow(drDocument);

				DAL.ConferenceDataSetTableAdapters.DocumentsTableAdapter adptConference = new DAL.ConferenceDataSetTableAdapters.DocumentsTableAdapter();
				adptConference.Update(dataTableDocuments);

				int iDocumentID = drDocument.DocumentID;

				int iFileID = DAL.DataAccessLayerManagement.UploadFile(fuAttachmentFile.PostedFile, iDocumentID);

				// Upload Paper
				DAL.ConferenceDataSet.PapersDataTable dataTablePapers = new DAL.ConferenceDataSet.PapersDataTable();
				DAL.ConferenceDataSet.PapersRow rowPaper = dataTablePapers.NewPapersRow();

				rowPaper.AuthorIDRef = iAuthorID;

				rowPaper.DocumentIDRef = iDocumentID;
				dataTablePapers.AddPapersRow(rowPaper);
				DAL.ConferenceDataSetTableAdapters.PapersTableAdapter adapterPapers = new DAL.ConferenceDataSetTableAdapters.PapersTableAdapter();
				adapterPapers.Update(dataTablePapers);
			}
			catch (ArgumentException exception)
			{
				ltrMessage.Visible = true;
				ltrMessage.Text = exception.Message;
			}
			catch (System.Data.NoNullAllowedException exception)
			{
				ltrMessage.Visible = true;
				ltrMessage.Text = exception.Message;
			}
			catch (System.Data.SqlClient.SqlException exception)
			{
				ltrMessage.Visible = true;
				ltrMessage.Text = exception.Message;
			}
		}
	}
}