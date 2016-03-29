<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QueryRepeater.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_QueryRepeater"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>QueryRepeater example</title>
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager" runat="server" />
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="QueryRepeater example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <table style="border: solid 1px #CCCCCC; margin-left: auto; margin-right: auto; text-align: center;">
                    <tr>
                        <td style="padding: 35px; white-space: nowrap;">
                            <cms:QueryRepeater ID="QueryRepeater1" runat="server" EnablePaging="true" QueryName="CMS.CellPhone.selectdocuments"
                                TransformationName="ecommerce.transformations.product_preview" PagerControl-PagingMode="PostBack"
                                PagerControl-PageSize="9" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
