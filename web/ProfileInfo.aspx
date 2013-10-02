<%@ Page Title="ProfileInfo" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProfileInfo.aspx.cs" Inherits="Conference.ProfileInfo" %>
<asp:Content ID="cntHeader" ContentPlaceHolderID="cphHeader" runat="server">
	<style type="text/css">
        td
        {
            padding: 6px;
            vertical-align: top;
            border: solid 1px #eeeeee;
        }
    </style>
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
	<div>
		<h1>
			View and Update User Profile Information</h1>
		<p>
			This page lets you view and set profile information for the currently logged-in user.</p>
		<p>
			<a href="Default.aspx">Back to default page</a></p>
		<h2>
			View Profile Information</h2>
		&nbsp;<table>
			<tr>
				<td align="right">
					User name:
				</td>
				<td align="left">
					<asp:Label ID="Lbl_UserName" runat="server" Font-Bold="true" />
				</td>
			</tr>
			<tr>
				<td align="right">
					User roles:
				</td>
				<td align="left">
					<asp:Label ID="Lbl_Roles" runat="server" Font-Bold="true" />
				</td>
			</tr>
			<tr>
				<td align="right">
					First name:
				</td>
				<td>
					<asp:Label ID="Lbl_FirstName" runat="server" Font-Bold="true" />
				</td>
			</tr>
			<tr>
				<td align="right">
					Last name:
				</td>
				<td>
					<asp:Label ID="Lbl_LastName" runat="server" Font-Bold="true" />
				</td>
			</tr>
			<tr>
				<td align="right">
					Phone number:
				</td>
				<td>
					<asp:Label ID="Lbl_Phone" runat="server" Font-Bold="true" />
				</td>
			</tr>
		</table>
		<br />
		<asp:Button ID="But_ReadProfile" runat="server" OnClick="But_ReadProfile_Click" Text="Read Profile Information" />
		<br />
		<hr />
		<h2>
			Update Profile Information
		</h2>
		<table>
			<tr>
				<td align="right">
					First name:
				</td>
				<td align="left">
					<asp:TextBox ID="TB_FirstName" runat="server" />
				</td>
			</tr>
			<tr>
				<td align="right">
					Last name:
				</td>
				<td align="left">
					<asp:TextBox ID="TB_LastName" runat="server" />
				</td>
			</tr>
			<tr>
				<td align="right">
					Phone number:
				</td>
				<td align="left">
					<asp:TextBox ID="TB_phoneNumber" runat="server" />
				</td>
			</tr>
		</table>
		<br />
		<asp:Button ID="But_UpdateProfile" runat="server" OnClick="But_UpdateProfile_Click" Text="Update Profile Data" />
	</div>
</asp:Content>
