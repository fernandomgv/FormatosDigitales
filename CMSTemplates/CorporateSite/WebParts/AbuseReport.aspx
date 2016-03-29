<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="AbuseReport.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_AbuseReport" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="cmsrepeater" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/AbuseReport/AbuseReport.ascx" TagName="abusereport" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/AbuseReport/InlineAbuseReport.ascx" TagName="inlineabusereport" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>

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
                <asp:PlaceHolder runat="server" ID="plcAbuseReport" Visible="false">
                    <uc1:abusereport runat="server" ID="AbuseReport" ConfirmationText="Thank you for your report." ReportTitle="Example abuse report" EnableViewState="false" />
                </asp:PlaceHolder>
                
                <asp:PlaceHolder runat="server" ID="plcInlineAbuseReport" Visible="false">
                    <uc1:inlineabusereport runat="server" ID="InlineAbuseReport" ReportTitle="Example abuse report" ConfirmationText="Thank you for your report." EnableViewState="false" />
                </asp:PlaceHolder>
			</cms:WebPartContainer> 
		</div> 
	</div>  
</asp:Content> 
