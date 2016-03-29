<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="CuelloBotella.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_CuelloBotella" %>
<%@ Register TagPrefix="uc1" TagName="editabletext" Src="~/CMSWebParts/Text/editabletext.ascx" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
	<div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + CMSContext.CurrentDocument.GetValue("MenuItemTeaserImage"))%>);"></div>
	<div class="container posr">
		<h1><uc1:editabletext runat="server" ID="editabletext1" DefaultText="Cuellos de Botella" /></h1>
	</div>
</div>
<cms:CMSEditableRegion runat="server" ID="cmsEditableRegion" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" DialogHeight="500" />
</asp:Content>