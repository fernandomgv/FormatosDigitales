<%@ Page Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="Home.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_Home" ValidateRequest="false" %>
<%@ Import Namespace="System.Data" %>
<%@ Register Src="~/CMSWebParts/Text/editabletext.ascx" TagPrefix="uc1" TagName="editabletext" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
<section class="slide-content arrows-vertical">
	<div class="slide-home ">
        <cms:CMSRepeater ID="repeaterSlider" PagerControl-QueryStringKey="selectall" runat="server" ClassNames="MFS.Slider" OrderBy="SliderID ASC" >
            <ItemTemplate>
                <div class="item-slide slide-item-<%# Eval("TipoEjeTematico") %>" style="background-image:url(<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("Imagen")) %>);">
	                <div class=" container">
		                <div class="content-slide-item">
			                <div class="row">
				                <div class="slide-caption col-lg-3 col-md-4 col-sm-5 col-xs-12 col-lg-offset-9">
					                <div class="">
                                        <img src="<%# string.Format("~/App_Themes/MFSAndina/assets/img/icon-white-{0}.png", Eval("TipoEjeTematico")) %>" alt="<%# Eval("Titulo") %>" class="hidden-xs">
						                <img src="<%# string.Format("~/App_Themes/MFSAndina/assets/img/icon-color-{0}.png", Eval("TipoEjeTematico")) %>" alt="<%# Eval("Titulo") %>" class="visible-xs">
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

<section class="section-map">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-7">
				<div class="text-map-home">
					<h4 class="subtitle s-primary"><uc1:editabletext runat="server" ID="editabletext1" /></h4>
					<h2><uc1:editabletext runat="server" ID="editabletext2" /></h2>
					<p><uc1:editabletext runat="server" ID="editabletext3" /></p>
					<div class="col-xs-6">
						<p class="upper bold"><span class="text-pink">1</span> <small class="text-primary">Colombia</small></p>
						<p class="upper bold"><span class="text-pink">2</span> <small class="text-primary">Ecuador</small></p>
					</div>
					<div class="col-xs-6">
						<p class="upper bold"><span class="text-pink">3</span> <small class="text-primary">Perú</small></p>
						<p class="upper bold"><span class="text-pink">4</span> <small class="text-primary">Bolivia</small></p>
					</div><span class="clearfix"></span><br>
					<p class="hidden-xs">
						<a href="<%= ResolveUrl("~/Potencial-Forestal.aspx") %>" class="link-more">Ver Más <span class="text-primary"><i class="fa fa-chevron-right"></i></span></a>
					</p>
				</div>
			</div>
			<div class="col-md-3 col-sm-5">
				<br class="hidden-sm hidden-xs"><br class="hidden-sm hidden-xs">
				<div class="img-mapa">
					<img src="~/App_Themes/MFSAndina/assets/img/mapa.jpg" alt="Mapa" class="img-responsive">
				</div>
			</div>
			<div class="visible-sm clearfix"></div>
			<div class="col-md-5">
				<br>
				<div class="row">
					<div class="col-xs-6 col-sm-3 col-md-5">
						<div class="number-box">
							<div class="number-lg text-primary"><uc1:editabletext runat="server" ID="eTextDiv" /></div>
							<h4><uc1:editabletext runat="server" ID="eTextH4" /></h4>
						</div>
					</div>
					<div class="col-xs-6 col-sm-3 col-md-5 col-md-offset-2">
						<div class="number-box">
							<div class="number-lg text-success"><uc1:editabletext runat="server" ID="eTextDiv1" /></div>
							<h4><uc1:editabletext runat="server" ID="eTextH42" /></h4>
						</div>
					</div>
					<div class="col-xs-6 col-sm-3 col-md-5">
						<div class="number-box">
							<div class="number-lg text-success"><uc1:editabletext runat="server" ID="eTextDiv2" /></div>
							<h4><uc1:editabletext runat="server" ID="eTextH43" /></h4>
						</div>
					</div>
					<div class="col-xs-6 col-sm-3 col-md-5 col-md-offset-2">
						<div class="number-box">
							<div class="number-lg text-success"><uc1:editabletext runat="server" ID="eTextDiv3" /></div>
							<h4><uc1:editabletext runat="server" ID="eTextH45" /></h4>
						</div>
					</div>
				</div>
				<p class="text-center visible-xs mt-30">
					<a href="#" class="link-more">Ver Más <span class="text-primary"><i class="fa fa-chevron-right"></i></span></a>
				</p>
			</div>
		</div>
	</div>
