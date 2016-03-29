<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="PotencialForestal.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_PotencialForestal" %>
<%@ Register TagPrefix="uc1" TagName="editabletext" Src="~/CMSWebParts/Text/editabletext.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
	<div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + CMSContext.CurrentDocument.GetValue("MenuItemTeaserImage"))%>);"></div>
	<div class="container posr">
		<h1 class="text-marron-dark"><uc1:editabletext runat="server" ID="editabletext1" /></h1>
	</div>
</div>
<section class="sec-default">
	<div class="container">
	    <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion1" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
		<h5 class="title-default"><uc1:editabletext runat="server" ID="editabletext2" /></h5>
		<div class="row text-left">
			<div class="col-xs-6 col-md-3">
				<div class="number-box">
					<div class="number-lg"><uc1:editabletext runat="server" ID="editabletext3" /></div>
					<h5><uc1:editabletext runat="server" ID="editabletext4" /></h5>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="number-box">
					<div class="number-lg"><uc1:editabletext runat="server" ID="editabletext5" /></div>
					<h5><uc1:editabletext runat="server" ID="editabletext6" /></h5>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="number-box">
					<div class="number-lg"><uc1:editabletext runat="server" ID="editabletext7" /></div>
					<h5><uc1:editabletext runat="server" ID="editabletext8" /></h5>
				</div>
			</div>
			<div class="col-xs-6 col-md-3 ">
				<div class="number-box">
					<div class="number-lg"><uc1:editabletext runat="server" ID="editabletext9" /></div>
					<h5><uc1:editabletext runat="server" ID="editabletext10" /></h5>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<div class="text-center">
				    <cms:CMSEditableImage runat="server" ID="cmsEditableImage" DisplaySelectorTextBox="false" ImageTitle="" />
				</div>
			</div>
			<div class="col-sm-8">
				<div class="text-center">
				    <cms:CMSEditableImage runat="server" ID="cmsEditableImage1" DisplaySelectorTextBox="false" ImageTitle="" />
				</div>
			</div>
		</div>
	</div>
	<div class="eje-lead ">
		<img src="~/App_Themes/MFSAndina/assets/img/img-lead.png" alt="" class="lead-img hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<span class="lead-icon text-success"><i class="fa fa-quote-left"></i></span>
					<div class="lead-content">
                        <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion2" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<h2 class="title-default"><uc1:editabletext runat="server" ID="editabletext11" /></h2>
		<p><uc1:editabletext runat="server" ID="editabletext12" RegionType="TextArea" /></p><br>
		<h5 class="title-default"><uc1:editabletext runat="server" ID="editabletext13" /></h5>
		<div class="row">
            <div class="col-md-6">
				<div class="text-center">
				    <cms:CMSEditableImage runat="server" ID="cmsEditableImage2" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive mt-10" />
				</div>
			</div>
			<div class="col-md-6">
			    <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion3" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
			</div>
		</div>
		<br>
		<h2 class="title-default"><uc1:editabletext runat="server" ID="editabletext14" /></h2>
		<p><uc1:editabletext runat="server" ID="editabletext15" RegionType="TextArea" /></p><br>

		<div class="row">
		    <div class="col-md-12">
		        <h5 class="title-default"><uc1:editabletext runat="server" ID="editabletext16" /></h5>
		    </div>
		</div>
        <div class="row">
			<div class="col-md-6">
                <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion4" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
			</div>
			<div class="col-md-6">
				<div class="text-center">
				    <cms:CMSEditableImage runat="server" ID="cmsEditableImage3" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive mt-10" />
				</div>
			</div>
		</div>
        
        <div class="row">
            <div class="col-md-12">
                <h2 class="title-default"><uc1:editabletext runat="server" ID="editabletext17" /></h2>
            </div>
        </div>
		<div class="row">
			<div class="col-md-6">
                <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion5" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
			</div>
			<div class="col-md-6">
				<div class="text-center">
					<cms:CMSEditableImage runat="server" ID="cmsEditableImage4" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive mt-10" />
				</div>
			</div>
		</div>
		<h2 class="title-default"><uc1:editabletext runat="server" ID="editabletext18" /></h2>
		<p><uc1:editabletext runat="server" ID="editabletext19" RegionType="TextArea" /></p><br>

		<div class="row">
			<div class="col-md-6">
			    <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion6" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
			</div>
			<div class="col-md-6">
				<div class="text-center">
				    <cms:CMSEditableImage runat="server" ID="cmsEditableImage5" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive mt-10" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="text-center">
					<cms:CMSEditableImage runat="server" ID="cmsEditableImage6" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive mt-10" />
				</div>
			</div>
			<div class="col-md-6">
				<div class="text-center">
					<cms:CMSEditableImage runat="server" ID="cmsEditableImage7" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive mt-10" />
				</div>
			</div>
		</div>

		<div class="mt-20">
			<h5 class="title-default">También conoce</h5>
			<div class="mt-20">
				<p>
					<a href="#" class="link-more mr-20">Cuellos de botella <i class="fa fa-chevron-right"></i></a>
					<br class="visible-xs">
					<a href="#" class="link-more ">Oportunidades para aprovechar el potencial forestal <i class="fa fa-chevron-right"></i></a>
				</p>
				<br>
			</div>
		</div>
	</div>

</section>
</asp:Content>