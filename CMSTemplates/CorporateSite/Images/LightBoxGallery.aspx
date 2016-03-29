<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="LightBoxGallery.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_Images_LightBoxGallery"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Viewers/Effects/lightbox.ascx" TagName="lightbox" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc2" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="lightBoxGallery">
        <cms:WebPartContainer ID="WebPartContainer1" runat="server" ContainerName="Box.Gray">
            <uc2:breadcrumbs runat="server" ID="breadcrumbs1" EnableViewState="false" />
        </cms:WebPartContainer>
        <br />
        <div class="photoGalleryContainer">
            <div class="photoGallery">
                <uc1:lightbox runat="server" ID="LightboxImageGallery" ClassNames="CMS.File" TransformationName="CMS.File.lightbox"
                    SelectedItemTransformationName="CMS.File.imagegallery_detail800" EnablePaging="True"
                    PagingMode="querystring" PagerPosition="bottom" PageSize="12" LightBoxOverlayOpacity="0.7" EnableViewState="false" />
            </div>
        </div>
    </div>
</asp:Content>
