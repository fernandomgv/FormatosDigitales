<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TemplatedDataPager.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_TemplatedDataPager" Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>Template data pager</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager" runat="server" />
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="TemplateDataPager example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <table style="border: solid 1px #CCCCCC; margin-left: auto; margin-right: auto;">
                    <tr>
                        <td style="border-bottom: solid 1px #CCCCCC; padding: 10px; text-align: center;">
                            <cms:CMSRepeater ID="CMSRepeater1" runat="server" Path="/%" ClassNames="CMS.CellPhone"
                                TransformationName="ecommerce.transformations.product_preview">
                            </cms:CMSRepeater>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 10px; background-color: #D9D9D9;">
                            <cms:TemplateDataPager ID="TemplateDataPager1" runat="server">
                                <NumberTemplate>
                                    <a href="?Page=<%# Eval("PageNumber")  %>">
                                        <%# Eval("PageNumber")  %>
                                    </a>
                                </NumberTemplate>
                                <SelectedNumberTemplate>
                                    <strong>
                                        <%# Eval("PageNumber")  %>
                                    </strong>
                                </SelectedNumberTemplate>
                                <SeparatorTemplate>
                                    -
                                </SeparatorTemplate>
                                <FirstItemTemplate>
                                    <a href="?Page=1">First</a>&nbsp;|&nbsp;
                                </FirstItemTemplate>
                                <LastItemTemplate>
                                    &nbsp;|&nbsp;<a href="?Page=<%# pageCount %>">Last</a>
                                </LastItemTemplate>
                                <PreviousItemTemplate>
                                    <a href="?Page=<%# previousPage %>">Previous</a> &nbsp;|&nbsp;
                                </PreviousItemTemplate>
                                <NextItemTemplate>
                                    &nbsp;|&nbsp; <a href="?Page=<%# nextPage %>">Next</a>
                                </NextItemTemplate>
                            </cms:TemplateDataPager>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
