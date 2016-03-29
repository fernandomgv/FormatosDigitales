<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="Comite.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_Comite" %>
<%@ Register TagPrefix="uc1" TagName="editabletext" Src="~/CMSWebParts/Text/editabletext.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="plcMain" Runat="Server">
 <div class="page-header">
	<div class="bg-header-page" style="background:url(<%= ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + CMSContext.CurrentDocument.GetValue("MenuItemTeaserImage"))%>);"></div>
	<div class="container posr">
		<a href="<%= ResolveUrl("~/Programa-MFS.aspx") %>" class="link-return hidden-xs"><i class="fa fa-chevron-left "></i> Volver</a>
		<h1 class="text-marron-dark"><uc1:editabletext runat="server" ID="editabletext1" DefaultText="Comite directivo y equipos" /></h1>
	</div>
</div>
<section class="sec-default">
	<div class="container">
		<p class="lead"><uc1:editabletext runat="server" ID="editabletext2" RegionType="TextArea" /></p>

		<h3 class="title-default"><uc1:editabletext runat="server" ID="editabletext3" DefaultText="Comite directivo" /></h3>
		<p><uc1:editabletext runat="server" ID="editabletext4" RegionType="TextArea" /></p><br>
		<div class="row">
			<div class="col-sm-6">
				<div class="text-center">
				    <cms:CMSEditableImage runat="server" ID="cmsEditableImage" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive" />
					<p class="mt-10"><cms:CMSEditableRegion runat="server" ID="cmsEditableRegion1" RegionTitle="Descripción Imagen" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" DialogHeight="50" /></p>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="text-center">
                    <cms:CMSEditableImage runat="server" ID="cmsEditableImage1" DisplaySelectorTextBox="false" ImageTitle="" ImageCssClass="img-responsive" />
					<p class="mt-10"><cms:CMSEditableRegion runat="server" ID="cmsEditableRegion2" RegionTitle="Descripción Imagen" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" DialogHeight="50" /></p>
				</div>
			</div>
		</div>

		<!-- tabs -->
		<div role="tabpanel" class="mt-20 posr">
		    <!-- Nav tabs -->
		    <div class="tabs-responsive tabs-scroll-1">
		    	<ul class="nav nav-tabs" role="tablist">
		    	    <li role="presentation" class="active">
		    	        <a href="#home" aria-controls="home" role="tab" data-toggle="tab">Bolivia</a>
		    	    </li>
		    	    <li role="presentation">
		    	        <a href="#tab" aria-controls="tab" role="tab" data-toggle="tab">Colombia</a>
		    	    </li>
		    	    <li role="presentation">
		    	        <a href="#tab2" aria-controls="tab" role="tab" data-toggle="tab">Ecuador</a>
		    	    </li>
		    	    <li role="presentation">
		    	        <a href="#tab3" aria-controls="tab" role="tab" data-toggle="tab">Perú</a>
		    	    </li>
		    	</ul>
		    </div>
		    <div class="tabs-controls" data-scroll="90" data-fortabs="tabs-scroll-1">
				<div class="tabs-left"><i class="fa fa-caret-left"></i></div>
				<div class="tabs-right"><i class="fa fa-caret-right"></i></div>
			</div>
		
		    <!-- Tab panes -->
		    <div class="tab-content">
		        <div role="tabpanel" class="tab-pane active" id="home">
		        	<div class="tab-body">
			            <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion3" RegionTitle="Contenido Bolivia" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
		        	</div>
		        </div>
		        <div role="tabpanel" class="tab-pane" id="tab">
		        	<div class="tab-body">
			            <cms:CMSEditableRegion runat="server" ID="cmsEditableRegion4" RegionTitle="Contenido Colombia" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
		        	</div>
		        </div>
		        <div role="tabpanel" class="tab-pane" id="tab2">
		        	<div class="tab-body">
		        		<cms:CMSEditableRegion runat="server" ID="cmsEditableRegion5" RegionTitle="Contenido Ecuador" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
		        	</div>
		        </div>
		        <div role="tabpanel" class="tab-pane" id="tab3">
		        	<div class="tab-body">
		        		<cms:CMSEditableRegion runat="server" ID="cmsEditableRegion6" RegionTitle="Contenido Perú" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" />
		        	</div>
		        </div>
		    </div>
		</div>
		<hr><br>
        
		<div class="mt-30">
			<h3 class="title-default"><uc1:editabletext runat="server" ID="editabletext5" DefaultText="Equipos" /></h3>
			<p><uc1:editabletext runat="server" ID="editabletext6" RegionType="TextArea" /></p>

			<div role="tabpanel" class="mt-30 posr">
			    <!-- Nav tabs -->
			    <div class="tabs-responsive tabs-responsive-sm tabs-scroll-2">
			    	<ul class="nav nav-tabs" role="tablist">
			    		<li role="presentation" class="active">
			    	        <a href="#tab-er" aria-controls="tab-er" role="tab" data-toggle="tab">Equipo Regional</a>
			    	    </li>
			    	    <li role="presentation">
			    	        <a href="#tab-eb" aria-controls="tab-eb" role="tab" data-toggle="tab">Equipo Bolivia</a>
			    	    </li>
			    	    <li role="presentation">
			    	        <a href="#tab-ec" aria-controls="tab-ec" role="tab" data-toggle="tab">Equipo Colombia</a>
			    	    </li>
			    	    <li role="presentation">
			    	        <a href="#tab-ee" aria-controls="tab-ee" role="tab" data-toggle="tab">Equipo Ecuador</a>
			    	    </li>
			    	    <li role="presentation">
			    	        <a href="#tab-ep" aria-controls="tab-ep" role="tab" data-toggle="tab">Equipo Perú</a>
			    	    </li>
			    	</ul>
			    </div>
			    <div class="tabs-controls tabs-controls-sm" data-scroll="120" data-fortabs="tabs-scroll-2">
					<div class="tabs-left"><i class="fa fa-caret-left"></i></div>
					<div class="tabs-right"><i class="fa fa-caret-right"></i></div>
				</div>
			
			    <!-- Tab panes -->
			    <div class="tab-content">
			        <div role="tabpanel" class="tab-pane active" id="tab-er">
			        	<div class="tab-body">
			        		<div class="row">
					            <cms:CMSRepeater ID="repeaterColaborador" runat="server" ClassNames="MFS.Colaborador" SelectOnlyPublished="True" OrderBy="Nombre" 
                                    Columns="Nombre, Puesto, Email, Foto" Path="/Programa-MFS/Comite/Equipo-Regional/%" >
                                    <ItemTemplate>
                                        <div class="item-person text-center-min">
			        					    <img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("Foto")) %>" alt="<%# Eval("Nombre") %>" class="img-responsive">
			        					    <div class="mt-10"><strong>Nombre</strong></div>
			        					    <div><%# Eval("Nombre") %></div>
			        					    <div><strong>Puesto</strong></div>
			        					    <div><%# Eval("Puesto") %></div>
			        					    <div><strong>Correo Electrónico</strong></div>
			        					    <a href="#" class="tnormal"><%# Eval("Email") %></a>
			        				    </div>
                                    </ItemTemplate>
                                </cms:CMSRepeater>
			        		</div>
			        	</div>
			        </div>
			        <div role="tabpanel" class="tab-pane" id="tab-eb">
			        	<div class="tab-body">
			        		<div class="row">
					            <cms:CMSRepeater ID="CMSRepeater1" runat="server" ClassNames="MFS.Colaborador" SelectOnlyPublished="True" OrderBy="Nombre" 
                                    Columns="Nombre, Puesto, Email, Foto" Path="/Programa-MFS/Comite/Equipo-Bolivia/%" >
                                    <ItemTemplate>
                                        <div class="item-person text-center-min">
			        					    <img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("Foto")) %>" alt="<%# Eval("Nombre") %>" class="img-responsive">
			        					    <div class="mt-10"><strong>Nombre</strong></div>
			        					    <div><%# Eval("Nombre") %></div>
			        					    <div><strong>Puesto</strong></div>
			        					    <div><%# Eval("Puesto") %></div>
			        					    <div><strong>Correo Electrónico</strong></div>
			        					    <a href="#" class="tnormal"><%# Eval("Email") %></a>
			        				    </div>
                                    </ItemTemplate>
                                </cms:CMSRepeater>
			        		</div>
			        	</div>
			        </div>
			        <div role="tabpanel" class="tab-pane" id="tab-ec">
			        	<div class="tab-body">
			        		<div class="row">
					            <cms:CMSRepeater ID="CMSRepeater2" runat="server" ClassNames="MFS.Colaborador" SelectOnlyPublished="True" OrderBy="Nombre" 
                                    Columns="Nombre, Puesto, Email, Foto" Path="/Programa-MFS/Comite/Equipo-Colombia/%" >
                                    <ItemTemplate>
                                        <div class="item-person text-center-min">
			        					    <img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("Foto")) %>" alt="<%# Eval("Nombre") %>" class="img-responsive">
			        					    <div class="mt-10"><strong>Nombre</strong></div>
			        					    <div><%# Eval("Nombre") %></div>
			        					    <div><strong>Puesto</strong></div>
			        					    <div><%# Eval("Puesto") %></div>
			        					    <div><strong>Correo Electrónico</strong></div>
			        					    <a href="#" class="tnormal"><%# Eval("Email") %></a>
			        				    </div>
                                    </ItemTemplate>
                                </cms:CMSRepeater>
			        		</div>
			        	</div>
			        </div>
			        <div role="tabpanel" class="tab-pane" id="tab-ee">
			        	<div class="tab-body">
			        		<div class="row">
					            <cms:CMSRepeater ID="CMSRepeater3" runat="server" ClassNames="MFS.Colaborador" SelectOnlyPublished="True" OrderBy="Nombre" 
                                    Columns="Nombre, Puesto, Email, Foto" Path="/Programa-MFS/Comite/Equipo-Ecuador/%" >
                                    <ItemTemplate>
                                        <div class="item-person text-center-min">
			        					    <img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("Foto")) %>" alt="<%# Eval("Nombre") %>" class="img-responsive">
			        					    <div class="mt-10"><strong>Nombre</strong></div>
			        					    <div><%# Eval("Nombre") %></div>
			        					    <div><strong>Puesto</strong></div>
			        					    <div><%# Eval("Puesto") %></div>
			        					    <div><strong>Correo Electrónico</strong></div>
			        					    <a href="#" class="tnormal"><%# Eval("Email") %></a>
			        				    </div>
                                    </ItemTemplate>
                                </cms:CMSRepeater>
			        		</div>
			        	</div>
			        </div>
			        <div role="tabpanel" class="tab-pane" id="tab-ep">
			        	<div class="tab-body">
			        		<div class="row">
					            <cms:CMSRepeater ID="CMSRepeater4" runat="server" ClassNames="MFS.Colaborador" SelectOnlyPublished="True" OrderBy="Nombre" 
                                    Columns="Nombre, Puesto, Email, Foto" Path="/Programa-MFS/Comite/Equipo-Peru/%" >
                                    <ItemTemplate>
                                        <div class="item-person text-center-min">
			        					    <img src="<%# ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + Eval("Foto")) %>" alt="<%# Eval("Nombre") %>" class="img-responsive">
			        					    <div class="mt-10"><strong>Nombre</strong></div>
			        					    <div><%# Eval("Nombre") %></div>
			        					    <div><strong>Puesto</strong></div>
			        					    <div><%# Eval("Puesto") %></div>
			        					    <div><strong>Correo Electrónico</strong></div>
			        					    <a href="#" class="tnormal"><%# Eval("Email") %></a>
			        				    </div>
                                    </ItemTemplate>
                                </cms:CMSRepeater>
			        		</div>
			        	</div>
			        </div>
			    </div>
			</div>
		</div>
        
		<div class="text-center-min">
			<h5 class="title-default">También conoce sobre:</h5>
			<div class="mt-20">
				<p>
					<a href="<%= ResolveUrl("~/Programa-MFS.aspx") %>" class="link-more">El programa MFS <i class="fa fa-chevron-right"></i></a>
				</p>
				<br>
			</div>
		</div>
	</div>
</section>
</asp:Content>