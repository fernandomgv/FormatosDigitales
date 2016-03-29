<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Blogs.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Blogs" %>

<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Blogs/BlogPostUnsubscription.ascx" TagName="BlogPostUnsubscription"
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
                <div style="padding: 20px;">
                    <asp:PlaceHolder ID="plcBlogs" runat="server" Visible="false">
                        <uc1:BlogPostUnsubscription ID="cntBlogPostUnsubscription" runat="server" Visible="false" EnableViewState="false" />
                    </asp:PlaceHolder>
                </div>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
