<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMSModules_Membership_FormControls_Passwords_Password" CodeFile="Password.ascx.cs" %>
<div>
    <cms:CMSTextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="TextBoxField" MaxLength="100"></cms:CMSTextBox >
    <cms:CMSRequiredFieldValidator ID="rfvPassword" ValidationGroup="ConfirmRegForm" runat="server"
        ControlToValidate="txtPassword" Display="Dynamic"></cms:CMSRequiredFieldValidator>
</div>
