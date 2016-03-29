<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSMenu.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSMenu"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSMenu example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <!-- 
    The following style makes the menu transparent:

    .CMSMenu { BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px; BACKGROUND-COLOR: transparent }
    .submenuCMSMenuItem { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; BACKGROUND: gray; filter:alpha(opacity=90); -moz-opacity:0.5; opacity: 0.5; PADDING-BOTTOM: 2px; WIDTH: 150px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }

    You also need to set (in code behind) the zIndex value to 0 and the RenderZindexValues property to false:
    CMSMenu1.MenuControl.zIndex = 0
    CMSMenu1.MenuControl.RenderZindexValues = False

    And you need to put a <span> element around the menu control that will set the background for the main menu:
    <span style="background:blue">... CMSMenu control ...</span>
    -->
    <style type="text/css">
        /* horizontal menu - main menu and sub-menu*/
        .MainCMSMenu { BORDER-RIGHT: 0px; TABLE-LAYOUT: fixed; BORDER-TOP: 0px; BORDER-LEFT: 0px; WIDTH: 100px; BORDER-BOTTOM: 0px; BACKGROUND-COLOR: #b8bafe }
        .MainCMSMenuItem { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }
        .MainCMSMenuItemMouseUp { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }
        .MainCMSMenuItemMouseOver { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: white; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #4a3c8c }
        .MainCMSMenuItemMouseDown { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }
        .MainCMSMenuHighlightedMenuItem { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .MainCMSMenuHighlightedMenuItemMouseUp { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .MainCMSMenuHighlightedMenuItemMouseOver { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .MainCMSMenuHighlightedMenuItemMouseDown { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .SubCMSMenuItem { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; BACKGROUND: #e7e7ff; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }
        .SubCMSMenuItemMouseUp { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }
        .SubCMSMenuItemMouseOver { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: white; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: green }
        .SubCMSMenuItemMouseDown { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }
        .SubCMSMenuHighlightedMenuItem { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .SubCMSMenuHighlightedMenuItemMouseUp { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .SubCMSMenuHighlightedMenuItemMouseOver { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .SubCMSMenuHighlightedMenuItemMouseDown { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
  
        /* specifying different styles for particular items */
        .MainCMSMenuItemMouseOver#CMSMenu1-000 { BACKGROUND-COLOR: #4a3c8c }
        .MainCMSMenuItemMouseOver#CMSMenu1-001 { BACKGROUND-COLOR: #5a4c9c }
        .MainCMSMenuItemMouseOver#CMSMenu1-002 { BACKGROUND-COLOR: #6a5cac }
        .MainCMSMenuItemMouseOver#CMSMenu1-003 { BACKGROUND-COLOR: #7a6cbc }
        .MainCMSMenuItemMouseOver#CMSMenu1-004 { BACKGROUND-COLOR: #8a7ccc }
        .MainCMSMenuItemMouseOver#CMSMenu1-005 { BACKGROUND-COLOR: #9a8cdc }        
        
        /* vertical menu - all menu levels */
        .CMSMenu { BORDER-RIGHT: 0px; TABLE-LAYOUT: fixed; BORDER-TOP: 0px; BORDER-LEFT: 0px; WIDTH: 100px; BORDER-BOTTOM: 0px; BACKGROUND-COLOR: #b8bafe }
        .CMSMenuItem { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }
        .CMSMenuItemMouseUp { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }
        .CMSMenuItemMouseOver { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: white; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #4a3c8c }
        .CMSMenuItemMouseDown { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana }
        .CMSMenuHighlightedMenuItem { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .CMSMenuHighlightedMenuItemMouseUp { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .CMSMenuHighlightedMenuItemMouseOver { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }
        .CMSMenuHighlightedMenuItemMouseDown { PADDING-RIGHT: 15px; PADDING-LEFT: 5px; FONT-SIZE: 10pt; PADDING-BOTTOM: 2px; WIDTH: 100px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; FONT-FAMILY: verdana; BACKGROUND-COLOR: #ff7315 }

    </style>
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSMenu example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <%--HORIZONTAL--%>
                <cms:CMSMenu ID="CMSMenu1" runat="server" Cursor="Default" Layout="Horizontal" CSSPrefix="Main;Sub"
                    MenuControl-CssClass="MainCMSMenu" Path="/Examples/%" HighlightedNodePath="/Examples/Webparts/Navigation"
                    HighlightAllItemsInPath="true" Padding="0" Spacing="0"  EncodeMenuCaption="true" ></cms:CMSMenu>
                <br />
                <br />
                <br />
                <%-- DEFAULT--%>
                <cms:CMSMenu ID="CMSMenu2" runat="server" Path="/%" Cursor="Pointer" Padding="2"
                    Spacing="2" MenuControl-BorderWidth="1" EncodeMenuCaption="true" />
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
