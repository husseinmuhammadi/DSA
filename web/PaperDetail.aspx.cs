using System;
using System.Collections.Generic;
using System.Linq;
// using System.Web;
// using System.Web.UI;
// using System.Web.UI.WebControls;
using Conference.Account;
using System.Web.Security;

namespace Conference
{
	public partial class PaperDetail : System.Web.UI.Page
	{
		private int iDocumentID;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
				Initialize();

			string[] values = Request.QueryString.GetValues("DocumentID");
			if (values == null)
				return;

			iDocumentID = System.Convert.ToInt32(values[0]);

			DAL.ConferenceDataSet.PaperListDataTable dataTableDocument;
			DAL.ConferenceDataSetTableAdapters.PaperListTableAdapter adapterDocument = new DAL.ConferenceDataSetTableAdapters.PaperListTableAdapter();
			dataTableDocument = adapterDocument.GetDataByDocumentID(iDocumentID);

			System.Web.UI.WebControls.Table table = new System.Web.UI.WebControls.Table();

			int iRows = dataTableDocument.Rows.Count;

			for (int i = 0; i < iRows; i++)
			{
				// System.Data.DataRow dataRow = dataTableDocument.Rows[i];
				DAL.ConferenceDataSet.PaperListRow dataRow = (DAL.ConferenceDataSet.PaperListRow)dataTableDocument.Rows[i];

				// Define a new Web Control Image
				/*System.Web.UI.WebControls.Image imgCoverImage = new System.Web.UI.WebControls.Image();
				imgCoverImage.AlternateText = dr["Title"].ToString();
				string strImageUrl = System.String.Format("~/ImageHandler.ashx?id={0}", documentIDParam);
				imgCoverImage.ImageUrl = strImageUrl;
				cellImage.Controls.Add(imgCoverImage);*/

				// Define a new Web Control Table Row
				System.Web.UI.WebControls.TableRow tableRow = new System.Web.UI.WebControls.TableRow();

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellDocumentIDLabel = new System.Web.UI.WebControls.TableCell();
				tableCellDocumentIDLabel.Style["text-align"] = "right;";
				System.Web.UI.WebControls.Label lblDocumentID = new System.Web.UI.WebControls.Label();
				lblDocumentID.Text = "DocumentID";
				tableCellDocumentIDLabel.Controls.Add(lblDocumentID);
				tableRow.Cells.Add(tableCellDocumentIDLabel);

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellDocumentIDText = new System.Web.UI.WebControls.TableCell();
				System.Web.UI.WebControls.TextBox txtDocumentID = new System.Web.UI.WebControls.TextBox();
				txtDocumentID.Text = dataRow.DocumentID.ToString();
				tableCellDocumentIDText.Controls.Add(txtDocumentID);
				tableRow.Cells.Add(tableCellDocumentIDText);

				table.Rows.Add(tableRow);

				// Define a new Web Control Table Row
				tableRow = new System.Web.UI.WebControls.TableRow();

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellTitleLabel = new System.Web.UI.WebControls.TableCell();
				tableCellTitleLabel.Style["text-align"] = "right;";
				System.Web.UI.WebControls.Label lblTitle = new System.Web.UI.WebControls.Label();
				lblTitle.Text = "Title";
				tableCellTitleLabel.Controls.Add(lblTitle);
				tableRow.Cells.Add(tableCellTitleLabel);

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellTitleText = new System.Web.UI.WebControls.TableCell();
				System.Web.UI.WebControls.TextBox txtTitle = new System.Web.UI.WebControls.TextBox();
				txtTitle.Text = dataRow.Title.ToString();
				tableCellTitleText.Controls.Add(txtTitle);
				tableRow.Cells.Add(tableCellTitleText);

				table.Rows.Add(tableRow);

				// Define a new Web Control Table Row
				tableRow = new System.Web.UI.WebControls.TableRow();

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellStatusTextEnLabel = new System.Web.UI.WebControls.TableCell();
				tableCellStatusTextEnLabel.Style["text-align"] = "right;";
				System.Web.UI.WebControls.Label lblStatusTextEn = new System.Web.UI.WebControls.Label();
				lblStatusTextEn.Text = "StatusTextEn";
				tableCellStatusTextEnLabel.Controls.Add(lblStatusTextEn);
				tableRow.Cells.Add(tableCellStatusTextEnLabel);

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellStatusTextEnText = new System.Web.UI.WebControls.TableCell();
				System.Web.UI.WebControls.TextBox txtStatusTextEn = new System.Web.UI.WebControls.TextBox();
				if (!dataRow.IsStatusTextEnNull())
					txtStatusTextEn.Text = dataRow.StatusTextEn.ToString();
				else
					txtStatusTextEn.Text = "";
				tableCellStatusTextEnText.Controls.Add(txtStatusTextEn);
				tableRow.Cells.Add(tableCellStatusTextEnText);

				table.Rows.Add(tableRow);

				// Define a new Web Control Table Row
				tableRow = new System.Web.UI.WebControls.TableRow();

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellFirstNameLabel = new System.Web.UI.WebControls.TableCell();
				tableCellFirstNameLabel.Style["text-align"] = "right;";
				System.Web.UI.WebControls.Label lblFirstName = new System.Web.UI.WebControls.Label();
				lblFirstName.Text = "FirstName";
				tableCellFirstNameLabel.Controls.Add(lblFirstName);
				tableRow.Cells.Add(tableCellFirstNameLabel);

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellFirstNameText = new System.Web.UI.WebControls.TableCell();
				System.Web.UI.WebControls.TextBox txtFirstName = new System.Web.UI.WebControls.TextBox();
				if (!dataRow.IsFirstNameNull())
					//if (!String.IsNullOrEmpty(dataRow.FirstName))
					txtFirstName.Text = dataRow.FirstName;
				else
					txtFirstName.Text = "";
				tableCellFirstNameText.Controls.Add(txtFirstName);
				tableRow.Cells.Add(tableCellFirstNameText);

				table.Rows.Add(tableRow);

				// Define a new Web Control Table Row
				tableRow = new System.Web.UI.WebControls.TableRow();

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellLastNameLabel = new System.Web.UI.WebControls.TableCell();
				tableCellLastNameLabel.Style["text-align"] = "right;";
				System.Web.UI.WebControls.Label lblLastName = new System.Web.UI.WebControls.Label();
				lblLastName.Text = "LastName";
				tableCellLastNameLabel.Controls.Add(lblLastName);
				tableRow.Cells.Add(tableCellLastNameLabel);

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellLastNameText = new System.Web.UI.WebControls.TableCell();
				System.Web.UI.WebControls.TextBox txtLastName = new System.Web.UI.WebControls.TextBox();
				if (!dataRow.IsLastNameNull())
					// if (String.IsNullOrEmpty(dataRow.LastName))
					txtLastName.Text = dataRow.LastName;
				else
					txtLastName.Text = "";
				tableCellLastNameText.Controls.Add(txtLastName);
				tableRow.Cells.Add(tableCellLastNameText);

				table.Rows.Add(tableRow);

				// Define a new Web Control Table Row
				tableRow = new System.Web.UI.WebControls.TableRow();

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellEmailLabel = new System.Web.UI.WebControls.TableCell();
				tableCellEmailLabel.Style["text-align"] = "right;";
				System.Web.UI.WebControls.Label lblEmail = new System.Web.UI.WebControls.Label();
				lblEmail.Text = "Email";
				tableCellEmailLabel.Controls.Add(lblEmail);
				tableRow.Cells.Add(tableCellEmailLabel);

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellEmailText = new System.Web.UI.WebControls.TableCell();
				System.Web.UI.WebControls.TextBox txtEmail = new System.Web.UI.WebControls.TextBox();
				if (!dataRow.IsEmailNull())
					// if (String.IsNullOrEmpty(dataRow.Email))
					txtEmail.Text = dataRow.Email;
				else
					txtEmail.Text = "";

				tableCellEmailText.Controls.Add(txtEmail);
				tableRow.Cells.Add(tableCellEmailText);

				table.Rows.Add(tableRow);

				// Define a new Web Control Table Row
				tableRow = new System.Web.UI.WebControls.TableRow();

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellClientFileNameLabel = new System.Web.UI.WebControls.TableCell();
				tableCellClientFileNameLabel.Style["text-align"] = "right;";
				System.Web.UI.WebControls.Label lblClientFileName = new System.Web.UI.WebControls.Label();
				lblClientFileName.Text = "ClientFileName";
				tableCellClientFileNameLabel.Controls.Add(lblClientFileName);
				tableRow.Cells.Add(tableCellClientFileNameLabel);

				// Define a new Web Control Table Cell
				System.Web.UI.WebControls.TableCell tableCellClientFileNameText = new System.Web.UI.WebControls.TableCell();
				System.Web.UI.WebControls.TextBox txtClientFileName = new System.Web.UI.WebControls.TextBox();
				if (!dataRow.IsClientFileNameNull())
					// if (String.IsNullOrEmpty(dataRow.ClientFileName))
					txtClientFileName.Text = dataRow.ClientFileName;
				else
					txtClientFileName.Text = "";
				tableCellClientFileNameText.Controls.Add(txtClientFileName);
				tableRow.Cells.Add(tableCellClientFileNameText);

				table.Rows.Add(tableRow);

				/*				System.Web.UI.WebControls.HyperLink hlnkBookName = new System.Web.UI.WebControls.HyperLink();
									hlnkBookName.Text = dr["Title"].ToString();
									hlnkBookName.NavigateUrl = "~/BookDetails.aspx?pBookID=" + System.Convert.ToString(dr["TitleID"].ToString());
									cellProp.Controls.Add(hlnkBookName);

									cellProp.Controls.Add(new System.Web.UI.LiteralControl("<br />"));

									System.Web.UI.WebControls.Label lblAuthors = new System.Web.UI.WebControls.Label();
									lblAuthors.Text = "Authors: ";
									cellProp.Controls.Add(lblAuthors);

									System.Xml.XmlDocument doc = new System.Xml.XmlDocument();

									if (!(dr["Authors"] == null || dr.IsNull("Authors")))
									{
										doc.LoadXml((string)dr["Authors"]);
										System.Xml.XmlElement root = doc.DocumentElement;

										// System.Xml.XmlNode root = doc.FirstChild;

										//Display the contents of the child nodes.
										if (root.HasChildNodes)
											for (int iIndex = 0; iIndex < root.ChildNodes.Count; iIndex++)
											{
												System.Xml.XmlNode xmlNodeAuthor = root.ChildNodes[iIndex];

												System.Xml.XmlElement xmlElementAuthorID = xmlNodeAuthor["AuthorID"];
												System.Xml.XmlElement xmlElementAuthorName = xmlNodeAuthor["AuthorName"];

												System.Web.UI.WebControls.HyperLink hlnkAuthor = new System.Web.UI.WebControls.HyperLink();
												hlnkAuthor.Text = xmlElementAuthorName.InnerText;
												hlnkAuthor.NavigateUrl = "~/Author.aspx?pAuthorID=" + xmlElementAuthorID.InnerText;
												cellProp.Controls.Add(hlnkAuthor);

												cellProp.Controls.Add(new System.Web.UI.LiteralControl("&nbsp"));

											}
									}

									cellProp.Controls.Add(new System.Web.UI.LiteralControl("<br />"));

									System.Web.UI.WebControls.Label lblTrabslator = new System.Web.UI.WebControls.Label();
									lblTrabslator.Text = "Translators: ";
									cellProp.Controls.Add(lblTrabslator);

									if (!(dr["Translators"] == null || dr.IsNull("Translators")))
									{
										doc.LoadXml((string)dr["Translators"]);
										System.Xml.XmlElement root = doc.DocumentElement;

										// System.Xml.XmlNode root = doc.FirstChild;

										//Display the contents of the child nodes.
										if (root.HasChildNodes)
											for (int iIndex = 0; iIndex < root.ChildNodes.Count; iIndex++)
											{
												System.Xml.XmlNode xmlNodeAuthor = root.ChildNodes[iIndex];

												System.Xml.XmlElement xmlElementAuthorID = xmlNodeAuthor["TranslatorID"];
												System.Xml.XmlElement xmlElementAuthorName = xmlNodeAuthor["TranslatorName"];

												System.Web.UI.WebControls.HyperLink hlnkAuthor = new System.Web.UI.WebControls.HyperLink();
												hlnkAuthor.Text = xmlElementAuthorName.InnerText;
												hlnkAuthor.NavigateUrl = "~/Author.aspx?pAuthorID=" + xmlElementAuthorID.InnerText;
												cellProp.Controls.Add(hlnkAuthor);

												cellProp.Controls.Add(new System.Web.UI.LiteralControl("&nbsp"));

											}
									}

									cellProp.Controls.Add(new System.Web.UI.LiteralControl("<br />"));

									System.Web.UI.WebControls.Label lblPublisher = new System.Web.UI.WebControls.Label();
									lblPublisher.Text = "Publisher: " + dr["Publisher"].ToString();
									cellProp.Controls.Add(lblPublisher);

									cellProp.Controls.Add(new System.Web.UI.LiteralControl("<br />"));

									System.Web.UI.WebControls.Label lblPublishedDate = new System.Web.UI.WebControls.Label();
									lblPublishedDate.Text = "Published Date: " + dr["PublishedDate"].ToString();
									cellProp.Controls.Add(lblPublishedDate);

									cellProp.Controls.Add(new System.Web.UI.LiteralControl("<br />"));

									System.Web.UI.WebControls.Label lblPrintingTimes = new System.Web.UI.WebControls.Label();
									lblPrintingTimes.Text = "PrintingTimes: " + dr["PrintingTimes"].ToString();
									cellProp.Controls.Add(lblPrintingTimes);

									cellProp.Controls.Add(new System.Web.UI.LiteralControl("<br />"));

									System.Web.UI.WebControls.Label lblPages = new System.Web.UI.WebControls.Label();
									lblPages.Text = "Pages: " + dr["Pages"].ToString();
									cellProp.Controls.Add(lblPages);

									cellProp.Controls.Add(new System.Web.UI.LiteralControl("<br />"));

									System.Web.UI.WebControls.Label lblDocumentSummary = new System.Web.UI.WebControls.Label();
									lblDocumentSummary.Text = "DocumentSummary: " + dr["DocumentSummary"].ToString();
									cellProp.Controls.Add(lblDocumentSummary);

									cellProp.Controls.Add(new System.Web.UI.LiteralControl("<br />"));
									cellProp.Controls.Add(new System.Web.UI.LiteralControl("<br />"));


									System.Web.UI.WebControls.HyperLink hlnkDownload = new System.Web.UI.WebControls.HyperLink();
									hlnkDownload.Text = "Download";

									if (!(dr["DocumentID"] == null || dr.IsNull("DocumentID")))
									{
										string strDownloadPath = System.String.Format("~/FileDownloadHandler.ashx?FileID={0}", dr["DocumentID"].ToString());
										hlnkDownload.NavigateUrl = strDownloadPath;
									}
									cellProp.Controls.Add(hlnkDownload);

					 */

				tableRow = new System.Web.UI.WebControls.TableRow();
				System.Web.UI.WebControls.TableCell tableCellDownloadHyperLink = new System.Web.UI.WebControls.TableCell();
				System.Web.UI.WebControls.HyperLink hlnkDownload = new System.Web.UI.WebControls.HyperLink();
				hlnkDownload.Text = "Download";
				if (/*dataRow.FileID != null &&*/ !dataRow.IsFileIDNull())
				{
					string strDownloadPath = System.String.Format("~/FileDownloadHandler.ashx?FileID={0}", dataRow.FileID.ToString());
					hlnkDownload.NavigateUrl = strDownloadPath;
				}
				tableCellDownloadHyperLink.Controls.Add(hlnkDownload);
				tableRow.Cells.Add(tableCellDownloadHyperLink);
				table.Rows.Add(tableRow);
			}