</section>
<section class="section-home-innovaciones">
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<div class="box-gris-left">
					<div class="box-panel box-white box-mobile">
						<h4 class="subtitle s-marron"><uc1:editabletext runat="server" ID="editabletext4" /></h4>
						<h2><uc1:editabletext runat="server" ID="editabletext5" /></h2>
						<p><uc1:editabletext runat="server" ID="editabletext6" /></p>
						<br>
						<p class="text-marron">
						    <a href="<%= ResolveUrl("~/Innovaciones.aspx?paisId=Bolivia") %>" class="text-marron">Bolivia</a> / 
                            <a href="<%= ResolveUrl("~/Innovaciones.aspx?paisId=Colombia") %>" class="text-marron">Colombia</a> / 
                            <a href="<%= ResolveUrl("~/Innovaciones.aspx?paisId=Peru") %>" class="text-marron">Perú</a> / 
                            <a href="<%= ResolveUrl("~/Innovaciones.aspx?paisId=Ecuador") %>" class="text-marron">Ecuador</a>
						</p>
						<br>
						<p>
							<a href="<%= ResolveUrl("~/Innovaciones.aspx") %>" class="link-more text-marron">Ver Más <span><i class="fa fa-chevron-right"></i></span></a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<h2 class="title-lg">
					Innovaciones
				</h2>
				<div class="slide-home-innovacion">
				    <% if (Proyectos != null)
                    {
                        for (int i = 0; i < Proyectos.Count; i++)
                        {
                            DataRow itemfm = Proyectos[i];
                        %>
                            <div class="item-slide-home-innovacion">
						        <div class="row">
							        <div class="col-sm-6">
								        <div class="innovacion-item">
									        <a href="#">
										        <div class="innovacion-img">
											        <img src="<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + itemfm.<Guid>("ImagenPreview")) %>" alt="<%= itemfm.Field<string>("Titulo") %>" class="img-responsive">
										        </div>
									        </a>
									        <div class="caption caption-bottom bg-marron">
										        <h5><%= itemfm.Field<string>("Lugar") %></h5>
										        <h2 class="tnormal"><%= itemfm.Field<string>("Titulo") %></h2>
										        <p><%= itemfm.Field<string>("Resumen") %></p>
									        </div>
								        </div>
							        </div>
                                    <%  
                                        i++;
                                        if (i < Proyectos.Count)
                                        {
                                            itemfm = Proyectos[i]; %>
                                            <div class="col-sm-6">
								                <div class="innovacion-item">
									                <div class="caption caption-top bg-danger">
										                <h5><%= itemfm.Field<string>("Lugar") %></h5>
										                <h2 class="tnormal"><%= itemfm.Field<string>("Titulo") %></h2>
										                <p><%= itemfm.Field<string>("Resumen") %></p>
									                </div>
									                <a href="#">
										                <div class="innovacion-img">
											                <img src="<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + itemfm.Field<Guid>("ImagenPreview")) %>" alt="<%= itemfm.Field<string>("Titulo") %>" class="img-responsive">
										                </div>
									                </a>
								                </div>
							                </div>
                                        <%}
                                    %>							        
						        </div>
					        </div>
                        <%}
                    } %>
				</div>
				<p class="text-center visible-xs mt-30">
					<br>
					<a href="<%= ResolveUrl("~/Innovaciones.aspx") %>" class="link-more">Ver Todas <span class="text-marron"><i class="fa fa-chevron-right"></i></span></a>
				</p>
			</div>
		</div>
	</div>
