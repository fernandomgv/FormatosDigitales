<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="FullTextSearch.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_FullTextSearch"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Search/cmssearchbox.ascx" TagName="cmssearchbox"
    TagPrefix="uc2" %>
<%@ Register Src="~/CMSWebParts/Search/cmssearchdialog.ascx" TagName="cmssearchdialog"
    TagPrefix="uc3" %>
<%@ Register Src="~/CMSWebParts/Search/cmssearchresults.ascx" TagName="cmssearchresults"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Search/cmscompletesearchdialog.ascx" TagName="cmscompletesearchdialog"
    TagPrefix="uc5" %>
<%@ Register Src="~/CMSWebParts/Search/cmssearchresults.ascx" TagName="cmssearchresults"
    TagPrefix="uc6" %>
<%@ Register Src="~/CMSWebParts/Search/DidYouMean.ascx" TagName="DidYouMean" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/SmartSearch/searchbox.ascx" TagName="searchbox" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/SmartSearch/searchdialog.ascx" TagName="searchdialog"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/SmartSearch/searchdialogwithresults.ascx" TagName="searchdialogwithresults"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/SmartSearch/searchfilter.ascx" TagName="searchfilter"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/SmartSearch/searchresults.ascx" TagName="searchresults"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="textPlaceholderLeftMenu">
        <!-- Left zone -->
        <div class="zoneLeft largeLeftContent" style="float: left;">
            <uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" CellPadding="0" CellSpacing="0"
                DisplayHighlightedItemAsLink="true" HighlightAllItemsInPath="true" Indentation="3"
                ApplyMenuDesign="true" WordWrap="true" RenderImageAlt="true" />
        </div>
        <!-- Content -->
        <div class="zoneContent forumsExample" style="float: right;">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <uc1:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content">
                <asp:PlaceHolder ID="plcSearchBox" runat="server" Visible="false">
                    <cms:LocalizedLabel ID="lblSearchResult" Visible="false" runat="server"></cms:LocalizedLabel>
                    <uc2:cmssearchbox ID="Cmssearchbox1" runat="server" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcSearchResults">
                    <uc4:cmssearchresults ID="Cmssearchresults1" Path="/%" runat="server" TransformationName="CMS.Root.searchresults" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSearchDialog" runat="server" Visible="false">
                    <uc3:cmssearchdialog ID="Cmssearchdialog1" runat="server" SearchScopeLabel="Search scope:" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSearchDialogWithResults" runat="server" Visible="false">
                    <uc5:cmscompletesearchdialog ID="Cmscompletesearchdialog1" Path="/%" runat="server"
                        TransformationName="CMS.Root.searchresults" SearchScopeLabel="Search scope:" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSmartSearchBox" runat="server" Visible="false">
                    <cms:LocalizedLabel ID="lblSmartSearchResult" Visible="false" runat="server"></cms:LocalizedLabel>
                    <cms:searchbox ID="srchBox" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcSmartSearchDialog" Visible="false">
                    <cms:searchdialog ID="srchDialog" runat="server" />
                    <div style="padding: 10px">
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSmartFilter" runat="server" Visible="false">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <span>Filter product type:</span>
                                <cms:searchfilter runat="server" ID="srchFilter" DefaultSelectedIndex="0" />
                            </td>
                            <td>
                                <span>Sort by:</span><br />
                                <cms:searchfilter runat="server" ID="srchSortFilter" />
                            </td>
                        </tr>
                    </table>
                    <span>Product added:</span><br />
                    <cms:searchfilter runat="server" ID="srchDateFilter" DefaultSelectedIndex="0" />
                    <div style="padding: 10px">
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcDidYouMean" runat="server" Visible="false">
                    <cms:DidYouMean ID="DidYouMean" runat="server" EnableViewState="false" />
                    <br />
                </asp:PlaceHolder>                
                <asp:PlaceHolder ID="plcSmartSearchResults" runat="server" Visible="false">
                    <cms:searchresults ID="srchResults" runat="server" Indexes="CorporateSiteASPX.default;"
                        TransformationName="CMS.Root.SmartSearchResults" NoResultsText="No results were found." EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSmartSearchDialogWithResults" runat="server" Visible="false">
                    <cms:searchdialogwithresults runat="server" ID="srchDialogWithResults" Indexes="CorporateSiteASPX.default;"
                        TransformationName="CMS.Root.SmartSearchResults" PagesTemplate="CMS.PagerTransformations.General-Pages" NoResultsText="No results were found." />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
