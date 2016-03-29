<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="Busqueda.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_Busqueda" %>
<%@ Import Namespace="CMS.ExtendedControls" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server">
<div class="page-header">
	<div class="container posr">
		<h1 class="text-marron-dark">Resultados para: </h1><p><b><asp:Label runat="server" ID="lblSearchText"></asp:Label></b></p>
	</div>
</div>
<div class="container">
	<div class="row">
	    <% if (repeaterSearch.Items.Count == 0)
	       {%>
	            <div class="container posr">
                    <h1 class="text-marron-dark">No se encontraron resultados</h1>
                </div>
	     <%}%>

        <asp:Repeater runat="server" ID="repeaterSearch">
            <ItemTemplate>
                <div class="col-sm-12 col-xs-12">
                    <div style="margin-bottom: 30px;">
                        <div style="float: left; border: solid 1px #eeeeee; width: 90px; height:90px; margin-right: 5px;">
                           <img src="<%# UrIImagen(Eval("image"))  %>" alt="" style="width: 90px; height:90px;">
                        </div>
                        <div style="float: left">
                            <div>
                                <a href="#" data-documentid="<%# Eval("id").ToString().Split(';')[0] %>" style="font-weight: bold">
                                    <%# Eval("title") %>
                                </a>
                            </div>
                            <div class="content-filter" style="margin-top: 5px; width: 590px;min-height:40px">
                                <%# HTMLHelper.HTMLEncode(TextHelper.LimitLength(HttpUtility.HtmlDecode(HTMLHelper.StripTags(ControlsHelper.RemoveDynamicControls(DataHelper.GetNotEmpty(Eval("content"), "")), false, " ")), 280, "...")) %>
                            </div>
                            <div style="margin-top: 5px;">
                                <div title="Relevancia: <%# Convert.ToInt32((ValidationHelper.GetDouble(Eval("Score"),0.0))*100) %> %" style="width: 100px; border: solid 1px #aaaaaa; margin-top: 7px; margin-right: 6px;
                                    float: left; color: #0000ff; font-size: 2pt; line-height: 4px; height: 6px;">
                                    <div style="background-color:#a7d3a7;width:<%# Convert.ToInt32((ValidationHelper.GetDouble(Eval("Score"),0.0))*100) %>px;height:4px;line-height: 4px;">
                                    </div>
                                </div>
                                <span style="padding-left:5px;color: #888888; font-size: 9pt">
                                     <%# Eval("created") %>
                                </span>
                            </div>
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
</asp:Content>

<asp:Content ContentPlaceHolderID="plcScript" Runat="Server">
    <script type="text/javascript">
        $('.content-filter').each(function() {
            var $this = $(this);
            var content = $this.html();
            $this.html(content.replace("<%= lblSearchText.Text %>", "<span style='background-color: #FEFF8F'><%= lblSearchText.Text %></span>"));
        });

        $('a[data-documentid]').on('click', function (e) {
            var $this = $(this);
            $(".loading").show();
            $.ajax({
                url: 'Resultado-Busqueda.aspx/GetDocumento',
                data: JSON.stringify({
                    documentId: $this.data("documentid")
                }),
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $(".loading").hide();
                    if (response.d.Success) {
                        //alert(response.d.Data);
                        window.location.href = response.d.Data;
                    }
                }
            });
            e.preventDefault();
        });
    </script>
</asp:Content>