</section>
<section class="section-home-galerias">
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-sm-12">
				<h2 class="title-lg">
					Galerías
				</h2>
				<div class="slide-home-galerias arrows-horizontal">
				    <cms:CMSRepeater ID="repeaterGaleria" runat="server" ClassNames="MFS.Galeria" SelectOnlyPublished="True" OrderBy="DocumentPublishFrom DESC" SelectTopN="10"
                        WhereCondition="EsDestacada = 1" Columns="NodeID, GaleriaID, Titulo, [File], DescripcionCorta, NodeChildNodesCount" Path="/Galerias/%" CacheMinutes="10">
                        <ItemTemplate>
                            <div class="item-slide-galerias text-center-min">
						        <div class="row">
							        <div class="col-sm-7 col-sm-">
								        <div class="img-galeria">
									        <a href="<%# ResolveUrl("~/GaleriaDetalle.aspx?nodeId=" + Eval("NodeID")) %>"><img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("File")) %>" alt="<%# Eval("Titulo") %>" class="img-responsive"></a>
								        </div>
							        </div>
							        <div class="col-sm-5 ">
								        <div class="caption-home-galeria">
									        <h4 class="subtitle s-blue">Galerías Destacadas</h4>
									        <h2><%# Eval("Titulo") %></h2>
									        <p><%# Eval("DescripcionCorta") %></p>
									        <h5 class="text-blue"><%# Eval("NodeChildNodesCount") %> Fotos</h5>
									        <br>
									        <p>
										        <a href="<%# ResolveUrl("~/GaleriaDetalle.aspx?nodeId=" + Eval("NodeID")) %>" class="link-more">Ver Galería <span class="text-blue"><i class="fa fa-chevron-right"></i></span></a>
									        </p>
								        </div>
							        </div>
						        </div>
					        </div>
                        </ItemTemplate>
                    </cms:CMSRepeater>
				</div>
			</div>
			<div class="col-md-3 col-sm-12">
				<h4 class="subtitle s-primary"><uc1:editabletext runat="server" ID="editabletext7" /></h4>
				<div class="list-pub-home">
					<div class="row">
                        <cms:CMSRepeater ID="repeaterPublicacion" runat="server" ClassNames="MFS.Publicacion" SelectOnlyPublished="True" OrderBy="DocumentPublishFrom DESC" SelectTopN="2" 
                            Columns="Sinopsis, ArchivoPublicacion, TipoDocumento, TipoEjeTematico, DocumentPublishFrom" Path="/Publicaciones/%" CacheMinutes="10">
                            <ItemTemplate>
                                <article class="col-md-12 col-sm-6">
	                                <h5 class="pub-time text-color-<%# Eval("TipoEjeTematico") %>"><%# string.Format("{0:dd - MM - yyyy}", Eval("DocumentPublishFrom")) %><span class="pull-right"><%# Eval("TipoDocumento") %></span> </h5>
	                                <p class="text-lg"><%# Eval("Sinopsis") %></p>
	                                <p>
		                                <a target="_blank" href="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("ArchivoPublicacion")) %>" class="btn-donwload">Descargar <i class="fa fa-chevron-down text-success"></i></a>
	                                </p>
                                </article>
                            </ItemTemplate>
                        </cms:CMSRepeater>
					</div>
				</div>
				<p class="text-center-md">
					<a href="<%= ResolveUrl("~/Publicaciones.aspx") %>" class="link-more">Ver Todas <span class="text-primary"><i class="fa fa-chevron-right"></i></span></a>
				</p>
			</div>
		</div>
	</div>
</section>
</asp:Content>