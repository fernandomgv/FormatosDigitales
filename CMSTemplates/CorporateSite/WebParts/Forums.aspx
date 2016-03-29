<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Forums.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Forums"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Forums/ForumGroup.ascx" TagName="ForumGroup" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/Search/ForumSearch.ascx" TagName="ForumSearch" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/Search/ForumSearchResults.ascx" TagName="ForumSearchResults"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumForum.ascx" TagName="ForumTree" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumForum.ascx" TagName="ForumFlat" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumUnsubscription.ascx" TagName="ForumUnsubscription"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/Search/ForumExtendedSearchDialog.ascx" TagName="ForumExtendedSearchDialog"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumFavorites.ascx" TagName="ForumFavorites"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumPostsViewer.ascx" TagName="ForumPostsViewer"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumMostActiveThreads.ascx" TagName="ForumMostActiveThreads"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumRecentlyActiveThreads.ascx" TagName="ForumRecentlyActiveThreads"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumTopContributors.ascx" TagName="ForumTopContributors"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumBreadcrumbs.ascx" TagName="ForumBreadcrumbs"
    TagPrefix="cms" %>
<%@ Register src="~/CMSWebParts/SmartSearch/SearchDialogWithResults.ascx" tagname="SearchDialogWithResults" tagprefix="cms" %>
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
        <div class="zoneContent forumsExample" style="float: right;">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <cms:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content">
                <asp:PlaceHolder ID="plcFlat" runat="server" Visible="false">
                    <cms:ForumFlat ID="ForumFlat1" runat="server" ForumLayout="Flat" ForumName="CorporateSiteASPX.Announcements" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcTree" runat="server" Visible="false">
                    <cms:ForumTree runat="server" ID="ForumTree" ForumLayout="Tree" ForumName="corporatesiteaspx.techsupport"
                        EnableFavorites="true" ShowMode="treemode" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcGroup" runat="server" Visible="false">
                    <cms:ForumGroup ID="ForumGroup" runat="server"
                        EnablePaging="true" PageSize="10" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSearch" runat="server" Visible="false">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                Search forums:&nbsp;
                            </td>
                            <td>
                                <cms:ForumSearch ID="ForumSearch" runat="server" RedirectUrl="~/Examples/Webparts/Forums/Forum-search-results.aspx" EnableViewState="false" />
                            </td>
                        </tr>
                    </table>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSearchResults" runat="server" Visible="false">The <strong>Forum
                    search results</strong> web part displays search result according to forum search
                    webpart. Search result is displayed as a list of forum posts with links to threads.<br />
                    <cms:ForumSearchResults ID="ForumSearchResults" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcUnsubscription" runat="server" Visible="false">The <strong>Forum
                    unsubscription</strong> web part displays unsubscribe user from forum thread according
                    query parameter with GUID value.<br />
                    <cms:ForumUnsubscription ID="ForumUnsubscription" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcExtendedSearchDialog" runat="server" Visible="false">
                    <cms:ForumExtendedSearchDialog runat="server" ID="ForumExtendedSearchDialog" RedirectUrl="~/Examples/Webparts/Forums/Forum-search-results.aspx" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcFavorites" runat="server" Visible="false">
                    <cms:WebPartContainer runat="server" ContainerTitle="My favorites" ContainerName="BlackBox">
                        <cms:ForumFavorites runat="server" ID="ForumFavorites" HideControlForZeroRows="false"
                            ZeroRowsText="No favorites found" EnableViewState="false" />
                    </cms:WebPartContainer>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMostActiveThreads" runat="server" Visible="false"><strong>Forum
                    most active threads </strong>webpart displays TOP N most active threads of specified
                    forum groups.<br />
                    <br />
                    <cms:WebPartContainer ID="WebPartContainer1" runat="server" ContainerTitle="Most active threads"
                        ContainerName="BlackBox">
                        <cms:ForumMostActiveThreads runat="server" ID="ForumMostActiveThreads" TransformationName="Community.Transformations.ForumMostActiveThread"
                            SelectTopN="10" HideControlForZeroRows="true" EnableViewState="false" />
                    </cms:WebPartContainer>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcRecentlyActiveThreads" runat="server" Visible="false"><strong>
                    Forum recently updated threads webpart</strong> displays TOP N latest posts of the
                    specified forum groups.<br />
                    <br />
                    <cms:WebPartContainer ID="WebPartContainer2" runat="server" ContainerTitle="Recently updated threads"
                        ContainerName="BlackBox">
                        <cms:ForumRecentlyActiveThreads runat="server" ID="ForumRecentlyActiveThreads" TransformationName="Community.Transformations.ForumLatestPosts"
                            SelectTopN="10" ZeroRowsText="No post found." EnableViewState="false" />
                    </cms:WebPartContainer>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcTopContributors" runat="server" Visible="false"><strong>Forum
                    top contributors</strong> webpart displays TOP N most active contributor in forums.<br />
                    <br />
                    <cms:WebPartContainer runat="server" ContainerTitle="Top contributors" ContainerName="BlackBox">
                        <cms:ForumTopContributors runat="server" ID="ForumTopContributors" TransformationName="Community.Transformations.ForumTopContributors"
                            SelectTopN="10" HideControlForZeroRows="true" EnableViewState="false" />
                    </cms:WebPartContainer>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcPostsViewer" runat="server" Visible="false">
                    <cms:ForumPostsViewer runat="server" ID="ForumPostsViewer" TransformationName="Community.Transformations.ForumPostsList"
                        SelectOnlyApproved="true" SelectTopN="3" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcForumBreadcrumbs" runat="server" Visible="false">
                    <div style="padding:7px;margin-top:10px;margin-bottom: 10px; background-color:#eeeeee">
                        <cms:ForumBreadcrumbs runat="server" ID="ForumBreadcrumbs1" DisplayGroup="false" BreadcrumbPrefix="" HideBreadcrumbsOnForumGroupPage="true" EnableViewState="false" />
                    </div>
                    <cms:ForumGroup ID="ForumGroup1" runat="server" EnablePaging="true" PageSize="10" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcForumSmartSearch" Visible="false">
                    This is an example of smart search with forum index. You can also combine forum index with all others index types.
                    <br />
                    <br />
                    <cms:SearchDialogWithResults ID="SearchDialogWithResults1" runat="server" Indexes="CorporateSiteASPX.Forums" TransformationName="CMS.Root.SmartSearchResultsWithImages" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
