<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSTreeMenu.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSTreeMenu"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSTreeMenu example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
	    .MainCMSTreeMenuTable { BORDER-RIGHT: black 0px solid; PADDING-RIGHT: 0px; BORDER-TOP: black 0px solid; PADDING-LEFT: 0px; PADDING-BOTTOM: 2px; BORDER-LEFT: black 0px solid; WIDTH: 200px; PADDING-TOP: 0px; BORDER-BOTTOM: black 0px solid }
	    .MainCMSTreeMenuItem { FONT-SIZE: 14px; BACKGROUND: #b8bafe }
	    .MainCMSTreeMenuSelectedItem { FONT-SIZE: 14px; BACKGROUND: #4a3c8c }
	    .MainCMSTreeMenuLink { COLOR: black; TEXT-DECORATION: none }
	    .MainCMSTreeMenuSelectedLink { COLOR: white; TEXT-DECORATION: none }
	    .SubMenuCMSTreeMenuItem { FONT-SIZE: 12px; BACKGROUND: #e7e7ff; WIDTH: 200px }
	    .SubMenuCMSTreeMenuSelectedItem { FONT-SIZE: 12px; BACKGROUND: #4a3c8c }
	    .SubMenuCMSTreeMenuLink { COLOR: black; TEXT-DECORATION: none }
	    .SubMenuCMSTreeMenuSelectedLink { COLOR: white; TEXT-DECORATION: none }
	    .OtherSubMenusCMSTreeMenuItem { PADDING-RIGHT: 5px; FONT-SIZE: 12px; BACKGROUND: #f6f6fe; WIDTH: 200px }
	    .OtherSubMenusCMSTreeMenuSelectedItem { FONT-SIZE: 12px; BACKGROUND: #4a3c8c }
	    .OtherSubMenusCMSTreeMenuLink { COLOR: black; TEXT-DECORATION: none }
	    .OtherSubMenusCMSTreeMenuSelectedLink { COLOR: white; TEXT-DECORATION: none }
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSTreeMenu example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <cms:CMSTreeMenu ID="CMSTreeMenu1" runat="server" CSSPrefix="Main;SubMenu;OtherSubMenus"
                    MenuItemOpenImageUrl="images/menuitem_selected.gif" MenuItemImageUrl="images/menuitem.gif"
                    Indentation="3" HighlightedNodePath="/products" GenerateOnlyOuterLink="True"  EncodeMenuCaption="true" />
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
