<%@ Page Language="c#" Inherits="CMSControlsExamples.CMSBreadCrumbs" CodeFile="CMSBreadCrumbs.aspx.cs"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSBreadCrumbs example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
	    .CMSBreadCrumbsLink { color: #c34c17; text-decoration: underline }
	    .CMSBreadCrumbsCurrentItem { color: #09ab05 }
	</style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSBreadCrumbs example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <cms:CMSBreadCrumbs ID="CMSBreadCrumbs1" runat="server" Path="/Products/Laptops"
                    ShowCurrentItem="true" />
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
