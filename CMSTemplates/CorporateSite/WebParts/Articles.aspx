<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="Articles.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Articles" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="cmsrepeater" TagPrefix="uc1" %> 
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
                <uc1:cmsrepeater ID="Cmsrepeater1" runat="server" ClassNames="cms.article" TransformationName="cms.article.simplepreview" SelectedItemTransformationName="cms.article.defaultwithoutteasers" NewButtonText="Add new article<br />" ShowNewButton="true" ShowEditDeleteButtons="true" EnableViewState="false" />
			</cms:WebPartContainer> 
		</div> 
	</div>  
</asp:Content> 
