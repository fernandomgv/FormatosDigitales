<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BasicCalendar.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_BasicCalendar"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>BasicCalendar example</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <style type="text/css">
        body
        {
            margin: 0px;
            padding: 0px;
            height: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="BasicCalendar example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <div style="width: 100%; border: solid 1px #CCCCCC;">
                    <table style="margin-left: auto; margin-right: auto; text-align: center;">
                        <tr>
                            <td style="padding: 35px;">
                                <cms:BasicCalendar ID="BasicCalendar1" runat="server" Width="528px" NextMonthText="Next >"
                                    NextPrevFormat="FullMonth" DayField="DocumentModifiedWhen">
                                    <TodayDayStyle BackColor="#FFC080"></TodayDayStyle>
                                    <OtherMonthDayStyle BackColor="Gray"></OtherMonthDayStyle>
                                    <TitleStyle Font-Bold="True" ForeColor="White" BackColor="Red"></TitleStyle>
                                    <NextPrevStyle ForeColor="Blue"></NextPrevStyle>
                                    <WeekendDayStyle BackColor="#E0E0E0"></WeekendDayStyle>
                                    <DayHeaderStyle BackColor="#8080FF"></DayHeaderStyle>
                                    <ItemTemplate>
                                        <br />
                                        <a href='<%# ResolveUrl(CMS.CMSHelper.CMSContext.GetUrl(Convert.ToString(Eval("NodeAliasPath")), Convert.ToString(Eval("DocumentUrlPath")))) %>'>
                                            <%#Eval("NewsTitle")%>
                                        </a>
                                    </ItemTemplate>
                                    <NoEventsTemplate>
                                        <br />
                                        No Event
                                    </NoEventsTemplate>
                                </cms:BasicCalendar>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </asp:Panel>
        &nbsp;<br />
        <br />
        &nbsp;&nbsp;
    </form>
</body>
</html>
