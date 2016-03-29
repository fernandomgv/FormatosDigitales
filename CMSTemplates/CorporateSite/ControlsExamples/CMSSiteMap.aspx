<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSSiteMap.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSSiteMap"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSSiteMap example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
	    .CMSSiteMapList { }
	    .CMSSiteMapListItem { LIST-STYLE-IMAGE: url(images/menuitem.gif) }
	    .CMSSiteMapLink { color: #c34c17; text-decoration: none }
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSSiteMap example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <cms:CMSSiteMap ID="CMSSiteMap1" runat="server"  EncodeMenuCaption="true" />
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
