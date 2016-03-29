<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BasicDataList.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_BasicDataList"
    Theme="default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>BasicDataList example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="BasicDataList example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <cms:BasicDataList ID="BasicDataList1" runat="server" RepeatColumns="3" CellSpacing="10"
                    Width="100%">
                    <ItemTemplate>
                        <div style="width: 100%">
                            <h3>
                                <%# HTMLHelper.HTMLEncode((String)Eval("DocumentName")) %>
                            </h3>
                            <img alt="<%# HTMLHelper.HTMLEncode((String)Eval("DocumentName")) %>_img" src='<%# ResolveUrl(Eval("SKUImagePath").ToString()) + "?maxSideSize=100" %>' />
                        </div>
                    </ItemTemplate>
                </cms:BasicDataList>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
