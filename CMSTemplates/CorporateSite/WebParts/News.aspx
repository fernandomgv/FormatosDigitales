<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_News"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="cmsrepeater"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Viewers/Effects/ScrollingText.ascx" TagName="ScrollingText"
    TagPrefix="uc5" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>


<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="textPlaceholderLeftMenu">
        <!-- Left zone -->
        <div class="zoneLeft" style="float: left;">
            <uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" CellPadding="0" CellSpacing="0" DisplayHighlightedItemAsLink="true" HighlightAllItemsInPath="true" Indentation="3" ApplyMenuDesign="true" WordWrap="true" RenderImageAlt="true" EnableViewState="false" />
        </div>
        <!-- Content -->
        <div class="zoneContent" style="float: right;">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <uc1:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content">
                
                <asp:PlaceHolder runat="server" ID="plcLatestNews" Visible="false">
                    <uc4:cmsrepeater ID="Cmsrepeater1" runat="server" Path="/%" ClassNames="CMS.News" OrderBy="NewsReleaseDate DESC" SelectTopN="3" TransformationName="CMS.News.NewsPreviewWithSummary" SelectedItemTransformationName="CMS.News.NewsDetail" EnableViewState="false" />
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="plcNewsList" Visible="false">
                    <uc4:cmsrepeater ID="Cmsrepeater2" runat="server" Path="/%" ClassNames="CMS.News" OrderBy="NewsReleaseDate DESC" TransformationName="CMS.News.NewsWithSummary" SelectedItemTransformationName="CMS.News.NewsDetail" ShowNewButton="true" ShowEditDeleteButtons="true" NewButtonText="Add news<br />" EnableViewState="false" />
                </asp:PlaceHolder>
                
                <asp:PlaceHolder runat="server" ID="plcScrollingNews" Visible="false">
                    <uc5:ScrollingText ID="ScrollingText1" runat="server" ClassNames="CMS.News" Path="/%" TransformationName="cms.news.default" DivHeight="200" DivWidth="200" JsMoveTime="1000" JsStopTime="3000" OrderBy="NewsReleaseDate DESC" EnableViewState="false" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
