<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Conference.ContactUs" %>

<asp:Content ID="cmtHeader" ContentPlaceHolderID="cphHeader" runat="server">
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
	<div>
		<label for="txtFullName">Your Name: &nbsp;</label>
	</div>
	<div>
		<asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
	</div>
	<br />
	<div>
		<label>Your Email: </label>
	</div>
	<div>
		<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
	</div>
	<br />
	<div>
		<label>Subject: </label>
	</div>
	<div>
		<asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
	</div>
	<br />
	<div>
		<label>Message:</label>
	</div>
	<div>
		<asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Width="400px" Rows="3" Wrap="true"></asp:TextBox>
	</div>
	<br />
	<div style="text-align: center; width: 100%;">
		<input type="submit" value="Submit" />
	</div>
</asp:Content>
