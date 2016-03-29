<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Syndication.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Syndication"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="cmsrepeater"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Viewers/Effects/ScrollingText.ascx" TagName="ScrollingText"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Syndication/Basic/RSSFeed.ascx" TagName="RSSFeed"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Syndication/Basic/RSSRepeater.ascx" TagName="RSSRepeater"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/MediaLibrary/Syndication/MediaRSSFeed.ascx" TagName="MediaFilesRSSFeed"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/MessageBoards/Syndication/MessageBoardRSSFeed.ascx"
    TagName="MessageBoardRSSFeed" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Syndication/Documents/CMSRSSFeed.ascx" TagName="CMSRSSFeed"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Syndication/Basic/XMLRepeater.ascx" TagName="XMLRepeater"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Syndication/Basic/AtomRepeater.ascx" TagName="AtomRepeater"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Syndication/Basic/AtomFeed.ascx" TagName="AtomFeed"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Blogs/Syndication/BlogCommentsRSSFeed.ascx" TagName="BlogCommentsRSSFeed"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/Syndication/ForumPostsRSSFeed.ascx" TagName="ForumPostsRSSFeed"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Ecommerce/Syndication/ProductsRSSFeed.ascx" TagName="ProductsRSSFeed"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Syndication/QueryRSSFeed.ascx" TagName="QueryRSSFeed"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Syndication/CustomTableRSSFeed.ascx" TagName="CustomTableRSSFeed"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Syndication/FeedLink.ascx" TagName="FeedLink" TagPrefix="cms" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="textPlaceholderLeftMenu">
        <!-- Left zone -->
        <div class="zoneLeft" style="float: left;">
            <cms:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" CellPadding="0" CellSpacing="0"
                DisplayHighlightedItemAsLink="true" HighlightAllItemsInPath="true" Indentation="3"
                ApplyMenuDesign="true" WordWrap="true" RenderImageAlt="true" EnableViewState="false" />
        </div>
        <!-- Content -->
        <div class="zoneContent" style="float: right;">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <cms:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content">
                <asp:PlaceHolder runat="server" ID="plcNewsDataSource" Visible="false">
                    <cms:CMSDocumentsDataSource EnableViewState="false" Path="/News/%" ID="DocumentsDataSource"
                        runat="server" ClassNames="CMS.News" OrderBy="NewsReleaseDate DESC" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcRssFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:RSSFeed ID="RSSFeed" runat="server" EnableViewState="false" FeedName="news"
                        FeedTitle="News" FeedDescription="Sample news feed" TransformationName="CMS.News.RssItem"
                        LinkText="RSS 2.0" EnableRSSAutodiscovery="true" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCMSRssFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextCMSRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:CMSRSSFeed ID="CMSRSSFeed" runat="server" Path="/News/%" ClassNames="CMS.News"
                        FeedName="news" FeedTitle="News" FeedDescription="Sample news feed" LinkText="RSS 2.0"
                        EnableRSSAutodiscovery="true" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        TransformationName="CMS.News.RssItem" OrderBy="NewsReleaseDate DESC" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcBlogPostsRssFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextBlogPostsRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:CMSRSSFeed ID="BlogPostsRSSFeed" runat="server" Path="/Blogs/%" TransformationName="cms.blogpost.rssitem"
                        ClassNames="cms.blogpost" FeedName="blogs" FeedTitle="Blog posts" FeedDescription="Sample blog posts feed"
                        LinkText="Blog posts" EnableRSSAutodiscovery="true" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        OrderBy="BlogPostDate DESC" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcNewsRssFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextNewsRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:CMSRSSFeed ID="NewsRssFeed" runat="server" Path="/News/%" ClassNames="CMS.News"
                        FeedName="news" FeedTitle="News" FeedDescription="Sample news feed" LinkText="Latest news"
                        EnableRSSAutodiscovery="true" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        TransformationName="CMS.News.RssItem" OrderBy="NewsReleaseDate DESC" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcEventsRssFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextEventsRssFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:CMSRSSFeed ID="EventsRssFeed" runat="server" Path="/Events/%" ClassNames="cms.bookingevent"
                        FeedName="event" FeedTitle="Events" FeedDescription="Sample events feed" LinkText="Upcoming events"
                        EnableRSSAutodiscovery="true" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        TransformationName="cms.bookingevent.rssitem" OrderBy="EventDate DESC" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcLinkFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextLinkFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <br />
                    <cms:FeedLink ID="feedLink" runat="server" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        EnableAutodiscovery="true" ContentType="application/rss+xml" FeedURL="~/Examples/Webparts/Syndication/RSS-repeater.aspx"
                        FeedTitle="News" LinkText="Latest news" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcXMLRepeater" Visible="false">
                    <cms:XMLRepeater ID="XMLRepeater" runat="server" EnableViewState="false" TransformationName="CMS.News.XMLItem"
                        HeaderXML="<News>" FooterXML="</News>" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcAtomRepeater" Visible="false">
                    <cms:AtomRepeater ID="AtomRepeater" runat="server" EnableViewState="false" TransformationName="CMS.News.AtomItem"
                        FeedTitle="Latest news" FeedSubtitle="This web part always generates Atom feed. It can be used for special pages to provide Atom feed.
                        This particular example shows News Atom feed." FeedUpdated="3/9/2010 10:00:00" FeedAuthorName="Administrator"
                        FeedGUID="2cc550fa-6d07-46cd-ad4b-aa04f48ef050" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcAtomFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextAtomFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:AtomFeed ID="AtomFeed" runat="server" EnableViewState="false" FeedTitle="Latest news"
                        FeedSubtitle="Sample news feed" TransformationName="CMS.News.AtomItem" EnableRSSAutodiscovery="true"
                        LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/02_Blue/16.png"
                        LinkText="Atom 1.0" FeedUpdated="3/9/2010 10:00:00" FeedAuthorName="Administrator"
                        FeedName="news" FeedGUID="5b308bb8-0213-4a8d-9814-058d8df2d8e8" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcMediaFilesRSSFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextMediaFilesRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:MediaFilesRSSFeed ID="mediaRSSFeed" runat="server" FeedName="files" FeedTitle="Media files"
                        FeedDescription="Czech nature media library sample feed" LinkText="Media files"
                        EnableRSSAutodiscovery="true" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        TransformationName="cms.rsstransformations.mediafiles" OrderBy="FileCreatedWhen DESC"
                        LibraryName="CzechNature" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcBoardMessagesRSSFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextMessageBoardRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:MessageBoardRSSFeed ID="messageBoardRSSFeed" runat="server" FeedName="messages"
                        FeedTitle="Board messages" FeedDescription="Board messages sample feed" LinkText="Board messages"
                        EnableRSSAutodiscovery="true" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        TransformationName="cms.rsstransformations.boardmessages" OrderBy="MessageInserted DESC"
                        BoardName="MessageBoardASPX" UseDocumentFilter="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcRSSRepeater" Visible="false">
                    <cms:RSSRepeater ID="rssRepeater" runat="server" FeedName="news" FeedTitle="News"
                        FeedDescription="This web part always generates RSS feed. It can be used for special pages to provide RSS feed.
                        This particular example shows News RSS feed." EnableViewState="false" TransformationName="CMS.News.RssItem"
                        OrderBy="NewsReleaseDate DESC" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcBlogCommentsRSSFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextBlogCommentsRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:BlogCommentsRSSFeed ID="rssBlogComments" runat="server" FeedName="comments"
                        FeedTitle="Blog comments" FeedDescription="Sample blog comments feed" EnableViewState="false"
                        TransformationName="CMS.RSSTransformations.BlogComments" LinkText="Blog comments"
                        LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        UseDocumentFilter="true" Path="/Blogs/%" OrderBy="CommentDate DESC" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcArticlesRSSFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextArticlesRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:CMSRSSFeed ID="articlesRSSFeed" runat="server" Path="./%" TransformationName="cms.article.rssitem"
                        ClassNames="cms.article" FeedName="articles" FeedTitle="Articles" FeedDescription="Sample articles feed"
                        LinkText="Articles" EnableRSSAutodiscovery="true" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        OrderBy="DocumentCreatedWhen DESC" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcForumPosts" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextForumPostsRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:ForumPostsRSSFeed ID="forumPostsRSSFeed" runat="server" TransformationName="cms.rsstransformations.forumposts"
                        FeedName="posts" FeedTitle="Forum posts" FeedDescription="Sample forum posts feed"
                        LinkText="Forum posts" EnableRSSAutodiscovery="true" EnableViewState="false"
                        LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        OrderBy="PostTime DESC" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcProducts" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextProductsRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:ProductsRSSFeed ID="productsRSSFeed" runat="server" TransformationName="cms.rsstransformations.products"
                        FeedName="products" FeedTitle="Products" FeedDescription="Sample products feed"
                        LinkText="Products" EnableRSSAutodiscovery="true" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        OrderBy="SKUCreated DESC" UseDocumentFilter="true" Path="/Products/%" SelectOnlyPublished="true" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcQueryRSSFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextQueryRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:QueryRSSFeed ID="queryRSSFeed" runat="server" TransformationName="CMS.News.RSSItem"
                        FeedName="news" FeedTitle="News" FeedDescription="Sample news feed" LinkText="News"
                        EnableRSSAutodiscovery="true" EnableViewState="false" LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        OrderBy="NewsReleaseDate DESC" UseDocumentFilter="true" SelectOnlyPublished="true"
                        QueryName="CMS.News.selectdocuments" WhereCondition="SiteName='CorporateSiteASPX'" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCustomTableRSSFeed" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextCustomTableRSSFeed" RegionType="HtmlEditor"
                        RegionTitle="Description" />
                    <cms:CustomTableRSSFeed ID="customTableRSSFeed" runat="server" TransformationName="customtable.SampleTable.RSSItem"
                        FeedName="customtable" FeedTitle="Custom table data" FeedDescription="Sample custom table feed"
                        LinkText="Custom table data" EnableRSSAutodiscovery="true" EnableViewState="false"
                        LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png"
                        OrderBy="ItemCreatedWhen DESC" CustomTable="customtable.SampleTable" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
