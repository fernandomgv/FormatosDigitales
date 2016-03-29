<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Partners.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_Partners" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs" TagPrefix="uc1" %> 


<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="textPlaceholderLeftMenu"> 
		<!-- Left zone --> 
		<div class="zoneLeft" style="float: left;"> 
			<uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" CheckPermissions="True" EnableViewState="false" /> 
		</div> 
		<!-- Content --> 
		<div class="zoneContent" style="float: right;"> 
			<cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray"> 
				<uc1:breadcrumbs runat="server" ID="breadcrumbs" ClassNames="CMS.MenuItem;cms.office" CheckPermissions="True" EnableViewState="false" /> 
			</cms:WebPartContainer> 
			<h1>
				<cms:CMSEditableRegion runat="server" ID="editabletextHeader" RegionTitle="Header" RegionType="TextBox" /> 
			</h1>
			<cms:CMSEditableRegion runat="server" ID="ContentText" DialogHeight="400" RegionType="HtmlEditor" /> 
		</div> 
		<div style="clear: both;">
		</div> 
	</div> 
</asp:Content> 
