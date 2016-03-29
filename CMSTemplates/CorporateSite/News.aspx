<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="News.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_News" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="repeater"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Attachments/AttachmentLightBoxGallery.ascx" TagName="lightboxgallery"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Syndication/Documents/CMSRSSFeed.ascx" TagName="RSSFeed"
    TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="newsSummary">
        <cms:WebPartContainer ID="wpcBreadCrumbs" runat="server" ContainerName="Box.Gray">
            <uc1:breadcrumbs runat="server" ID="BreadCrumbs" ShowForDocumentTypes="CMS.News"
                EnableViewState="false" />
        </cms:WebPartContainer>
        <h1>
            <cms:CMSEditableRegion runat="server" ID="HeaderText" RegionTitle="Header text" RegionType="TextBox" />
        </h1>
        <asp:Panel ID="pnlNews" runat="Server">
            <cms:CMSEditableRegion runat="server" ID="ContentText" RegionType="HtmlEditor" />
        </asp:Panel>
        <uc1:repeater runat="server" ID="NewsRepeater" ClassNames="CMS.News" OrderBy="NewsReleaseDate DESC"
            TransformationName="CMS.News.NewsWithSummary" SelectedItemTransformationName="CMS.News.NewsDetail"
            PagingMode="querystring" PagerPosition="bottom" ResultsPosition="top" RelationshipWithNodeGUID="00000000-0000-0000-0000-000000000000"
            RelationshipName="isrelatedto" ShowNewButton="True" NewButtonText="Add news&lt;br /&gt;"
            ShowEditDeleteButtons="True" EnableViewState="false" />
        <div style="padding: 15px;">
            <uc1:lightboxgallery runat="server" ID="LightboxGallery" OrderBy="AttachmentOrder, AttachmentName"
                ShowForDocumentTypes="Cms.News" TransformationName="CMS.Root.AttachmentLightbox"
                SelectedItemTransformationName="CMS.Root.AttachmentLightboxDetail" EnableViewState="false" />
        </div>
        <div style="padding: 10px 0">
            <uc1:RSSFeed runat="server" ID="RSSFeed" Path="/News/%" ClassNames="cms.news"
                TransformationName="cms.news.rssitem" EnableViewState="false" FeedTitle="Latest news"
                FeedDescription="Latest news feed" OrderBy="NewsReleaseDate DESC" LinkText="RSS"
                QueryStringKey="rss" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                FeedName="news" EnableRSSAutodiscovery="true" />
        </div>
    </div>
</asp:Content>
