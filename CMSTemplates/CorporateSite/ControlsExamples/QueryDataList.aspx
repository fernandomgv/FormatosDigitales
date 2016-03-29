<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QueryDataList.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_QueryDataList"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>QueryDataList example</title>
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager" runat="server" />
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="QueryDataList example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <div style="width: 100%; border: solid 1px #CCCCCC;">
                    <table style="margin-left: auto; margin-right: auto; text-align: center;">
                        <tr>
                            <td style="padding: 35px;">
                                <cms:QueryDataList ID="QueryDataList1" runat="server" RepeatColumns="2" QueryName="CMS.CellPhone.selectdocuments"
                                    CellSpacing="10" EnablePaging="true" TransformationName="ecommerce.transformations.product_preview"
                                    PagerControl-PageSize="4" PagerControl-PagingMode="PostBack">
                                    <ItemStyle VerticalAlign="Top"></ItemStyle>
                                </cms:QueryDataList>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
