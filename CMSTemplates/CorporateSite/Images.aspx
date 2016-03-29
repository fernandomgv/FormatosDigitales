<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Images.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_Images" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>


<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="galleriesList">
        <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
            <uc1:breadcrumbs runat="server" ID="breadcrumbs" EnableViewState="false" />
        </cms:WebPartContainer>
        <br />
        <div class="photoGalleryContainer">
            <div class="photoGallery">
                <cms:CMSRepeater runat="server" ID="ListOfGalleries"  Path="/Images/%"
                    ClassNames="CMS.MenuItem" TransformationName="CMS.MenuItem.ImageGalleryList" />
                <br class="clear" />
            </div>
        </div>
        <br />
        <div class="photoGalleryContainer">
            <div class="photoGallery">
                <%--CONTENT--%>
            </div>
            <br class="clear" />
        </div>
    </div>
</asp:Content>
