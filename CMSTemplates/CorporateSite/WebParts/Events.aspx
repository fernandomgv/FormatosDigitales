<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Events" ValidateRequest="false" Theme="CorporateSite" %>

<%@ Register Src="~/CMSWebParts/Events/EventCalendar.ascx" TagName="EventCalendar" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs" TagPrefix="uc1" %> 


<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="textPlaceholderLeftMenu"> 
		<!-- Left zone --> 
		<div class="zoneLeft" style="float: left;"> 
			<uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" CellPadding="0" CellSpacing="0" DisplayHighlightedItemAsLink="true" HighlightAllItemsInPath="true" Indentation="3" ApplyMenuDesign="true" WordWrap="true" RenderImageAlt="true" EnableViewState="false" /> 
		</div> 
		<!-- Content --> 
		<div class="zoneContent" style="float: right;"> 
			<cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray"> 
				<uc1:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" EnableViewState="false" /> 
			</cms:WebPartContainer> 

			<cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content"> 
                <uc1:EventCalendar ID="EventCalendar1" runat="server" Path="/Events/%" DayField="EventDate" ClassNames="cms.bookingevent" TransformationName="CMS.BookingEvent.EventCalendarItem" NoEventTransformationName="CMS.BookingEvent.CalendarNoEvent" EventDetailTransformation="CMS.BookingEvent.Default" CalendarControl-SkinID="EventCalendar" EnableViewState="false" TimeZone="Inherit" />
    		</cms:WebPartContainer> 
		</div> 
	</div>  
</asp:Content> 
