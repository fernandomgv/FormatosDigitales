<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataPager.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_DataPager"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>DataPage example</title>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="scriptManager" runat="server" />
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="DataPager example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <table cellpadding="10" cellspacing="1" style="border: solid 1px black; width: 90%;
                    text-align: center; margin-left: auto; margin-right: auto;">
                    <tr>
                        <td style="border: solid 1px black; width: 50%; text-align: center;">
                            <table style="margin-left: auto; margin-right: auto; text-align: center;">
                                <tr>
                                    <td>
                                        <cms:CMSDataList ID="CMSDataList1" runat="server" TransformationName="ecommerce.transformations.product_preview"
                                            ClassNames="CMS.CellPhone" EnablePaging="True" PagerControl-PageSize="1" Path="/Products/%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="border: solid 1px black; width: 50%; text-align: center;">
                            <table style="margin-left: auto; margin-right: auto; text-align: center;">
                                <tr>
                                    <td>
                                        <cms:CMSDataList ID="CMSDataList2" runat="server" TransformationName="ecommerce.transformations.product_preview"
                                            ClassNames="CMS.CellPhone" EnablePaging="True" PagerControl-PageSize="1" PagerControl-QueryStringKey="Pages"
                                            Path="/Products/%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
