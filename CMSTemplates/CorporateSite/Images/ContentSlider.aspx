<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="ContentSlider.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_Images_ContentSlider"
    ValidateRequest="false" %>


<%@ Register Src="~/CMSWebParts/Viewers/Effects/ContentSlider.ascx" TagName="ContentSlider"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc2" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
        <uc2:breadcrumbs runat="server" ID="breadcrumbs" EnableViewState="false" />
    </cms:WebPartContainer>
    <br />
    <div class="photoGalleryContainer">
        <div class="photoGallery">
            <uc1:ContentSlider runat="server" ID="ContentSlider" Path="/Images/Czech-Republic/%"
                ClassNames="CMS.File" TransformationName="CMS.File.imagegallery_detail500" DivWidth="650"
                DivHeight="350" DivStyle="text-align: center;" JsAutoStart="true" EnableViewState="false" />
        </div>
    </div>
</asp:Content>
