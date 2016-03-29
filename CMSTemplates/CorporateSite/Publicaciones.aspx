<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="Publicaciones.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_Publicaciones" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
	<div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + CMSContext.CurrentDocument.GetValue("MenuItemTeaserImage"))%>);"></div>
	<div class="container posr">
		<h1>Publicaciones</h1>
	</div>
</div>

<section class="bg-marron-gris">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<div class="filters">
					<div class="btn-group btn-group-lg">
                        <button type="button" class="btn btn-default upper hidden-xs">Filtros <i class="fa fa-angle-right"></i></button>
                        <button type="button" class="btn btn-default active filter" data-type="" data-filter="">Ver todos</button>
					    <div class="btn-group btn-group-lg" role="group">
					        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="min-width:160px;">
					            <span class="visible-xs">FILTRAR</span> Por eje temático <span class="caret"></span>
					        </button>
					        <ul class="dropdown-menu pull-right">
                                <li><a href="#" class="tnormal filter" data-type="TipoEjeTematico" data-filter="1">Mitigación del Cambio Climático</a></li>
					            <li><a href="#" class="tnormal filter" data-type="TipoEjeTematico" data-filter="2">Servicios Ambientales para Agua</a></li>
					            <li><a href="#" class="tnormal filter" data-type="TipoEjeTematico" data-filter="3">Valor agregado de productos forestales <br> sostenibles</a></li>
					            <li><a href="#" class="tnormal filter" data-type="TipoEjeTematico" data-filter="4">Manejo Forestal Comunitario</a></li>
					        </ul>
                        </div>
					    <div class="btn-group btn-group-lg" role="group">
					        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					            <span class="visible-xs">FILTRAR</span> Por país <span class="caret"></span>
					        </button>
					        <ul class="dropdown-menu pull-right">
                                <li><a href="#" class="tnormal filter" data-type="Pais" data-filter="Peru">Perú</a></li>
					            <li><a href="#" class="tnormal filter" data-type="Pais" data-filter="Colombia">Colombia</a></li>
					            <li><a href="#" class="tnormal filter" data-type="Pais" data-filter="Ecuador">Ecuador</a></li>
					            <li><a href="#" class="tnormal filter" data-type="Pais" data-filter="Bolivia">Bolivia</a></li>
					        </ul>
					    </div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="mixitUp">
            <cms:CMSRepeater ID="repeaterPublicacion" runat="server" ClassNames="MFS.Publicacion" SelectOnlyPublished="True" OrderBy="DocumentPublishFrom DESC" SelectTopN="12" 
                Columns="Titulo, Sinopsis, ArchivoPublicacion, TipoDocumento, TipoEjeTematico, DocumentPublishFrom" CacheMinutes="30" >
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
		<p class="text-center mt-10">
            <a href="#" id="linkCargaMas" class="link-more">Cargar más <i class="fa fa-chevron-right"></i></a>
		</p>
	</div>
</section>
</asp:Content>

<asp:Content ContentPlaceHolderID="plcScript" Runat="Server">
    <script type="text/javascript">
        var filters = {
            type: '',
            value: '',
            topNDefault: <%= repeaterPublicacion.SelectTopN %>,
            topN: <%= repeaterPublicacion.SelectTopN %>
        };

        $(".filters a").click(function (event) {
            event.preventDefault();
        });
        
        $('.filters').on('click', '.filter', function () {
            var $this = $(this);
            $('.filters .filter').removeClass('active');
            $this.addClass('active');
            filters.type = $this.attr('data-type');
            filters.value = $this.attr('data-filter');
            filters.topN = filters.topNDefault;
            getPublicaciones(false);
            $(".loading").show();
        });

        $("#linkCargaMas").click(function (event) {
            event.preventDefault();
            getPublicaciones(true);
        });
        
        filters.topN = <%= DocumentsCount("") %>;
        verLinkCargaMas();

        function getPublicaciones(isLoadAll) {
            $.ajax({
                url: 'Publicaciones.aspx/GetPublicaciones',
                data: JSON.stringify({
                    filterType: filters.type,
                    filterValue: filters.value,
                    topN: filters.topN
                }),
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    var pubHtml = '<div class="container posr">\
                            <h1 class="text-marron-dark">No se encontraron publicaciones</h1>\
                        </div>';
                    if (response.d.Success) {
                        var data = response.d.Data.List;
                        filters.topN = response.d.Data.Count;
                        verLinkCargaMas(isLoadAll);

                        if (data != undefined && data.length > 0) {
                            pubHtml = '';
                            var url = '<%= ResolveUrl("~/CMSPages/GetFile.aspx") %>';
                            for (var i = 0; i < data.length; i++) {
                                var item = data[i];
                                pubHtml +=
                                    '<div class="col-md-4 col-sm-6 col-xs-12">\
				                        <article class="publicacion-grid pub-grid-' + item.TipoEjeTematico + '">\
					                        <h4 class="subtitle">' + item.FechaPublicacion + '</h4>\
					                        <h2 class="title-pub">' + item.Titulo + '</h2>\
					                        <p>' + item.Sinopsis + '</p>\
					                        <p>\
						                        <a target="_blank" href="' + url + '?guid=' + item.ArchivoPublicacion + '" class="link-more">Descargar <span class="link-icon"><i class="fa fa-chevron-right"></i></span></a>\
						                        <span class="pull-right pub-tipo">' + item.TipoDocumento + '</span>\
					                        </p>\
				                        </article>\
			                        </div>';
                            }
                        }
                    }

                    $('#mixitUp').html(pubHtml);
                    $(".loading").hide();
                }
            });
        };

        function verLinkCargaMas(isLoadAll) {
            if (!isLoadAll && filters.topN > filters.topNDefault)
                $('#linkCargaMas').show();
            else
                $('#linkCargaMas').hide();
        }
    </script>
</asp:Content>