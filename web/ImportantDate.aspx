<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ImportantDate.aspx.cs" Inherits="Conference.ImportantDate" %>

<asp:Content ID="cntHeader" ContentPlaceHolderID="cphHeader" runat="server">
	<title>Important Date</title>
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
	<asp:Literal runat="server" ID="literalImportantDate"></asp:Literal>
</asp:Content>
