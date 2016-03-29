<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="GaleriaDetalle.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_GaleriaDetalle" %>
<%@ Register TagPrefix="uc1" TagName="editabletext" Src="~/CMSWebParts/Text/editabletext.ascx" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
	<div class="container posr">
		<a href="<%= ResolveUrl("~/Galerias.aspx") %>" class="link-return hidden-xs"><i class="fa fa-chevron-left text-info"></i> Volver</a>
		<h1><%= Galeria != null ? Galeria.GetValue("Titulo") : string.Empty %></h1>
	</div>
</div>
    
<% if (Imagenes != null)
{ %>
    <section class="slide-gallery-detalle arrows-vertical">
    <% foreach (DataRow item in Imagenes)
    { %>
        <div class="item-slide-gallery-detalle"  style="background-image:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + item.Field<Guid>("File"))%>);">
            <div class="container">
	            <div class="content-slide-item">
		            <div class="row">
			            <div class="slide-caption col-xs-12">
				            <div class="">
					            <h1><%= item.Field<string>("Titulo") %></h1>
					            <p><%= item.Field<string>("Descripcion") %></p>
				            </div>
			            </div>
		            </div>
	            </div>
            </div>
        </div>
    <%}%>
    </section>
    
    <section class="section-nav-gallery-detalle">
	    <div class="container">
		    <div class="nav-gallery-detalle">
            <% foreach (DataRow item in Imagenes)
            { %>
                <div class="text-center">
	                <img src="<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + item.Field<Guid>("File"))%>" title="<%= item.Field<string>("Titulo") %>" width="90" class="img-responsive">
                </div>
            <%}%>
		    </div>
	    </div>
    </section>
<%} %>

<section class="bg-marron-gris">
	<div class="container">
		<h2 class="text-marron"><uc1:editabletext runat="server" ID="editabletext1" DefaultText="Sobre esta galería" /></h2>
		<p><%= Galeria != null ? Galeria.GetValue("DescripcionLarga") : string.Empty %></p>
        <% if (!HasNodeId || Videos != null)
           { %>
                <h2 class="text-marron mb-10 mt-40"><uc1:editabletext runat="server" ID="editabletext2" DefaultText="Videos de esta galeria" /></h2>
        <% }%>
        
        <% if (Videos != null)
           { %>
                <div class="row">
		            <% foreach (DataRow item in Videos)
		               { %>
                            <div class="col-md-3 col-sm-4 col-xs-6 item-video-gallery">
                                <a  class="venobox" data-type="youtube" data-gall="gallery-videos" href="<%= item.Field<string>("Uri") %>">
		                            <img src="<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + item.Field<Guid>("ImagePreview")) %>" title="<%= item.Field<string>("Titulo") %>" class="img-responsive" />
		                        </a>
				                <p><%= item.Field<string>("Descripcion") %></p>
			                </div>
		            <% } %>
                </div>
          <% } %>
	</div>
</section>
<section class="gallery-paginate">
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-xs-12 col-sm-push-4">
				<div class="text-center mt-10">
					<a href="<%= ResolveUrl("~/Galerias.aspx") %>" class="link-more"> Ver todas <span class="hidden-xs">las galerías</span> <i class="fa fa-chevron-right"></i></a>
				</div>
			</div>
            <% if (GaleriaAntesySig != null)
               { %>
                    <div class="col-sm-4 col-xs-6 col-sm-pull-4">
                        <div class="text-left">
                        <% var item = GaleriaAntesySig[0];
                        if (item != null)
                        { %>
	                        <a href="<%= ResolveUrl("~/GaleriaDetalle.aspx?nodeId=" + item.GetValue("NodeID")) %>" class=""><img src="<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + item.GetValue("File"))%>" alt="<%= item.GetValue("Titulo") %>" width="60" class="hidden-xs">
                                <i class="fa fa-chevron-left text-blue"></i> Ver <span class="hidden-sm hidden-xs">galería</span> anterior
	                        </a>
                        <% } %>
                      </div>
                    </div>
                    <div class="col-sm-4 col-xs-6">
				        <div class="text-right">
                        <% item = GaleriaAntesySig[GaleriaAntesySig.Count>0 ? GaleriaAntesySig.Count -1 : 0] ;
                        if (item != null)
                        { %>
			                <a href="<%= ResolveUrl("~/GaleriaDetalle.aspx?nodeId=" + item.GetValue("NodeID")) %>" class=""> Ver <span class="hidden-sm hidden-xs">galería</span> siguiente <i class="fa fa-chevron-right text-blue"></i>
                                <img src="<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + item.GetValue("File"))%>" alt="<%= item.GetValue("Titulo") %>" width="60" class="hidden-xs">
			                </a>
                        <% } %>
                        </div>
			        </div>
               <% } %>
		</div>
	</div>
</section>
</asp:Content>