<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BasicDataGrid.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_BasicDataGrid"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>BasicDataGrid example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <style type="text/css">
        body
        {
            margin: 0px;
            padding: 0px;
            height: 100%;
        }
    </style>
    <link href="Styles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="BasicDataGrid example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <div style="width: 100%; border: solid 1px #CCCCCC;">
                    <table style="margin-left: auto; margin-right: auto; text-align: center;">
                        <tr>
                            <td style="padding: 35px;">
                                <cms:BasicDataGrid ID="BasicDataGrid1" runat="server" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="5" BackColor="White" GridLines="Vertical" AutoGenerateColumns="False"
                                    AllowPaging="True" AllowSorting="True" PageSize="10" BorderColor="#999999" HideControlForZeroRows="False"
                                    ZeroRowsText="no data found">
                                    <PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages">
                                    </PagerStyle>
                                    <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                                    <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                    <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                                    <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                                    <Columns>
                                        <asp:boundcolumn datafield="CellName" sortexpression="CellName" headertext="Cellphone name">
                                            <headerstyle width="200px" />
                                        </asp:boundcolumn>
                                        <asp:boundcolumn datafield="CellDisplayType" sortexpression="CellDisplayType" headertext="Display type">
                                            <itemstyle horizontalalign="Center" />
                                            <headerstyle width="50px" horizontalalign="Center" />
                                        </asp:boundcolumn>
                                    </Columns>
                                </cms:BasicDataGrid>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
