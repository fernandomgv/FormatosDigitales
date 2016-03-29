<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="MessageBoards.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_MessageBoards"
    ValidateRequest="false" Theme="CorporateSite" %>

<%@ Register Src="~/CMSWebParts/MessageBoards/MessageBoard.ascx" TagName="MessageBoard"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/MessageBoards/MessageBoardViewer.ascx" TagName="MessageBoardViewer"
    TagPrefix="cms" %>
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
                <asp:PlaceHolder ID="plcRepeater" runat="server" Visible="false">
                    <div style="padding-bottom: 10px;">
                        <cms:CMSRepeater ID="article" runat="server" Path="/Examples/WebParts/Tagging---Categories/Category-list/Search-Engine-Optimization-(SEO)"
                            TransformationName="CMS.Article.Default" ClassNames="CMS.Article" EnableViewState="false">
                        </cms:CMSRepeater>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMessageBoard" runat="server" Visible="true"><span class="BoardLeaveMessage">
                    Messages</span><br />
                    <cms:MessageBoard ID="messageBoardASPX" runat="server" MessageTransformation="community.transformations.MessageBoard"
                        NoMessagesText="There are no messages." EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMessageBoardViewer" runat="server" Visible="false">Displays
                    the list of messages from all message boards on the specified site according to
                    the given WHERE condition.<br />
                    <cms:MessageBoardViewer ID="MessageBoardViewer" runat="server" TransformationName="Community.Transformations.MessageBoardComments" EnableViewState="false" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
