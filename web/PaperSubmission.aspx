<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PaperSubmission.aspx.cs" Inherits="Conference.PaperSubmission" %>

<asp:Content ID="cntHeader" ContentPlaceHolderID="cphHeader" runat="server">
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
	<div>
		<asp:Literal ID="ltrMessage" runat="server" Visible="false" />
		<table class="dataEntry">
			<tr>
				<td style="text-align: right">
					<label>Last Name: *</label>
				</td>
				<td>
					<asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
				</td>
				<td>
					<asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" Text="*" Display="Dynamic" EnableClientScript="true" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right">
					<label>Name: *</label>
				</td>
				<td>
					<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
				</td>
				<td>
					<asp:RequiredFieldValidator runat="server" ID="flvFirstName" ControlToValidate="txtFirstName" Text="*" Display="Dynamic" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">
					<label>Tavalod: *</label>
				</td>
				<td>
					<asp:TextBox ID="txtTavalod" runat="server">
					</asp:TextBox>
					<asp:Calendar ID="calTavalod" runat="server" ShowTitle="true"></asp:Calendar>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td style="text-align: right">
					<label>Address: </label>
				</td>
				<td>
					<asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="400px" Rows="3" Wrap="true"></asp:TextBox>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td style="text-align: right">
					<label id="lblMaghtaeTahsiali" title="Maghtae Tahsiali">Maghtae Tahsiali: *</label>
				</td>
				<td>
					<asp:TextBox runat="server" ID="txtMaghtaeTahsiali"></asp:TextBox>
				</td>
				<td>
					<asp:RequiredFieldValidator runat="server" ID="rfvMaghtaeTahsiali" ControlToValidate="txtMaghtaeTahsiali" Text="*" Display="Dynamic" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right">
					<label id="lblReshteyeTahsiali" title="Reshteye Tahsiali">Reshteye Tahsiali: *</label>
				</td>
				<td>
					<asp:TextBox runat="server" ID="txtReshteyeTahsiali"></asp:TextBox>
				</td>
				<td>
					<asp:RequiredFieldValidator runat="server" ID="rfvReshteyeTahsiali" ControlToValidate="txtReshteyeTahsiali" Text="*" Display="Dynamic" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right">
					<label id="lblEmail" title="Email">Email: *</label>
				</td>
				<td>
					<asp:TextBox runat="server" ID="txtEmail"></asp:TextBox>
				</td>
				<td>
					<asp:RequiredFieldValidator runat="server" ID="rfvEmail" Text="*" ControlToValidate="txtEmail" Display="Dynamic" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right">
					<label id="lblTitle" title="Email">Title: *</label>
				</td>
				<td>
					<asp:TextBox runat="server" ID="txtTitle"></asp:TextBox>
				</td>
				<td>
					<asp:RequiredFieldValidator runat="server" ID="rfvTitle" Text="*" ControlToValidate="txtTitle" Display="Dynamic" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">
					<label>Document Summary: </label>
				</td>
				<td>
					<asp:TextBox ID="txtDocumentSummary" runat="server" TextMode="MultiLine" Width="400px" Rows="3" Wrap="true"></asp:TextBox>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">
					<span id="lblFileName" title="Document">Document: *</span>
				</td>
				<td>
					<asp:FileUpload ID="fuAttachmentFile" runat="server" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">
					<span>Language</span>
				</td>
				<td>
					<asp:DropDownList ID="ddlLanguage" runat="server" DataSourceID="odsSystemLanguages" DataValueField="lcid" DataTextField="name" />
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<center>
						<asp:Button ID="btnSubmit" runat="server" Text="Submit" onclick="btnSubmit_Click" />
						&nbsp;
						<input id="Reset" type="reset" value="reset" />
					</center>
				</td>
			</tr>
		</table>
	</div>
	<asp:ObjectDataSource ID="odsSystemLanguages" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Conference.DAL.SystemDataSetTableAdapters.SystemLanguagesTableAdapter"></asp:ObjectDataSource>
</asp:Content>
