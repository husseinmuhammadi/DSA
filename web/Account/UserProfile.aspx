<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Conference.Account.UserProfile" %>

<asp:Content ID="cntHeader" ContentPlaceHolderID="cphHeader" runat="server">
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
	<div>
		<table>
			<tr>
				<td>
					<span>First Name:</span>
				</td>
				<td>
					<asp:TextBox ID="txtFirstName" runat="server">
					</asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					<span>Last Name:</span>
				</td>
				<td>
					<asp:TextBox ID="txtLastName" runat="server">
					</asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
					<input id="btnReset" type="reset" value="Reset"></button>
				</td>
			</tr>
		</table>
	</div>
</asp:Content>
