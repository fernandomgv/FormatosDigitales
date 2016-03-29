<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QueryDataGrid.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_QueryDataGrid"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>QueryDataGrid example</title>
    <link href="Styles.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="QueryDataGrid example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <div style="width: 100%; border: solid 1px #CCCCCC;">
                    <table style="margin-left: auto; margin-right: auto; text-align: center;">
                        <tr>
                            <td style="padding: 35px;">
                                <cms:QueryDataGrid ID="QueryDataGrid1" runat="server" QueryName="CMS.CellPhone.selectdocuments"
                                    AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" GridLines="Vertical"
                                    BorderColor="#999999" BackColor="White" CellPadding="5" ZeroRowsText="no data found"
                                    HideControlForZeroRows="False">
                                    <PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages">
                                    </PagerStyle>
                                    <AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
                                    <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                    <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                                    <Columns>
                                        <asp:boundcolumn datafield="CellName" sortexpression="CellName" headertext="Cellphone name">
                                            <headerstyle width="200px" />
                                        </asp:boundcolumn>
                                        <asp:boundcolumn datafield="CellDisplayType" sortexpression="CellDisplayType" headertext="Display type" />
                                    </Columns>
                                    <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                                </cms:QueryDataGrid>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
