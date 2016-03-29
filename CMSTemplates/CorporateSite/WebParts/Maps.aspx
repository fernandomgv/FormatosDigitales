<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Maps.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Maps"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Maps/GoogleMaps.ascx" TagName="GoogleMaps" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Maps/BingMaps.ascx" TagName="BingMaps" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Maps/YahooMaps.ascx" TagName="YahooMaps" TagPrefix="cms" %>
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
                <asp:PlaceHolder ID="plcGoogleMaps" runat="server" Visible="false">
                    <cms:GoogleMaps runat="server" ID="GoogleMaps" Path="/%" ClassNames="cms.office"
                        TransformationName="cms.office.preview" Scale="2" ZoomScale="5" Latitude="51"
                        Longitude="-30" LatitudeField="OfficeLatitude" LongitudeField="OfficeLongitude"
                        EnableViewState="false" ToolTipField="OfficeName" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcBingMaps" runat="server" Visible="false">
                    <cms:BingMaps runat="server" ID="BingMaps" Path="/%" ClassNames="cms.office" TransformationName="cms.office.preview"
                        Scale="2" ZoomScale="5" Latitude="51" Longitude="-30" LatitudeField="OfficeLatitude"
                        LongitudeField="OfficeLongitude" EnableViewState="false" ToolTipField="OfficeName" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcYahooMaps" runat="server" Visible="false">
                    <cms:YahooMaps runat="server" ID="YahooMaps" Path="/%" ClassNames="cms.office" TransformationName="cms.office.preview"
                        Scale="16" ZoomScale="10" Latitude="51" Longitude="-30" LatitudeField="OfficeLatitude"
                        LongitudeField="OfficeLongitude" EnableViewState="false" ToolTipField="OfficeName" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
