<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Messaging.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Messaging"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Messaging/ContactList.ascx" TagName="contactlist"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Messaging/IgnoreList.ascx" TagName="ignorelist" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Messaging/Inbox.ascx" TagName="inbox" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Messaging/Outbox.ascx" TagName="outbox" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Messaging/SendMessage.ascx" TagName="sendmessage"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Messaging/MessagingInfoPanel.ascx" TagName="MessagingInfoPanel"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Messaging/MyMessages.ascx" TagName="mymessages" TagPrefix="uc1" %>
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
                <asp:PlaceHolder ID="plcContactList" runat="server" Visible="false">Only authenticated
                    user can see the contact list.
                    <uc1:contactlist runat="server" ID="contactlist" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcIgnoreList" runat="server" Visible="false">Only authenticated
                    user can see the ignore list.
                    <uc1:ignorelist runat="server" ID="ignorelist" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcInbox" runat="server" Visible="false">
                    <div class="MessagingBox">
                        Only authenticated user can see the inbox.
                        <uc1:inbox runat="server" ID="inbox" ZeroRowsText="No messages" PasteOriginalMessage="true"
                            ShowOriginalMessage="true" PageSize="10" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcOutbox" runat="server" Visible="false">
                    <div class="MessagingBox">
                        Only authenticated user can see the outbox.
                        <uc1:outbox runat="server" ID="outbox" ZeroRowsText="No messages" ShowOriginalMessage="true"
                            PageSize="10" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMyMessages" runat="server" Visible="false">Only authenticated
                    user can see their messages.
                    <br />
                    <br />
                    <uc1:mymessages runat="server" ID="mymessages" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSendMessage" runat="server" Visible="false">
                    <div class="MessagingBox">
                        <uc1:sendmessage runat="server" ID="sendmessage" AllowAnonymousRecipientSelection="false"
                            AllowAnonymousUsers="true" DefaultRecipient="53" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMessagingInfoPanel" runat="server" Visible="false">This webpart
                    shows links to inbox, outbox, etc. for actually logged in user.<br />
                    <br />
                    <uc1:MessagingInfoPanel runat="server" ID="MessagingInfoPanel" InboxLinkUrl="~/SpecialPages/MyAccount.aspx?page=messages&subpage=inbox"
                        OutboxLinkUrl="~/SpecialPages/MyAccount.aspx?page=messages&subpage=outbox" LinkSeparator="&nbsp;|&nbsp;"
                        NewMessageLabel="New message" OutboxLabel="Outbox" InboxLabel="Inbox" ShowUnreadMessagesCount="true"
                        ShowInbox="true" ShowOutbox="true" DisplayToRoles="_authenticated_" EnableViewState="false" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
