<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_Blog" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="repeater" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Blogs/RecentPosts.ascx" TagName="RecentPosts" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Blogs/PostArchive.ascx" TagName="PostArchive" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Blogs/BlogCommentView.ascx" TagName="CommentView"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/TaggingCategories/TagCloud.ascx" TagName="tagcloud"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Syndication/Documents/CMSRSSFeed.ascx" TagName="RSSFeed" TagPrefix="uc1" %> 
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="blogDetail">
        <!-- Top zone -->
        <div class="zoneTop">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <uc1:breadcrumbs runat="server" ID="breadcrumbs" ClassNames="cms.blog;cms.blogmonth;cms.blogpost;CMS.MenuItem" EnableViewState="false" />
            </cms:WebPartContainer>
        </div>
        <!-- Left zone -->
        <div class="zoneLeft" style="float: left;">
            <uc1:repeater runat="server" ID="rptMonthPosts" ShowForDocumentTypes="cms.blogmonth"
                Path="./%" ClassNames="cms.blogpost" OrderBy="BlogPostDate DESC" TransformationName="cms.blog.PostPreview"
                EnablePaging="True" PagingMode="querystring" PagerPosition="bottom" PageSize="5"
                ResultsPosition="top" EnableViewState="false" />
            <uc1:repeater runat="server" ID="rptAllPosts" ShowForDocumentTypes="cms.blog;cms.blogpost"
                ClassNames="cms.blogpost" OrderBy="BlogPostDate DESC" SelectTopN="5" TransformationName="cms.blog.PostPreview"
                SelectedItemTransformationName="cms.blogpost.Default" PagingMode="querystring"
                PagerPosition="bottom" ResultsPosition="top" EnableViewState="false" />
            <div class="comments">
                <uc1:CommentView runat="server" ID="CommentView" ShowForDocumentTypes="cms.blogpost"
                    CheckPermissions="False" ShowDeleteButton="true" ShowEditButton="true" DisplayTrackbacks="true" EnableViewState="false" />
            </div>
        </div>
        <!-- Right zone -->
        <div class="zoneRight" style="float: right;">
            <cms:WebPartContainer ID="wpcrptBlogDescription" runat="server" ContainerName="BlackBox"
                ContainerTitle="Title">
                <uc1:repeater runat="server" ID="rptBlogDescription" ShowForDocumentTypes="cms.blog;cms.blogmonth;cms.blogpost"
                    Path="/%" ClassNames="cms.blog" OrderBy="NodeLevel DESC" SelectTopN="1" TransformationName="cms.blog.Description"
                    PagingMode="querystring" PagerPosition="bottom" ResultsPosition="top" HideControlForZeroRows="False" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcTagCloud" runat="server" ContainerName="BlackBox"
                ContainerTitle="Tags">
                <uc1:tagcloud runat="server" ID="tagCloud" TagGroupName="MyBlog" EnableViewState="false" DocumentListURL="/Blogs/My-blog-1" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcrptSideColumn" runat="server" ContainerName="BlackBox"
                ContainerTitle="My favorite websites">
                <uc1:repeater runat="server" ID="rptSideColumn" ShowForDocumentTypes="cms.blog;cms.blogmonth;cms.blogpost"
                    Path="/%" ClassNames="cms.blog" OrderBy="NodeLevel DESC" SelectTopN="1" TransformationName="cms.blog.SideColumn"
                    PagingMode="querystring" PagerPosition="bottom" ResultsPosition="top" HideControlForZeroRows="False" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcRecentPosts" runat="server" ContainerName="BlackBox"
                ContainerTitle="Recent posts">
                <uc1:RecentPosts runat="server" ID="RecentPosts" ShowForDocumentTypes="cms.blog;cms.blogmonth;cms.blogpost"
                    PathToRecentPosts="/%" TransformationName="cms.blogpost.RecentPosts" SelectTopN="5"
                    HideControlForZeroRows="False" ZeroRowsText="No recent posts" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcrptSyndication" runat="server" ContainerName="BlackBox"
                ContainerTitle="Syndication">
                <uc1:RSSFeed runat="server" ID="RSSFeed"
                    Path="/Blogs/{1}/%" ClassNames="cms.blogpost" TransformationName="cms.blogpost.rssitem" EnableViewState="false"
                    FeedTitle="Blog posts" FeedDescription="Blog posts feed" OrderBy="BlogPostDate DESC" LinkText="RSS" QueryStringKey="rss"
                    LinkIcon="~/App_Themes/Default/Images/Design/Controls/IconSelector/RSS/01_Orange/16.png" FeedName="blogs" EnableRSSAutodiscovery="true" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcPostArchive" runat="server" ContainerName="BlackBox"
                ContainerTitle="Post archive">
                <uc1:PostArchive runat="server" ID="PostArchive" ShowForDocumentTypes="cms.blog;cms.blogmonth;cms.blogpost"
                    TransformationName="cms.blogpost.Archive" HideControlForZeroRows="False" ZeroRowsText="No data in archive" EnableViewState="false" />
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
