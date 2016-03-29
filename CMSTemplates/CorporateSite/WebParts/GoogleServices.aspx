<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="GoogleServices.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_GoogleServices"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/GoogleServices/GoogleAnalytics.ascx" TagName="GoogleAnalytics"
    TagPrefix="uc1" %>
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
                <asp:PlaceHolder ID="plcGoogleAnalytics" runat="server" Visible="false">
                    <div>
                        This webpart can be used to easily turn on Google Analytics
                        service (which is an alternative to the Web Analytics module).<br />
                        To enable this webpart please edit this ASPX template and
                        locate the <strong>Google Analytics</strong> web part. Set
                        the <strong>Visible</strong> property to <strong>true</strong>,
                        set the <strong>TrackingCode</strong> property to a valid tracking
                        code provided by Google Analytics service 
                        (<a href="http://www.google.com/analytics/" target="_blank">Google Analytics website</a>)
                        and set the desired type of tracking. You can find more information
                        about this webpart in the on-line 
                        <a href="http://devnet.kentico.com/docs/webparts/KenticoCMS_WebParts.htm" target="_blank">Kentico CMS Web parts documentation</a>.
                    </div>
                    <uc1:GoogleAnalytics runat="server" ID="GoogleAnalytics1" Visible="false" TrackingCode="UA-XXXXXXX-Y" TrackingType="0" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
