<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="InnovacionDetalle.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_InnovacionDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="plcMain" Runat="Server">
<section class="inonvacion-header inonvacion-color-<%= Innovacion.TipoEjeTematico %>">
	<div class="container posr">
		<img src="~/App_Themes/MFSAndina/assets/img/square<%= Innovacion.TipoEjeTematico %>.jpg" class="innovacion-icon">
	</div>
	<div class="page-header">
	    <div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Innovacion.ImagenPage)%>);"></div>
    </div>
</section>

<section class="sec-eje-detalle eje-detalle-<%= Innovacion.TipoEjeTematico %>">
	<div class="page-header">
		<div class="container posr">
			<a href="<%= ResolveUrl("~/Innovaciones.aspx") %>" class="link-return hidden-xs"><i class="fa fa-chevron-left text-color-<%= Innovacion.TipoEjeTematico %>"></i> Volver</a>
			<h1 class="title-eje"><%= Innovacion.Titulo %></h1>
		</div>
	</div>
	<div class="container">
		<p class="lead"><%= Innovacion.Descripcion %></p>

		<%--
		<h3 class="title-eje">Contexto</h3>
        <%= Innovacion.Contexto %>
        --%>
	</div>
<%--
	<div class="eje-lead eje-lead-<%= Innovacion.TipoEjeTematico %>">
		<img src="~/App_Themes/MFSAndina/assets/img/img-lead-<%= Innovacion.TipoEjeTematico %>.png" alt="" class="lead-img hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<span class="lead-icon"><i class="fa fa-quote-left"></i></span>
					<div class="lead-content">
					    <%= Innovacion.SeccionInfoEje %>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<h3 class="title-eje">Modelos de innovación</h3>
        <%= Innovacion.ModeloInnovacion %>

		<div class="mt-40">
			<h3 class="title-eje">Beneficios</h3>
			<%= Innovacion.Beneficio %>
		</div>
        
		<div class="mt-30">
			<h3 class="title-eje">Cifras Importantes</h3>
            <%= Innovacion.Cifras %>
		</div>

		<div class="mt-30">
			<h3 class="title-eje">Potencial de sostenibilidad, escalamiento y replicación de la innovación</h3>
			 <%= Innovacion.Potencial %>
		</div>
        
		<div class="mt-40">
			<h3 class="title-eje">Videos Testimoniales</h3>
			<br>
            <cms:CMSRepeater ID="repeaterVideos" runat="server" ClassNames="MFS.Video" SelectOnlyPublished="True" OrderBy="DocumentPublishFrom DESC" SelectTopN="4" 
                Columns="Titulo, Descripcion, Uri" Path="/Innovaciones/%" >
                <ItemTemplate>
                    <% if (Intercambiar)
                       { %>
                            <div class="row">
				                <div class="col-md-6 col-sm-7">
					                <div class="embed-responsive embed-responsive-16by9">
					                  <iframe class="embed-responsive-item" src="<%# Eval("Uri") %>"></iframe>
					                </div>
				                </div>
				                <div class="col-md-4 col-sm-5">
					                <h6 class="title-eje"><%# Eval("Titulo") %></h6>
					                <p><%# Eval("Descripcion") %></p>
				                </div>
			                </div>
                    <% }
                       else
                       { %>
                            <div class="row mt-40">
				                <div class="col-md-4 col-sm-5 col-md-offset-2">
					                <h6 class="title-eje"><%# Eval("Titulo") %></h6>
					                <p><%# Eval("Descripcion") %></p>
				                </div>
				                <div class="col-md-6 col-sm-7">
					                <div class="embed-responsive embed-responsive-16by9">
					                  <iframe class="embed-responsive-item" src="<%# Eval("Uri") %>"></iframe>
					                </div>
				                </div>
			                </div>
                      <% }
                        Intercambiar = !Intercambiar;
                    %>
                </ItemTemplate>
            </cms:CMSRepeater>
		</div>
		
		<div class="mt-40">
			<h3 class="title-eje">Entidades desarrolladas</h3>
			<%= Innovacion.EntidadDesarrollada %>
		</div>

		<div class="mt-40">
			<h3 class="title-eje">Descargas y publicaciones</h3>
			<%= Innovacion.DescargaPublicacion %>
		</div>
	</div>

--%>
	<div class="pub-innovaciones">
		<div class="container">
			<div class="row">
			    <cms:CMSRepeater ID="repeaterPublicacion" runat="server" ClassNames="MFS.Publicacion" SelectOnlyPublished="True" OrderBy="DocumentPublishFrom DESC" SelectTopN="3" 
                    Columns="Titulo, Sinopsis, ArchivoPublicacion, TipoDocumento, TipoEjeTematico, DocumentPublishFrom" Path="/Innovaciones/%" >
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-6 col-xs-12">
				            <article class="publicacion-grid pub-grid-<%# Eval("TipoEjeTematico") %>">
					            <h4 class="subtitle"><%# string.Format("{0:dd - MM - yyyy}", Eval("DocumentPublishFrom")) %></h4>
					            <h2 class="title-pub"><%# Eval("Titulo") %></h2>
					            <p><%# Eval("Sinopsis") %></p>
					            <p>
						            <a target="_blank" href="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("ArchivoPublicacion")) %>" class="link-more">Descargar <span class="link-icon"><i class="fa fa-chevron-right"></i></span></a>
						            <span class="pull-right pub-tipo"><%# Eval("TipoDocumento") %></span>
					            </p>
				            </article>
			            </div>
                    </ItemTemplate>
                </cms:CMSRepeater>
			</div>
		</div>
	</div>
</section>
</asp:Content>