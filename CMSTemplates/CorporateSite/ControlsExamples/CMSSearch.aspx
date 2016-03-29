<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSSearch.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSSearch"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSSearch example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSSearch example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <cms:CMSSearchDialog ID="CMSSearchDialog1" runat="server" />
                <br />
                <cms:CMSSearchResults ID="CMSSearchResults1" Path="/%" runat="server" CMSSearchDialogID="CMSSearchDialog1" />
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
