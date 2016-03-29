<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="EjeValorAgregado.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_EjeValorAgregado" %>

<%@ Register TagPrefix="uc1" TagName="editabletext" Src="~/CMSWebParts/Text/editabletext.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="plcMain" Runat="Server">
    <section class="slide-content arrows-vertical">
	<div class="slide-home ">
        <cms:CMSRepeater ID="repeaterSlider" PagerControl-QueryStringKey="selectall" runat="server" ClassNames="MFS.Slider" OrderBy="SliderID ASC" 
            Columns="Titulo, Resumen, Imagen">
            <ItemTemplate>
                <div class="item-slide slide-item-<%= TipoEje %>" style="background-image:url(<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("Imagen")) %>);">
	                <div class=" container">
		                <div class="content-slide-item">
			                <div class="row">
				                <div class="slide-caption col-lg-3 col-md-4 col-sm-5 col-xs-12 col-lg-offset-9">
					                <div class="">
                                        <img src="<%# string.Format("~/App_Themes/MFSAndina/assets/img/icon-white-{0}.png", TipoEje) %>" alt="<%# Eval("Titulo") %>" class="hidden-xs">
						                <img src="<%# string.Format("~/App_Themes/MFSAndina/assets/img/icon-color-{0}.png", TipoEje) %>" alt="<%# Eval("Titulo") %>" class="visible-xs">
						                <h1><%# Eval("Titulo") %></h1>
						                <p class="hidden-xxs-"><%# Eval("Resumen") %></p>
					                </div>
				                </div>
			                </div>
		                </div>
	                </div>
                </div>
            </ItemTemplate>
        </cms:CMSRepeater>
	</div>
</section>

<section class="sec-eje-detalle eje-detalle-<%= TipoEje %>">
	<div class="page-header">
		<div class="container posr">
			<a href="<%= ResolveUrl("~/Ejes.aspx") %>" class="link-return hidden-xs"><i class="fa fa-chevron-left text-color-<%= TipoEje %>"></i> Volver</a>
			<h1 class="title-eje"><uc1:editabletext runat="server" ID="editabletext1" /></h1>
		</div>
	</div>
    <cms:CMSEditableRegion runat="server" ID="CMSEditableRegion" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
	<div class="container">
		<h2 class="title-eje">Innovaciones relacionadas</h2>
	</div>
	<div class="sec-ejes-relacinados">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2 class="title-lg">
						Innovaciones
					</h2>
					<div class="slide-detalle-innovacion arrows-vertical-right">
						<cms:CMSRepeater ID="repeaterInnovacion" runat="server" ClassNames="MFS.Proyecto" SelectOnlyPublished="True" OrderBy="DocumentPublishFrom DESC" SelectTopN="6" 
                            Columns="Titulo, Lugar, Resumen, ImagenPreview" Path="/Innovaciones/%" >
                            <ItemTemplate>
                                <div class="item-slide-home-innovacion">
							        <div class="innovacion-item">
							            <% if(Intercambiar) 
                                        {%>
								            <a href="#">
									            <div class="innovacion-img">
										            <img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("ImagenPreview")) %>" alt="<%# Eval("Titulo") %>" class="img-responsive">
									            </div>
								            </a>
                                            <div class="caption caption-bottom bg-2">
									            <h5><%# Eval("Lugar") %></h5>
									            <h2 class="tnormal"><%# Eval("Titulo") %></h2>
									            <p><%# Eval("Resumen") %></p>
								            </div>
                                        <%}
							               else
							               {%>
							                    <div class="caption caption-top bg-2">
									                <h5><%# Eval("Lugar") %></h5>
									                <h2 class="tnormal"><%# Eval("Titulo") %></h2>
									                <p><%# Eval("Resumen") %></p>
								                </div>
                                                <a href="#">
	                                                <div class="innovacion-img">
		                                                <img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("ImagenPreview")) %>" alt="<%# Eval("Titulo") %>" class="img-responsive">
	                                                </div>
                                                </a>
							               <%}
							               Intercambiar = !Intercambiar;
							            %>
							        </div>
						        </div>
                            </ItemTemplate>
                        </cms:CMSRepeater>
					</div>
					<p class="text-center mt-30">
					    <br>
                        <% if (DocumentsCount() > repeaterInnovacion.SelectTopN)
                           { %>
						        <a href="<%= ResolveUrl("~/Innovaciones.aspx?eje=") + TipoEje %>" class="link-more">Ver Todas <i class="fa fa-chevron-right"></i></a>
                        <% }%>
                    </p>
				</div>
			</div>
		</div>
	</div>
</section>
</asp:Content>