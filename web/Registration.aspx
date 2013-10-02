<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Registration.aspx.cs" Inherits="Conference.Registration" %>

<asp:Content ID="cntHeadr" ContentPlaceHolderID="cphHeader" runat="server">
    <title>Registration</title>
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="cphMain" runat="server">
<center>
    <table class="dataEntry">
        <tr>
            <td>
                <span>UserName</span>
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName"
                    Text="*" ToolTip="You did not specify user name"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <span>Password</span>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    Text="*" ToolTip="You did not specify password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <span>Confirm Password</span>
            </td>
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                    Text="*" ToolTip="You did not specify confirm password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <span>Email</span>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    Text="*" ToolTip="You did not specify email"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <span>Confirm Email</span>
            </td>
            <td>
                <asp:TextBox ID="txtConfirmEmail" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvConfirmEmail" runat="server" ControlToValidate="txtConfirmEmail"
                    Text="*" ToolTip="You did not specify confirm email"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <span>Full Name</span>
            </td>
            <td>
                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvFullText" runat="server" ControlToValidate="txtFullName"
                    Text="*" ToolTip="You did not specify full name!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
                &nbsp;
                <input id="Reset" type="reset" value="reset" />
            </td>
        </tr>
    </table>
</center>
</asp:Content>
