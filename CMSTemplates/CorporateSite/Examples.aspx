<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Examples.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_Examples" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs" TagPrefix="uc1" %> 


<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="textPlaceholderLeftMenu"> 
		<!-- Left zone --> 
		<div class="zoneLeft <%= largerClass %>" style="float: left;"> 
			<uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" RenderSubItems="true" CellPadding="0" CellSpacing="0" DisplayHighlightedItemAsLink="true" HighlightAllItemsInPath="true" Indentation="3" ApplyMenuDesign="true" WordWrap="true" RenderImageAlt="true" EnableViewState="false" /> 
		</div> 
		<!-- Content --> 
		<div class="zoneContent <%= shorterClass %>" style="float: right;"> 
			<cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray"> 
				<uc1:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" EnableViewState="false" /> 
			</cms:WebPartContainer> 
			<cms:WebPartContainer ID="wpcContentText" runat="server" ContainerName="Padding.Content"> 
				<cms:CMSEditableRegion runat="server" ID="ContentText" DialogHeight="400" RegionType="HtmlEditor" /> 
			</cms:WebPartContainer> 
			<cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content"> 
				<%--CONTENT--%> 
			</cms:WebPartContainer> 
		</div>
		<div style="clear:both;"></div> 
	</div> 
</asp:Content> 
