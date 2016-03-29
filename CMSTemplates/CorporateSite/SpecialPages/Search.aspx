<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_Search" ValidateRequest="false" %> 

<%@ Register Src="~/CMSWebParts/SmartSearch/searchdialogwithresults.ascx" TagName="cmscompletesearchdialog" TagPrefix="cms" %> 
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="search"> 
		<cms:WebPartContainer ID="wpcTitleText" runat="server" ContainerName="Gradient.LightBlue"> 
			<h1>
				Search
			</h1> 
		</cms:WebPartContainer> 
		<cms:WebPartContainer ID="wpccmscompletesearchdialog" runat="server" ContainerName="Padding.Content"> 
			<cms:cmscompletesearchdialog DisplayFirstLastAutomatically="true" DisplayPreviousNextAutomatically="true" HidePagerForSinglePage="true" TransformationName="cms.root.SmartSearchResultsWithImages"  runat="server" ID="cmscompletesearchdialog" SearchMode="anyword" Indexes="CorporateSiteASPX.Default;CorporateSiteASPX.Forums;CorporateSiteASPX.Users" PagingMode="postback" /> 
		</cms:WebPartContainer> 
	</div> 
</asp:Content> 
