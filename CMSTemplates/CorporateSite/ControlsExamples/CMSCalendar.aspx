<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSCalendar.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSCalendar"
    Theme="Default" %>
<%@ Register src="~/CMSAdminControls/UI/PageElements/PageTitle.ascx" tagname="PageTitle" tagprefix="cms" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>CMSCalendar example</title>
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
    <form id="Form2" method="post" runat="server">
        <asp:Panel runat="server" ID="pnlBody" CssClass="PageBody">
            <asp:Panel runat="server" ID="pnlTitle" CssClass="PageHeader">
                <cms:PageTitle ID="titleElem" runat="server" TitleText="CMSCalendar example" />
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlContent" CssClass="PageContent">
                <div style="width: 100%; border: solid 1px #CCCCCC;">
                    <table style="margin-left: auto; margin-right: auto; text-align: center;">
                        <tr>
                            <td style="padding: 35px;">
                                <cms:CMSCalendar ID="CMSCalendar1" runat="server" Width="528px" NextMonthText="Next"
                                    NextPrevFormat="ShortMonth" DayField="NewsReleaseDate" ClassNames="CMS.News"
                                    TransformationName="cms.news.calendarevent" NoEventTransformationName="cms.news.calendarnoevent"
                                    Path="/%">
                                    <NextPrevStyle ForeColor="Blue"></NextPrevStyle>
                                    <WeekendDayStyle BackColor="#E0E0E0"></WeekendDayStyle>
                                    <DayHeaderStyle BackColor="#8080FF"></DayHeaderStyle>
                                    <TitleStyle Font-Bold="True" ForeColor="White" BackColor="Red"></TitleStyle>
                                    <TodayDayStyle BackColor="#FFC080"></TodayDayStyle>
                                    <OtherMonthDayStyle BackColor="Gray"></OtherMonthDayStyle>
                                </cms:CMSCalendar>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