			pnlDocumentDetail.Controls.Add(table);
			pnlDocumentDetail.Controls.Add(new System.Web.UI.LiteralControl("<br />"));
		}

		private void Initialize()
		{
		}

		protected void btnInitialEvaluation_Click(object sender, EventArgs e)
		{
			UpdateDocumentStatus(DAL.StatusEnum.InitialEvaluation);
		}

		protected void btnArbitration_Click(object sender, EventArgs e)
		{
			UpdateDocumentStatus(DAL.StatusEnum.Arbitration);
		}

		protected void btnAccepted_Click(object sender, EventArgs e)
		{
			UpdateDocumentStatus(DAL.StatusEnum.Accepted);
		}

		protected void btnRejected_Click(object sender, EventArgs e)
		{
			UpdateDocumentStatus(DAL.StatusEnum.Rejected);
		}

		protected void UpdateDocumentStatus(DAL.StatusEnum Status)
		{
			DAL.ConferenceDataSet.DocumentsDataTable dataTableDocuments = new DAL.ConferenceDataSet.DocumentsDataTable();
			DAL.ConferenceDataSetTableAdapters.DocumentsTableAdapter adapterDocuments = new DAL.ConferenceDataSetTableAdapters.DocumentsTableAdapter();
			dataTableDocuments = adapterDocuments.GetDataByDocumentID(iDocumentID);
			for (int i = 0; i < dataTableDocuments.Rows.Count; i++)
			{
				DAL.ConferenceDataSet.DocumentsRow rowDocuments = (DAL.ConferenceDataSet.DocumentsRow)dataTableDocuments.Rows[i];
				rowDocuments.StatusIDRef = (int)Status;
			}
			adapterDocuments.Update(dataTableDocuments);
			Response.Redirect("~/PaperList.aspx");
		}
	}
}