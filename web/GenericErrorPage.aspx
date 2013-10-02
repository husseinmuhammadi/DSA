<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GenericErrorPage.aspx.cs" Inherits="Conference.GenericErrorPage" %>
<asp:Content ID="cntHeader" ContentPlaceHolderID="cphHeader" runat="server">
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
	<asp:Label ID="lblMessage" runat="server" Font-Size="XX-Large">An Error Occured...</asp:Label>
	<br />
	<br />
	<asp:HyperLink ID="lnkRedirectUrl" runat="server"></asp:HyperLink>
</asp:Content>
