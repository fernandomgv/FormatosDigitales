<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSViewer.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSViewer"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSViewer example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSViewer example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <%--                <h1>Single Item</h1>
                <cms:CMSViewer ID="CMSViewer1" runat="server" ClassNames="cms.news"
                TransformationName="cms.news.default_xslt" Path="/News/Your-First-News" />
                <h1>Multiple Items</h1>--%>
                <table style="border: solid 1px #CCCCCC; margin-left: auto; margin-right: auto; text-align: center;
                    width: 100%;">
                    <tr>
                        <td style="padding: 35px;">
                            <cms:CMSViewer ID="CMSViewer2" runat="server" ClassNames="cms.news" TransformationName="cms.news.default_xslt"
                                Path="/%" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
