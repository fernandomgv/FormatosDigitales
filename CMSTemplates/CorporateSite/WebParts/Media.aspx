<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Media.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Media"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Media/Flash.ascx" TagName="Flash" TagPrefix="uc2" %>
<%@ Register Src="~/CMSWebParts/Media/QuickTime.ascx" TagName="QuickTime" TagPrefix="uc3" %>
<%@ Register Src="~/CMSWebParts/Media/RealMedia.ascx" TagName="RealMedia" TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Media/Video.ascx" TagName="Video" TagPrefix="uc5" %>
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
                <asp:PlaceHolder ID="plcBreadcrumbs" runat="server" Visible="false">
                    <uc1:breadcrumbs ID="Breadcrumbs1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcFlash" Visible="false">
                    <uc2:Flash runat="server" ID="Flash" FlashURL="http://www.kentico.com/downloads/demos/setup.swf"
                        Width="700" Height="600" Quality="best" Scale="default" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcVideo" Visible="false">
                    <uc5:Video runat="server" ID="Video" Autostart="true" AutoActivation="true" VideoURL="http://video.vdat.com/playfile.asp?brand=VN&amp;file=countdown_56.asf&amp;stream=w"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcQuickTime" Visible="false">
                    <uc3:QuickTime runat="server" ID="QuickTime" Autostart="true" AutoActivation="true"
                        VideoURL="http://www.americangirl.com/tips/mov/quicktime_works.mov" Width="240"
                        Height="200" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcRealMedia" Visible="false">
                    <uc4:RealMedia runat="server" ID="RealMedia" Autostart="true" AutoActivation="false"
                        Width="600" Height="400" VideoURL="http://service.real.com/learnnav/testrams/realvideo9_56.ram"
                        ControlsHeight="40" EnableViewState="false" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
