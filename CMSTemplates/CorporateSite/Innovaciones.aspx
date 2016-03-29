<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="Innovaciones.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_Innovaciones" %>
<%@ Register TagPrefix="uc1" TagName="editabletext" Src="~/CMSWebParts/Text/editabletext.ascx" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
	<div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + CMSContext.CurrentDocument.GetValue("MenuItemTeaserImage"))%>);"></div>
	<div class="container posr">
		<h1>Innovaciones</h1>
	</div>
</div>

<section class="innovaciones-list">
	<div class="container">
		<p class="lead"><uc1:editabletext runat="server" ID="editabletext1" RegionType="TextArea" /></p><br>
		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<div class="filters">
					<div class="btn-group btn-group-lg">
					  <button type="button" class="btn btn-default upper hidden-xs">Filtros <i class="fa fa-angle-right"></i></button>
					  <button type="button" class="btn btn-default active filter" data-type="" data-filter="">Ver todos</button>
					  <div class="btn-group btn-group-lg" role="group">
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="min-width:160px;"><span class="visible-xs">FILTRAR</span> Por eje temático <span class="caret"></span>
					    </button>
					    <ul class="dropdown-menu pull-right">
					        <li><a href="#" class="tnormal filter" data-type="TipoEjeTematico" data-filter="1">Mitigación del Cambio Climático</a></li>
					        <li><a href="#" class="tnormal filter" data-type="TipoEjeTematico" data-filter="2">Servicios Ambientales para Agua</a></li>
					        <li><a href="#" class="tnormal filter" data-type="TipoEjeTematico" data-filter="3">Valor agregado de productos forestales <br> sostenibles</a></li>
					        <li><a href="#" class="tnormal filter" data-type="TipoEjeTematico" data-filter="4">Manejo Forestal Comunitario</a></li>
					    </ul>
					  </div>
					  <div class="btn-group btn-group-lg" role="group">
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="visible-xs">FILTRAR</span> Por país <span class="caret"></span>
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

        <div class="row" id="divNoData" style="<%= repeaterInnovacion.Items.Count > 0 ? "display: none;" : "" %>">
            <div class="container posr">
                <h1 class="text-marron-dark">No se encontraron Innovaciones</h1>
            </div>
        </div>

		<div class="row isotope" id="mixitUp">
		    <cms:CMSRepeater ID="repeaterInnovacion" runat="server" ClassNames="MFS.Proyecto" SelectOnlyPublished="True" OrderBy="DocumentPublishFrom DESC" SelectTopN="12" 
                Columns="Titulo, Lugar, Resumen, ImagenPreview, TipoEjeTematico" >
                <ItemTemplate>
                    <div class="col-md-4 col-sm-6 col-xs-12 item-is">
                       <div class="innovacion-item">
					        <div class="caption caption-top bg-<%# Eval("TipoEjeTematico") %>">
						        <h5><%# Eval("Lugar") %></h5>
						        <h2 class="tnormal"><%# Eval("Titulo") %></h2>
						        <p><%# Eval("Resumen") %></p>
					        </div>
					        <a href="<%# ResolveUrl("~/Innovacion-Detalle.aspx?nodeId=" + Eval("NodeID")) %>">
						        <div class="innovacion-img">
							        <img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("ImagenPreview")) %>" alt="<%# Eval("Titulo") %>" class="img-responsive">
						        </div>
					        </a>
				        </div>
                    </div>
                </ItemTemplate>
            </cms:CMSRepeater>
		</div>
		<p class="text-center mb-20">
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
            topNDefault: <%= repeaterInnovacion.SelectTopN %>,
            topN: <%= repeaterInnovacion.SelectTopN %>
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
            getInnovaciones(false);
            $(".loading").show();
        });

        $("#linkCargaMas").click(function (event) {
            event.preventDefault();
            getInnovaciones(true);
        });
        
        filters.topN = <%= DocumentsCount("") %>;
        verLinkCargaMas();

        function getInnovaciones(isLoadAll) {
            $.ajax({
                url: 'Innovaciones.aspx/GetInnovaciones',
                data: JSON.stringify({
                    filterType: filters.type,
                    filterValue: filters.value,
                    topN: filters.topN
                }),
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    var pubHtml = '';
                    $('#divNoData').hide();
                    if (response.d.Success) {
                        var data = response.d.Data.List;
                        filters.topN = response.d.Data.Count;
                        verLinkCargaMas(isLoadAll);

                        if (data != undefined && data.length > 0) {
                            pubHtml = '';
                            var url = '<%= ResolveUrl("~/CMSPages/GetFile.aspx") %>';
                            var urlDetalle = ' <%= ResolveUrl("~/Innovacion-Detalle.aspx") %>';
                            for (var i = 0; i < data.length; i++) {
                                var item = data[i];
                                pubHtml +=
                                    '<div class="col-md-4 col-sm-6 col-xs-12 item-is">\
                                       <div class="innovacion-item">\
					                        <div class="caption caption-top bg-' + item.TipoEjeTematico + '">\
						                        <h5>' + item.Lugar + '</h5>\
						                        <h2 class="tnormal">' + item.Titulo + '</h2>\
						                        <p>' + item.Resumen + '</p>\
					                        </div>\
					                        <a href="' + urlDetalle + '?nodeId=' + item.NodeId + '">\
						                        <div class="innovacion-img">\
							                        <img src="' + url + '?guid=' + item.ImagenPreview + '" alt="' + item.Titulo + '" class="img-responsive">\
						                        </div>\
					                        </a>\
				                        </div>\
                                    </div>';
                            }
                        }
                    }
                    $('#mixitUp').html(pubHtml);

                    if (pubHtml === '')
                        $('#divNoData').show();

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