<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Text.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Text"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Text/pagedtext.ascx" TagName="pagedtext" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Text/staticHTML.ascx" TagName="statichtml" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Text/statictext.ascx" TagName="statictext" TagPrefix="uc1" %>
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
                <asp:PlaceHolder ID="plcEditableText" runat="server" Visible="false">
                    <h2>HTML editor</h2>
                    <cms:CMSEditableRegion ID="regionHTML" runat="server" RegionType="HtmlEditor" DialogHeight="200" RegionTitle="HTML editor" EnableViewState="false" />
                    <h2>Text box</h2>
                    <cms:CMSEditableRegion ID="regionTextbox" runat="server" RegionType="TextBox" RegionTitle="Text box" EnableViewState="false" />
                    <h2>Text area</h2>
                    <cms:CMSEditableRegion ID="regionTextArea" runat="server" RegionType="TextArea" RegionTitle="Text area" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcEditableImage" runat="server" Visible="false">
                    <cms:CMSEditableImage ID="EditableImage1" AlternateText="EditableImage" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcPagedText" runat="server" Visible="false">
                    <uc1:pagedtext runat="server" ID="PagedText1" Path="/Examples/Webparts/Text/Paged-text/Simple-article"
                        ColumnName="ArticleText" PagingMode="querystring" PagerPosition="bottom" PageSize="100"
                        PagerFormat="Page {0} of {2}" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcStaticHTML" runat="server" Visible="false">
                    <uc1:statichtml ID="StaticHTML1" runat="server" Text="<strong>This text is displayed using Static HTML webpart</strong>" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcStaticText" runat="server" Visible="false">
                    <uc1:statictext ID="StaticText1" runat="server" Text="Static text inserted using Static text webpart." EnableViewState="false" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
