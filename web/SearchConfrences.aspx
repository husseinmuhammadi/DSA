<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchConfrences.aspx.cs" Inherits="Conference.SearchConfrences" %>

<asp:Content ID="cntHeader" ContentPlaceHolderID="cphHeader" runat="server">
	<title>Search Confrences</title>
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
	<center>
		<table>
			<tr>
				<td>
					<label>Confrence</label>
					<asp:TextBox runat="server" ID="txtSearch"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Button runat="server" ID="btnSearch" Text="Search" />
				</td>
			</tr>
		</table>
	</center>
</asp:Content>
