<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="ProgramaMfs.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_ProgramaMfs" %>
<%@ Register TagPrefix="uc1" TagName="editabletext" Src="~/CMSWebParts/Text/editabletext.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
	<div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + CMSContext.CurrentDocument.GetValue("MenuItemTeaserImage"))%>);"></div>
	<div class="container posr">
		<h1 class="text-marron-dark"><uc1:editabletext runat="server" ID="editabletext1" DefaultText="Sobre el programa MFS" /></h1>
	</div>
</div>
<section class="sec-default">
	<div class="container">
		<p class="lead"><uc1:editabletext runat="server" ID="editabletext2" RegionType="TextArea" /></p>

		<h5 class="title-default"><uc1:editabletext runat="server" ID="editabletext3" DefaultText="Como funciona el programa" /></h5>
        <cms:CMSEditableImage runat="server" ID="cmsEditableImage" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive" />
		<br><br>
        <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion1" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />

		<h5 class="title-default"><uc1:editabletext runat="server" ID="editabletext4" DefaultText="Economía latina en los ultimos 10 años" /></h5>
		<div class="row text-left">
			<div class="col-xs-6 col-md-3">
				<div class="number-box">
					<div class="number-lg"><uc1:editabletext runat="server" ID="editabletext7" /></div>
					<h5><uc1:editabletext runat="server" ID="editabletext5" /></h5>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="number-box">
					<div class="number-lg"><uc1:editabletext runat="server" ID="editabletext6" /></div>
					<h5><uc1:editabletext runat="server" ID="editabletext8" /></h5>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="number-box">
					<div class="number-lg"><uc1:editabletext runat="server" ID="editabletext9" /></div>
					<h5><uc1:editabletext runat="server" ID="editabletext10" /></h5>
				</div>
			</div>
			<div class="col-xs-6 col-md-3 ">
				<div class="number-box">
					<div class="number-lg"><uc1:editabletext runat="server" ID="editabletext11" /></div>
					<h5><uc1:editabletext runat="server" ID="editabletext12" /></h5>
				</div>
			</div>
		</div>
	</div>

	<div class="eje-lead ">
	    <cms:CMSEditableImage runat="server" ID="cmsEditableImage1" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="lead-img hidden-xs" />
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
		<h2 class="title-default"><uc1:editabletext runat="server" ID="editabletext13" DefaultText="Prioridades Temáticas" /></h2>
		<p><uc1:editabletext runat="server" ID="editabletext14" RegionType="TextArea" /></p><br>

		<h5 class="title-default"><uc1:editabletext runat="server" ID="editabletext15" DefaultText="Mecanismos de redistribución por servicios ambientales para la mitigación del cambio climático" /></h5>
		<div class="row">
			<div class="col-md-6">
				<div class="eje-insec eje-insec-1">
					<div class="row">
						<div class="col-sm-5">
							<img src="~/App_Themes/MFSAndina/assets/img/icon-eje-1.png" width="40">
							<h3><uc1:editabletext runat="server" ID="editabletext16" RegionType="TextArea" DefaultText="Mitigación del cambio climático sobre los bosques y sistemas agroforestales" /></h3>
						</div>
						<div class="col-sm-7">
							<p><uc1:editabletext runat="server" ID="editabletext17" RegionType="TextArea" /></p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="text-center">
				    <cms:CMSEditableImage runat="server" ID="cmsEditableImage2" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive mt-10" />
				</div>
			</div>
		</div>
		<div class="mt-20">
		    <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion3" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
			<p>
				<a href="<%= ResolveUrl("~/Ejes/Mitigacion.aspx") %>" class="link-more">Más Informacación <i class="fa fa-chevron-right"></i></a>
				<a href="<%= ResolveUrl("~/Innovaciones.aspx?eje=1") %>" class="link-more ml-20">Ver Innovaciones <i class="fa fa-chevron-right"></i></a>
			</p>
			<br>
		</div>

		<h5 class="title-default"><uc1:editabletext runat="server" ID="editabletext18" DefaultText="Mecanismos de redistribución por servicios ambientales para agua y Mitigación" /></h5>
        <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion4" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
		<div class="row">
			<div class="col-md-6">
				<div class=" eje-insec eje-insec-2">
					<div class="row">
						<div class="col-sm-5">
							<img src="~/App_Themes/MFSAndina/assets/img/icon-eje-2.png" width="40">
							<h3><uc1:editabletext runat="server" ID="editabletext19" RegionType="TextArea" DefaultText="Mecanismos para la conservación de funciones ambentales hídricas" /></h3>
						</div>
						<div class="col-sm-7">
							<p><uc1:editabletext runat="server" ID="editabletext20" RegionType="TextArea" /></p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="embed-responsive embed-responsive-16by9">
				    <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion5" RegionTitle="Agregar Video" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
				</div>
			</div>
		</div>
		<div class="mt-20">
			<p><cms:CMSEditableRegion runat="server" ID="cmsEditableRegion6" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" /></p>
			<p>
				<a href="<%= ResolveUrl("~/Ejes/Conservacion.aspx") %>" class="link-more">Más Informacación <i class="fa fa-chevron-right"></i></a>
				<a href="<%= ResolveUrl("~/Innovaciones.aspx?eje=2") %>" class="link-more ml-20">Ver Innovaciones <i class="fa fa-chevron-right"></i></a>
			</p>
			<br>
		</div>

		<h5 class="title-default"><uc1:editabletext runat="server" ID="editabletext21" DefaultText="Valor agregado de productos forestales" /></h5>
        <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion8" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
		<div class="row">
			<div class="col-md-7">
				<div class="text-center">
				    <cms:CMSEditableImage runat="server" ID="cmsEditableImage3" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive mt-10 mb-20" />
				</div>
			</div>
			<div class="col-md-5">
				<div class=" eje-insec eje-insec-3">
					<div class="row">
						<div class="col-sm-5">
							<img src="~/App_Themes/MFSAndina/assets/img/icon-eje-3.png" width="40">
							<h3><uc1:editabletext runat="server" ID="editabletext22" RegionType="TextArea" DefaultText="Cadena de valor de productos forestales" /></h3>
						</div>
						<div class="col-sm-7">
							<p><uc1:editabletext runat="server" ID="editabletext23" RegionType="TextArea" /></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-20">
			<p>
				<a href="<%= ResolveUrl("~/Ejes/Valor-Agregado.aspx") %>" class="link-more">Más Informacación <i class="fa fa-chevron-right"></i></a>
				<a href="<%= ResolveUrl("~/Innovaciones.aspx?eje=3") %>" class="link-more ml-20">Ver Innovaciones <i class="fa fa-chevron-right"></i></a>
			</p>
			<br>
		</div>

		<h5 class="title-default"><uc1:editabletext runat="server" ID="editabletext24" DefaultText="Valor agregado de productos forestales" /></h5>
		<cms:CMSEditableRegion runat="server" ID="cmsEditableRegion7" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
		<div class="row">
			<div class="col-md-6">
				<div class="text-center">
				    <cms:CMSEditableImage runat="server" ID="cmsEditableImage4" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive mt-10 mb-20" />
				</div>
			</div>
			<div class="col-md-6">
				<div class=" eje-insec eje-insec-4">
					<div class="row">
						<div class="col-sm-5">
							<img src="~/App_Themes/MFSAndina/assets/img/icon-eje-4.png" width="40">
							<h3><uc1:editabletext runat="server" ID="editabletext25" RegionType="TextArea" DefaultText="Manejo forestal sostenible" /></h3>
						</div>
						<div class="col-sm-7">
							<p><uc1:editabletext runat="server" ID="editabletext26" RegionType="TextArea" /></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-20">
			<p>
				<a href="<%= ResolveUrl("~/Ejes/Manejo-Forestal.aspx") %>" class="link-more mr-20">Más Informacación <i class="fa fa-chevron-right"></i></a>
				<a href="<%= ResolveUrl("~/Innovaciones.aspx?eje=4") %>" class="link-more ">Ver Innovaciones <i class="fa fa-chevron-right"></i></a>
			</p>
			<br>
		</div>

		<h5 class="title-default">También conoce</h5>
		<div class="mt-20">
			<p>
				<a href="<%= ResolveUrl("~/Programa-MFS/Comite.aspx") %>" class="link-more">El comite directivo y los equipos <i class="fa fa-chevron-right"></i></a>
			</p>
			<br>
		</div>
	</div>
</section>
</asp:Content>