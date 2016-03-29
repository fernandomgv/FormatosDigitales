<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="MediaLibrary.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_MediaLibrary" %>

<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/MediaLibrary/MediaGallery.ascx" TagName="MediaGallery"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/MediaLibrary/MediaLibraryViewer.ascx" TagName="MediaLibraryViewer"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/MediaLibrary/MediaFileDataSource.ascx" TagName="MediaFileDataSource"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/MediaLibrary/MediaFileUploader.ascx" TagName="MediaFileUploader"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/MediaLibrary/MediaGalleryFilter.ascx" TagName="MediaGalleryFilter"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/MediaLibrary/MediaGalleryFileList.ascx" TagName="MediaGalleryFileList"
    TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/MediaLibrary/MediaGalleryFolderTree.ascx" TagName="MediaGalleryFolderTree"
    TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="textPlaceholderLeftMenu">
        <!-- Left zone -->
        <div class="zoneLeft" style="float: left;">
            <uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" CellPadding="0" CellSpacing="0"
                DisplayHighlightedItemAsLink="true" HighlightAllItemsInPath="true" Indentation="3"
                ApplyMenuDesign="true" WordWrap="true" RenderImageAlt="true" EnableViewState="false" />
        </div>
        <!-- Content -->
        <div class="zoneContent" style="float: right;">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <uc1:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content">
                <asp:PlaceHolder ID="plcMediaGallery" runat="server" Visible="false">
                    <uc1:MediaGallery ID="cntMediaGallery" runat="server" MediaLibraryName="CzechCities"
                        HideFolderTree="true" TransformationName="Community.Transformations.MediaLibrary"
                        SelectedItemTransformation="Community.Transformations.MediaLibrarySelectedItem"
                        SeparatorTransformation="Community.Transformations.MediaLibraryItemSeparator"
                        HeaderTransformation="Community.Transformations.MediaLibraryHeader" FooterTransformation="Community.Transformations.MediaLibraryFooter"
                        FilterMethod="0" FileIDQueryStringKey="fileid" PathQueryStringKey="path" SortQueryStringKey="sort"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMediaLibraryViewer" runat="server" Visible="false">
                    <uc1:MediaLibraryViewer ID="cntMediaLibraryViewer" runat="server" TransformationName="Community.Transformations.MediaLibraryList"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMediaTools" runat="server" Visible="false">
                    <uc1:MediaFileDataSource ID="cntMediaFileDataSource" runat="server" LibraryName="czechcities"
                        FilterName="cntMediaGalleryTree" FileIDQueryStringKey="fileid" EnableViewState="false" />
                    <uc1:MediaFileUploader ID="cntMediaFileUploader" runat="server" LibraryName="czechcities"
                        EnableViewState="false" />
                    <uc1:MediaGalleryFolderTree ID="cntMediaGalleryTree" runat="server" FilterName="cntMediaGalleryFilter"
                        FilterMethod="0" FileIDQueryStringKey="fileid" PathQueryStringKey="path" MediaLibraryName="czechcities" />
                    <div class="MediaContent">
                        <uc1:MediaGalleryFilter ID="cntMediaGalleryFilter" runat="server" FilterMethod="0"
                            FileIDQueryStringKey="fileid" SortQueryStringKey="sort" EnableViewState="false" />
                        <uc1:MediaGalleryFileList ID="cntMediaGalleryList" runat="server" DataSourceName="cntMediaFileDataSource"
                            MediaLibraryName="czechcities" TransformationName="Community.Transformations.MediaLibrary"
                            SelectedItemTransformationName="Community.Transformations.MediaLibrarySelectedItem"
                            SeparatorTransformationName="Community.Transformations.MediaLibraryItemSeparator"
                            HeaderTransformationName="Community.Transformations.MediaLibraryHeader" FooterTransformationName="Community.Transformations.MediaLibraryFooter"
                            FileIDQueryStringKey="fileid" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
