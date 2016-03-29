<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="TaggingCategories.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_TaggingCategories"
    ValidateRequest="false" Theme="CorporateSite" %>

<%@ Register Src="~/CMSWebParts/TaggingCategories/tagcloud.ascx" TagName="tagcloud"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/TaggingCategories/categorylist.ascx" TagName="categorylist"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="repeater" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
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
                <asp:PlaceHolder ID="plcWelcome" runat="server" Visible="false">
                    <cms:LocalizedLabel ID="lblWelcomeText" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcTagCloud" runat="server" Visible="false">
                    <table width="100%">
                        <tr>
                            <td style="text-align: justify; padding-right: 10px; vertical-align: top;">
                                <h2>
                                    Articles</h2>
                                <uc1:repeater ID="tagArticles" runat="server" ClassNames="cms.article" Path="/Examples/WebParts/Tagging---Categories/Tag-cloud/%"
                                    TransformationName="Community.Transformations.DocumentList" SelectedItemTransformationName="CMS.Article.Default"
                                    HideControlForZeroRows="true" OrderBy="DocumentName" EnableViewState="false" />
                                <br />
                                <h2>Products</h2>
                                <uc1:repeater ID="tagProducts" runat="server" ClassNames="CMS.Laptop;CMS.CellPhone;CMS.Pda"
                                    Path="/Products/%" TransformationName="Community.Transformations.DocumentList"
                                    SelectedItemTransformationName="{%classname%}.Default" HideControlForZeroRows="true"
                                    OrderBy="DocumentName" EnableViewState="false" />
                            </td>
                            <td style="width: 40%; vertical-align: top;">
                                <cms:WebPartContainer ID="wpcTagCloudArticles" runat="server" ContainerName="BlackBox"
                                    ContainerTitle="Tag cloud - Articles">
                                    <uc1:tagcloud runat="server" ID="tagcloudarticles" TagGroupName="Content" AliasPath="/Examples/Webparts/Tagging---Categories/Tag-cloud/%"
                                        MinTagSize="10" MaxTagSize="20" Visible="false" QueryStringName="tagid" ShowForDocumentTypes="CMS.MenuItem" EnableViewState="false" />
                                </cms:WebPartContainer>
                                <cms:WebPartContainer ID="wpcTagCloudProducts" runat="server" ContainerName="BlackBox"
                                    ContainerTitle="Tag cloud - Products">
                                    <uc1:tagcloud runat="server" ID="tagcloudproducts" TagGroupName="Products" AliasPath="/Products/%"
                                        MinTagSize="10" MaxTagSize="20" Visible="false" QueryStringName="tagid" ShowForDocumentTypes="CMS.MenuItem" EnableViewState="false" />
                                </cms:WebPartContainer>
                            </td>
                        </tr>
                    </table>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcCategoryList" runat="server" Visible="false">
                    <table width="100%">
                        <tr>
                            <td style="text-align: justify; padding-right: 10px; vertical-align: top;">
                                <uc1:repeater ID="categoryArticles" runat="server" ClassNames="cms.article" Path="/Examples/WebParts/Tagging---Categories/Category-list/%"
                                    TransformationName="CMS.Article.SimplePreview" SelectedItemTransformationName="CMS.Article.Default" EnableViewState="false" />
                            </td>
                            <td style="width: 40%; vertical-align: top;">
                                <cms:WebPartContainer ID="wpcCategoryList" runat="server" ContainerName="BlackBox"
                                    ContainerTitle="Categories">
                                    <uc1:categorylist runat="server" ID="categorylist" TransformationName="community.transformations.CategoryList"
                                        ShowForDocumentTypes="CMS.MenuItem" AliasPath="/Examples/Webparts/Tagging---Categories/Category-list/%" EnableViewState="false" />
                                </cms:WebPartContainer>
                            </td>
                        </tr>
                    </table>
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
