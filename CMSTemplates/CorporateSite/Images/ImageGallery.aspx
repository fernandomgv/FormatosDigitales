<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="ImageGallery.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_Images_ImageGallery"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Viewers/Documents/imagegallery.ascx" TagName="ImageGallery"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc2" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="imageGallery">
        <cms:WebPartContainer ID="WebPartContainer1" runat="server" ContainerName="Box.Gray">
            <uc2:breadcrumbs runat="server" ID="breadcrumbs1" EnableViewState="false" />
        </cms:WebPartContainer>
        <br />
        <div class="photoGalleryContainer">
            <div class="photoGallery">
                <uc1:ImageGallery runat="server" ID="ImageGallery" DetailTransformation="CMS.File.imagegallery_detail600"
                    ThumbnailTransformation="CMS.File.imagegallery_thumbnails180" RowsPerPage="2"
                    Columns="3" PagingMode="querystring" EnableViewState="false" />
            </div>
        </div>
    </div>
</asp:Content>
