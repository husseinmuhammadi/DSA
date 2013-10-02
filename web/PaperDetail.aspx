<%@ Page Title="Paper Detail" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PaperDetail.aspx.cs" Inherits="Conference.PaperDetail" %>

<asp:Content ID="cntHeader" ContentPlaceHolderID="cphHeader" runat="server">
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
	<div id="dispaly">
		<div id="message">
			<asp:Label runat="server" ID="lblMessage" Visible="false" />
		</div>
		<fieldset>
			<legend>Paper Information</legend>
			<asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="odsDocument" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="false">
				<AlternatingRowStyle BackColor="White" />
				<CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
				<EditRowStyle BackColor="#2461BF" />
				<FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
				<Fields>
					<asp:HyperLinkField DataTextField="DocumentID" DataNavigateUrlFields="DocumentID" DataNavigateUrlFormatString="~\PaperDetail.aspx?DocumentID={0}" HeaderText="DocumentID" Target="_blank" SortExpression="DocumentID" InsertVisible="False" />
					<asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
					<asp:BoundField DataField="StatusTextEn" HeaderText="StatusTextEn" SortExpression="StatusTextEn" />
					<asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
					<asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
					<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
					<asp:BoundField DataField="ClientFileName" HeaderText="ClientFileName" SortExpression="ClientFileName" />
				</Fields>
				<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#EFF3FB" />
			</asp:DetailsView>
			<asp:Panel runat="server" ID="pnlDocumentDetail">
			</asp:Panel>
		</fieldset>
		<asp:LoginView runat="server">
			<RoleGroups>
				<asp:RoleGroup Roles="managers">
					<ContentTemplate>
						<table>
							<tr>
								<td>
									<asp:Button runat="server" ID="btnInitialEvaluation" Text="Initial Evaluation" OnClick="btnInitialEvaluation_Click" />
								</td>
								<td>
									<asp:Button runat="server" ID="btnArbitration" Text="Arbitration" OnClick="btnArbitration_Click" />
								</td>
								<td>
									<asp:Button runat="server" ID="btnAccepted" Text="Accepted" OnClick="btnAccepted_Click" />
								</td>
								<td>
									<asp:Button runat="server" ID="btnRejected" Text="Rejected" OnClick="btnRejected_Click" />
								</td>
							</tr>
						</table>
					</ContentTemplate>
				</asp:RoleGroup>
			</RoleGroups>
		</asp:LoginView>
	</div>
	<asp:ObjectDataSource runat="server" ID="odsDocument" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByDocumentID" TypeName="Conference.DAL.ConferenceDataSetTableAdapters.PaperListTableAdapter">
		<SelectParameters>
			<asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>
