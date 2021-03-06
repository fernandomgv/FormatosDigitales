<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BasicTabControl.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_BasicTabControl" Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>BasicTabControl example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="BasicTabControl example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <cms:BasicTabControl ID="BasicTabControl1" runat="server" />
                <%--<hr style="color:#A4B2BC; width:100%; height:2px; margin-top:0px; _margin-top:-8px" />--%>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
