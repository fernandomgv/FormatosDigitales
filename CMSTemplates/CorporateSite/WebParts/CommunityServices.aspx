<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="CommunityServices.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_CommunityServices"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/CommunityServices/GoogleVideo.ascx" TagName="GoogleVideo"
    TagPrefix="uc2" %>
<%@ Register Src="~/CMSWebParts/CommunityServices/YouTubeVideo.ascx" TagName="YouTubeVideo"
    TagPrefix="uc3" %>
<%@ Register Src="~/CMSWebParts/CommunityServices/SocialBookmarking.ascx" TagName="SocialBookmarking"
    TagPrefix="uc4" %>
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
                <asp:PlaceHolder ID="plcYouTube" runat="server" Visible="false">
                    <uc3:YouTubeVideo ID="YouTubeVideo1" runat="server" VideoURL="http://www.youtube.com/watch?v=BHHvXeJd6TI"
                        Width="425" Height="355" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSocialBookmarking" runat="server" Visible="false"><span>Used
                    for bookmarking the current page by one of the many available social bookmarking
                    services.</span><br />
                    <uc4:SocialBookmarking ID="SocialBookmarking" runat="server" Delicious="true" Digg="true"
                        MySpace="true" FaceBook="true" YahooMyWeb="true" Live="true" Diigo="true" Magnolia="true"
                        Segnalo="true" Title="Bookmark this page to:" Separator="&nbsp;" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcGoogle" Visible="false">
                    <uc2:GoogleVideo ID="GoogleVideo1" runat="server" VideoURL="http://video.google.com/googleplayer.swf?docId=-2126186516901039084&amp;hl=en"
                        Width="425" Height="355" EnableViewState="false" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
