<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="Capacitaciones.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_Capacitaciones" %>
<%@ Register TagPrefix="uc1" TagName="editabletext" Src="~/CMSWebParts/Text/editabletext.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
	<div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + CMSContext.CurrentDocument.GetValue("MenuItemTeaserImage"))%>);"></div>
	<div class="container posr">
		<h1 class="text-marron-dark">Capacitaciones</h1>
	</div>
</div>
<section class="">
	<div class="container">
		<p class="lead"><uc1:editabletext runat="server" ID="editabletext1" RegionType="TextArea" /></p>
	</div>
</section>
<section class="sec-space bg-marron-gris capacitaciones-list">
	<div class="container">
		<div class="row">
		    <div class="col-md-3 col-sm-6">
				<div class="box-panel box-white box-mobile">
					<h3 class="subtitle s-primary"><uc1:editabletext runat="server" ID="editabletext2" RegionType="TextArea" DefaultText="Planificación territorial para el manejo sostenible y la restauración de paisajes" /></h3>
					<p><uc1:editabletext runat="server" ID="editabletext6" RegionType="TextArea" /></p>
					<br>
					<p>
						<a href="<%= ResolveUrl("~/Capacitaciones/Capacitacion-Planificacion.aspx") %>" class="link-more ">Ver Más <span><i class="fa fa-chevron-right text-verde"></i></span></a>
					</p>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="box-panel box-white box-mobile">
					<h3 class="subtitle s-primary"><uc1:editabletext runat="server" ID="editabletext3" RegionType="TextArea" DefaultText="Mecanismos para la conservación de funciones ambientales hídricas" /></h3>
					<p><uc1:editabletext runat="server" ID="editabletext7" RegionType="TextArea" /></p>
					<br>
					<p>
						<a href="<%= ResolveUrl("~/Capacitaciones/Capacitacion-Mecanismo.aspx") %>" class="link-more">Ver Más <span><i class="fa fa-chevron-right text-verde"></i></span></a>
					</p>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="box-panel box-white box-mobile">
					<h3 class="subtitle s-primary"><uc1:editabletext runat="server" ID="editabletext4" RegionType="TextArea" DefaultText="Mitigación del cambio climático" /></h3>
					<p><uc1:editabletext runat="server" ID="editabletext8" RegionType="TextArea" /></p>
					<br>
					<p>
						<a href="<%= ResolveUrl("~/Capacitaciones/Capacitacion-Mitigacion.aspx") %>" class="link-more">Ver Más <span><i class="fa fa-chevron-right text-verde"></i></span></a>
					</p>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="box-panel box-white box-mobile">
					<h3 class="subtitle s-primary"><uc1:editabletext runat="server" ID="editabletext5" RegionType="TextArea" DefaultText="Cadenas de valor forestales" /></h3>
					<p><uc1:editabletext runat="server" ID="editabletext9" RegionType="TextArea" /></p>
					<br>
					<p>
						<a href="<%= ResolveUrl("~/Capacitaciones/Capacitacion-Cadena-de-Valor.aspx") %>" class="link-more">Ver Más <span><i class="fa fa-chevron-right text-verde"></i></span></a>
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
</asp:Content>