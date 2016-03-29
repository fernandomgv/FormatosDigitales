<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="BookingSystem.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_BookingSystem" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Events/EventManager.ascx" TagName="EventManager" TagPrefix="uc1" %>
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
                <uc1:EventManager ID="EventManager" runat="server" AllowAnonymousRegistration="true" ShowForDocumentTypes="CMS.BookingEvent" EnableViewState="false" />
			</cms:WebPartContainer> 
		</div> 
	</div>  
</asp:Content> 
