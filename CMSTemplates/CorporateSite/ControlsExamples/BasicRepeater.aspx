<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BasicRepeater.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_BasicRepeater"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>BasicRepeater example</title>
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="BasicRepeater example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <cms:BasicRepeater ID="BasicRepeater1" runat="server">
                    <ItemTemplate>
                        <div style="width: 100%">
                            <h3>
                                <%# HTMLHelper.HTMLEncode((String)Eval("DocumentName")) %>
                            </h3>
                            <img alt="<%# HTMLHelper.HTMLEncode((String)Eval("DocumentName")) %>_img" src='<%# ResolveUrl(Eval("SKUImagePath").ToString()) + "?maxSideSize=100" %>' />
                        </div>
                    </ItemTemplate>
                </cms:BasicRepeater>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
