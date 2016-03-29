<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Events.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_Events" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Events/EventManager.ascx" TagName="EventRegistration"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="repeater" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="eventCalendarDetail">
        <!-- Top zone -->
        <div class="zoneTop">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <uc1:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" ClassNames="cms.bookingevent;CMS.MenuItem"
                    CacheMinutes="0" EnableViewState="false" />
            </cms:WebPartContainer>
        </div>
        <!-- Left zone -->
        <div class="zoneLeft" style="float: left;">
            <h1>
                Calendar
            </h1>
            <div class="Calendar" >
                <cms:CMSCalendar runat="server" ID="EventCalendar" Path="/Events/%" ClassNames="cms.bookingevent"
                    SkinID="EventCalendar" DayField="EventDate" TransformationName="cms.bookingevent.EventCalendarItem"
                    NoEventTransformationName="cms.bookingevent.calendarnoevent" EnableViewState="false" TimeZone="Inherit" />
            </div>
            <div class="EventDetail" >
                <cms:CMSRepeater ID="repEvent" runat="server" Visible="false" ClassNames="cms.bookingevent" 
                    SelectedItemTransformationName="cms.bookingevent.Default" EnableViewState="false">
                </cms:CMSRepeater>
            </div>
            <uc1:EventRegistration runat="server" ID="EventRegistration" ContentBefore="<br /><hr />" EnableViewState="false" TimeZone="Inherit" />
        </div>
        <!-- Right zone -->
        <div class="zoneRight" style="float: right;">
            <h1>
                List of events
            </h1>
            Please select some event in the calendar on the left or you can choose the event
            directly from the list below.
            <br />
            <br />
            <div class="GeneralList">
                <uc1:repeater runat="server" ID="EventRepeater" HideOnSubPages="True" Path="/Events/%"
                    ClassNames="cms.bookingevent" OrderBy="EventDate ASC" TransformationName="cms.bookingevent.preview"
                    PagingMode="querystring" PagerPosition="bottom" ResultsPosition="top" CacheMinutes="0"
                    ShowNewButton="True" NewButtonText="Add new event" ShowEditDeleteButtons="True" EnableViewState="false" TimeZone="Inherit" />
            </div>
        </div>
    </div>
</asp:Content>
