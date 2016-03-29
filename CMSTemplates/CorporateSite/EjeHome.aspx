<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="EjeHome.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_EjeHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
	<div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + CMSContext.CurrentDocument.GetValue("MenuItemTeaserImage"))%>);"></div>
	<div class="container posr">
		<h1>¿Qué y cuáles son?</h1>
	</div>
</div>
<section class="">
	<div class="container">
        <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion1" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
	</div>
</section>
<section class="sec-space">
	<div class="container">
		<div class="row">
            <div class="col-sm-6 item-eje-home">
                <cms:CMSEditableRegion runat="server" ID="CMSEditableRegion2" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
			</div>
			<div class="col-sm-6 item-eje-home">
			    <cms:CMSEditableRegion runat="server" ID="CMSEditableRegion3" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
			</div>
			<div class="col-sm-6 item-eje-home">
                <cms:CMSEditableRegion runat="server" ID="CMSEditableRegion4" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
			</div>
			<div class="col-sm-6 item-eje-home">
                <cms:CMSEditableRegion runat="server" ID="CMSEditableRegion5" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
			</div>
		</div>
	</div>
</section>
</asp:Content>