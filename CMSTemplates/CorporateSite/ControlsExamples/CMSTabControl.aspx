<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSTabControl.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSTabControl"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSTabControl example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
    .Gecko3 .HeaderTabs
    {
    	padding-top: 28px !important;
    }
    .IE8 .HeaderTabs
    {
    	padding-top: 17px !important;
    }
    .IE7 .HeaderTabs
    {
    	padding-top: 25px !important;
    }
    .IE8 .TabControl, .IE8 .TabControl:hover
    {
    	padding-top: 10px;
    }
    .IE7 .TabControl:hover, .IE7 .TabControl
    {
    	padding-top: 2px !important;
    }
    .SM_Header .HeaderTabs
    {
    	left: 10px !important;
    }
    </style>
</head>
<body class="<%= mBodyClass %>">
    <form id="form1" runat="server"> 
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSTabControl example" />
            </asp:Panel>
            <div class="SM_Header">
            <div class="HeaderTabs">
                <cms:CMSTabControl ID="CMSTabControl1" runat="server" MaxRelativeLevel="1" />
                <%--<hr style="color:#A4B2BC; width:100%; height:2px; margin-top:0px; _margin-top:-8px" />--%>
            </div>
            <div class="HeaderRight">&nbsp;</div>
            <div class="SM_HeaderContentSeparator">&nbsp;</div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
