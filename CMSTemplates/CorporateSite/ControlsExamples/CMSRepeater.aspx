<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSRepeater.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSRepeater"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSRepeater example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="Styles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager" runat="server" />
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSRepeater example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <table style="border: solid 1px #CCCCCC; margin-left: auto; margin-right: auto; text-align: center;
                    width: 100%;">
                    <tr>
                        <td style="padding: 35px;">
                            <cms:CMSRepeater ID="CMSRepeater1" runat="server" ClassNames="CMS.CellPhone" Path="/%"
                                TransformationName="ecommerce.transformations.product_preview" EnablePaging="true"
                                PagerControl-PageSize="1" PagerControl-PagingMode="PostBack" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
