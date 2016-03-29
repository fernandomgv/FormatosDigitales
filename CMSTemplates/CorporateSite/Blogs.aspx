<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Blogs.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_Blogs" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="repeater" TagPrefix="uc1" %> 

<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs" TagPrefix="uc1" %> 

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="zoneBlogList"> 
		<cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray"> 
			<uc1:breadcrumbs runat="server" ID="breadcrumbs" ShowForDocumentTypes="CMS.MenuItem" EnableViewState="false" /> 
		</cms:WebPartContainer> 
		<h1>
			<cms:CMSEditableRegion runat="server" ID="HeaderText" ShowForDocumentTypes="CMS.MenuItem" RegionTitle="Header text" RegionType="TextBox" /> 
		</h1>
		<div style="margin-bottom:20px">
			<cms:CMSEditableRegion runat="server" ID="ContentText" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" /> 
		</div>
		<uc1:repeater runat="server" ID="rptBlogs" ShowForDocumentTypes="CMS.MenuItem" ClassNames="cms.blog" TransformationName="cms.blog.DefaultWithLink" PagingMode="querystring" PagerPosition="bottom" ResultsPosition="top" RelationshipWithNodeGuid="00000000-0000-0000-0000-000000000000" RelationshipName="isrelatedto" EnableViewState="false" /> 
		<%--CONTENT--%> 
	</div> 
</asp:Content> 
