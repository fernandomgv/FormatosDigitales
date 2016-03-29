<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSListMenu.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSListMenu"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSListMenu example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="menu.css" />
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <!--[if IE]>
<style type="text/css" media="screen">.Horizontal LI {
	BEHAVIOR: url(../CMSScripts/LIhover.htc)
}
#Horizontal2 UL UL {
	MARGIN-LEFT: 1px
}
.Vertical LI {
	BEHAVIOR: url(../CMSScripts/LIhover.htc)
}
.DropDown {
	BEHAVIOR: url(../CMSScripts/LIhover.htc)
}
.Vertical LI {
	FLOAT: left; WIDTH: 100%
}
.DropDown LI {
	FLOAT: left; WIDTH: 100%
}
</style>
<![endif]-->
</head>
<body>
    <form id="form1" runat="server" style="z-index: 1">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSListMenu example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <%--HORIZONTAL 1--%>
                <div class="Horizontal">
                    <strong>Horizontal list menu</strong><br />
                    <br />
                    <cms:CMSListMenu ClassNames="cms.menuitem;cms.product;CMS.CellPhone;CMS.Laptop;CMS.PDA" ID="Horizontal1" runat="server" CSSPrefix="Main;SubMenu;OtherSubMenus"
                        HighlightedNodePath="/Products/Notebooks" DisplayHighlightedItemAsLink="True"
                        LastItemFirstItemCssClass="first" HighlightAllItemsInPath="true"
                        Path="/Products/%"  EncodeMenuCaption="true" />
                </div>
                <%-- HORIZONTAL  --%>
                <%--		        <div class="Horizontal" style="MARGIN-TOP:5px">
			        <cms:CMSListMenu id="Horizontal2" runat="server" CSSPrefix="Main;SubMenu;OtherSubMenus"
				    HighlightedNodePath="/Products" DisplayHighlightedItemAsLink="True" LastItemfirstitemcssclass="first"
				    RenderCssClasses="False" RenderItemID="True" Path="/Examples/%" />
		        </div>--%>
                <div style="float: left; width: 100%">
                    <div style="margin-top: 30px; float: left">
                        <%--Vertical--%>
                        <strong>Vertical list menu</strong>
                        <br />
                        <br />
                        <div class="Vertical">
                            <cms:CMSListMenu ID="Vertical" runat="server" HighlightedNodePath="/Home" CSSPrefix="Main;SubMenu;OtherSubMenus"
                                FirstItemLastItemCssClass="last" DisplayHighlightedItemAsLink="True" EncodeMenuCaption="true" />
                        </div>
                    </div>
                    <div style="margin-top: 30px; float: right; margin-left: 0px">
                        <strong>Dropdown list menu</strong><br />
                        <br />
                        <%-- Dropdown --%>
                        <div class="DropDown">
                            <cms:CMSListMenu ID="DropDown" runat="server" HighlightedNodePath="" CSSPrefix="Main;SubMenu;OtherSubMenus"
                                DisplayHighlightedItemAsLink="True" EncodeMenuCaption="true" />
                            <div style="padding-right: 2px; padding-left: 2px; padding-bottom: 2px; padding-top: 2px">
                                ... choose ...</div>
                        </div>
                    </div>
                </div>
                <%--DEFAULT--%>
                <div style="margin-top: 15px; float: left;">
                    <strong>Classic list menu</strong><br />
                    <br />
                    <cms:CMSListMenu ID="Menu1" runat="server" RenderLinkTitle="true" EncodeMenuCaption="true" />
                </div>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
