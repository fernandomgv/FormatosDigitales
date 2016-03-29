<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="SiteMap.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_SiteMap" ValidateRequest="false" %> 

<%@ Register Src="~/CMSWebParts/Navigation/cmssitemap.ascx" TagName="cmssitemap" TagPrefix="uc1" %> 
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="siteMap"> 
		<cms:WebPartContainer ID="wpcPageTitle" runat="server" ContainerName="Gradient.LightBlue"> 
			<h1>
				Site Map
			</h1> 
		</cms:WebPartContainer> 
		<cms:WebPartContainer ID="wpcSiteMap" runat="server" ContainerName="Padding.Content"> 
			<uc1:cmssitemap runat="server" ID="SiteMap" EnableViewState="false" /> 
		</cms:WebPartContainer> 
	</div> 
</asp:Content> 
