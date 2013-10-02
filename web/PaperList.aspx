<%@ Page Title="Paper List" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PaperList.aspx.cs" Inherits="Conference.PaperList" %>

<asp:Content ID="cntHeader" ContentPlaceHolderID="cphHeader" runat="server">
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
	<div>
		<fieldset>
			<legend>Search</legend>
			<table border="0px dotted #C0C0C0" width="90%">
				<tr>
					<td style="text-align: right;">
						<span>Title: </span>
					</td>
					<td>
						<asp:TextBox ID="txtTitle" runat="server" />
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<br />
						<asp:Button ID="btnSearch" runat="server" Text="Serach" />
						<asp:Button ID="txtCancel" runat="server" Text="Cancel" OnClick="txtCancel_Click" />
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>Paper List</legend>
			<asp:LoginView runat="server">
				<RoleGroups>
					<asp:RoleGroup Roles="managers">
						<ContentTemplate>
							<asp:GridView ID="gvwPaperList" runat="server" AutoGenerateColumns="False" DataSourceID="odsPaperList" DataKeyNames="DocumentID" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvwPaperList_SelectedIndexChanged">
								<AlternatingRowStyle BackColor="White" />
								<Columns>
									<asp:HyperLinkField DataTextField="DocumentID" DataNavigateUrlFields="DocumentID" DataNavigateUrlFormatString="~\PaperDetail.aspx?DocumentID={0}" HeaderText="DocumentID" Target="_self" SortExpression="DocumentID" InsertVisible="False" />
									<asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
									<asp:BoundField DataField="StatusTextEn" HeaderText="StatusTextEn" SortExpression="StatusTextEn" />
									<asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
									<asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
									<asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
									<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
									<asp:BoundField DataField="ClientFileName" HeaderText="ClientFileName" SortExpression="ClientFileName" />
								</Columns>
								<EditRowStyle BackColor="#2461BF" />
								<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
								<RowStyle BackColor="#EFF3FB" />
								<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
								<SortedAscendingCellStyle BackColor="#F5F7FB" />
								<SortedAscendingHeaderStyle BackColor="#6D95E1" />
								<SortedDescendingCellStyle BackColor="#E9EBEF" />
								<SortedDescendingHeaderStyle BackColor="#4870BE" />
							</asp:GridView>
						</ContentTemplate>
					</asp:RoleGroup>
				</RoleGroups>
				<LoggedInTemplate>
					<asp:GridView ID="gvwUserPaperList" runat="server" AutoGenerateColumns="False" DataSourceID="odsUserPaperList" DataKeyNames="DocumentID" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvwPaperList_SelectedIndexChanged">
						<AlternatingRowStyle BackColor="White" />
						<Columns>
							<asp:HyperLinkField DataTextField="DocumentID" DataNavigateUrlFields="DocumentID" DataNavigateUrlFormatString="~\PaperDetail.aspx?DocumentID={0}" HeaderText="DocumentID" Target="_self" SortExpression="DocumentID" InsertVisible="False" />
							<asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
							<asp:BoundField DataField="StatusTextEn" HeaderText="StatusTextEn" SortExpression="StatusTextEn" />
							<asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
							<asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
							<asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
							<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
							<asp:BoundField DataField="ClientFileName" HeaderText="ClientFileName" SortExpression="ClientFileName" />
						</Columns>
						<EditRowStyle BackColor="#2461BF" />
						<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
						<RowStyle BackColor="#EFF3FB" />
						<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
						<SortedAscendingCellStyle BackColor="#F5F7FB" />
						<SortedAscendingHeaderStyle BackColor="#6D95E1" />
						<SortedDescendingCellStyle BackColor="#E9EBEF" />
						<SortedDescendingHeaderStyle BackColor="#4870BE" />
					</asp:GridView>
				</LoggedInTemplate>
			</asp:LoginView>
		</fieldset>
	</div>
	<asp:ObjectDataSource ID="odsPaperList" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Conference.DAL.ConferenceDataSetTableAdapters.PaperListTableAdapter"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsUserPaperList" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByUserName" TypeName="Conference.DAL.ConferenceDataSetTableAdapters.PaperListTableAdapter">
		<SelectParameters>
			<asp:Parameter Name="UserName" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>
