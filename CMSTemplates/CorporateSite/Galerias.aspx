<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="Galerias.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_Galerias" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
    <div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + CMSContext.CurrentDocument.GetValue("MenuItemTeaserImage"))%>);"></div>
    <div class="container posr">
	    <h1>Galerías</h1>
    </div>
</div>
    
<section class="bg-gris" id="gallery-list">
	<div class="container">
		<div class="row" id="divGalerias">
            <cms:CMSRepeater ID="repeaterGaleria" runat="server" ClassNames="MFS.Galeria" SelectOnlyPublished="True" OrderBy="DocumentPublishFrom DESC" SelectTopN="8" 
                Columns="NodeID, GaleriaID, Titulo, [File], DescripcionCorta, NodeChildNodesCount">
                <ItemTemplate>
                    <div class="col-xs-12 col-sm-4 col-md-3">
				        <div class="item-slide-galerias text-center-min">
					        <div class="row">
						        <div class="col-sm-12 col-xs-5">
							        <div class="img-galeria">
								        <a href="<%# ResolveUrl("~/GaleriaDetalle.aspx?nodeId=" + Eval("NodeID")) %>"><img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("File")) %>" alt="<%# Eval("Titulo") %>" class="img-responsive"></a>
							        </div>
						        </div>
						        <div class="col-sm-12 col-xs-7">
							        <div class="caption-home-galeria">
								        <h2><%# Eval("Titulo") %></h2>
								        <p class="hidden-xxs"><%# Eval("DescripcionCorta") %></p>
								        <h5 class="text-blue"><%# Eval("NodeChildNodesCount") %> Fotos</h5>
								        <p>
									        <a href="<%# ResolveUrl("~/GaleriaDetalle.aspx?nodeId=" + Eval("NodeID")) %>" class="link-more"><span class="link-text">Ver Galería</span> <span class="text-blue"><i class="fa fa-chevron-right"></i></span></a>
								        </p>
							        </div>
						        </div>
					        </div>
				        </div>
			        </div>
                </ItemTemplate>
            </cms:CMSRepeater>
		</div>
		<p class="text-center mt-30">
			<a href="#" id="linkCargaMas" class="link-more">Cargar más <i class="fa fa-chevron-right"></i></a>
		</p>
	</div>
</section>
</asp:Content>

<asp:Content ContentPlaceHolderID="plcScript" Runat="Server">
    <script type="text/javascript">
        var filters = {
            topNDefault: <%= repeaterGaleria.SelectTopN %>,
            topN: <%= repeaterGaleria.SelectTopN %>
        };

        $("#linkCargaMas").click(function (event) {
            event.preventDefault();
            getGalerias();
        });
        
        filters.topN = <%= DocumentsCount("") %>;
        verLinkCargaMas();

        function getGalerias() {
            $(".mainDiv").append('<div class="modal-backdrop"><i class="fa fa-refresh fa-spin"></i></div>');
            $.ajax({
                url: 'Galerias.aspx/GetGalerias',
                data: JSON.stringify({
                    topN: filters.topN
                }),
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    var pubHtml = '';
                    if (response.d.Success) {
                        var data = response.d.Data;

                        if (data != null && data.length > 0) {
                            var urlFile = '<%= ResolveUrl("~/CMSPages/GetFile.aspx") %>';
                            var urlDetalle = '<%= ResolveUrl("~/GaleriaDetalle.aspx?nodeId=") %>';
                            for (var i = 0; i < data.length; i++) {
                                var item = data[i];
                                pubHtml +=
                                    '<div class="col-xs-12 col-sm-4 col-md-3">\
				                        <div class="item-slide-galerias text-center-min">\
					                        <div class="row">\
						                        <div class="col-sm-12 col-xs-5">\
							                        <div class="img-galeria">\
								                        <a href="' + urlDetalle + item.NodeId + '"><img src="' + urlFile + '?guid=' + item.File + '" alt="' + item.Titulo + '" class="img-responsive"></a>\
							                        </div>\
						                        </div>\
						                        <div class="col-sm-12 col-xs-7">\
							                        <div class="caption-home-galeria">\
								                        <h2>' + item.Titulo + '</h2>\
								                        <p class="hidden-xxs">' + item.DescripcionCorta + '</p>\
								                        <h5 class="text-blue">' + item.NodeChildNodesCount + ' Fotos</h5>\
								                        <p>\
									                        <a href="' + urlDetalle + item.NodeId + '" class="link-more"><span class="link-text">Ver Galería</span> <span class="text-blue"><i class="fa fa-chevron-right"></i></span></a>\
								                        </p>\
							                        </div>\
						                        </div>\
					                        </div>\
				                        </div>\
			                        </div>';
                            }
                        }
                    }

                    $('#divGalerias').html(pubHtml);
                    $('#linkCargaMas').hide();
                    $(".mainDiv").find('.modal-backdrop').remove();
                }
            });
        };

        function verLinkCargaMas() {
            if (filters.topN > filters.topNDefault)
                $('#linkCargaMas').show();
            else
                $('#linkCargaMas').hide();
        }
    </script>
</asp:Content>