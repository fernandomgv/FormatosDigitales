<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Newsletters.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Newsletters"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Newsletters/NewsletterArchive.ascx" TagName="newsletterarchive"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Newsletters/NewsletterSubscriptionWebpart.ascx" TagName="newslettersubscription"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Newsletters/MySubscriptionsWebpart.ascx" TagName="mysubscriptions"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Newsletters/UnsubscriptionRequest.ascx" TagName="unsubscription"
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
                <asp:PlaceHolder ID="plcNewsletterSubscribtion" runat="server" Visible="false">
                    <uc1:newslettersubscription ID="NewsletterSubscription1" runat="server" NewsletterName="NWSLetUserChoose"
                        ButtonText="Subscribe" DisplayFirstName="true" DisplayLastName="true" FirstNameText="First name:"
                        LastNameText="Last name:" EmailText="E-mail:" SendConfirmationEmail="true" ExternalUse="true" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcNewsletterArchive" runat="server" Visible="false">
                    <div style="padding:20px">
                    <cms:CMSEditableRegion ID="EditableRegion1" runat="server" />
                    <br />
                    <br />
                    <uc1:newsletterarchive ID="NewsletterArchive1" runat="server" NewsletterName="CorporateNewsletter"
                        TransformationName="CMS.Root.Newsletter_Archive" EnableViewState="false" />
                        </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMySubscription" runat="server" Visible="false">
                    <uc1:mysubscriptions ID="MySubscription1" runat="server" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcUnsubscription" runat="server" Visible="false">
                    <div style="padding:20px"><uc1:unsubscription ID="Unsubscription" runat="server" Visible="false" ResultText="E-mail with unsubscription request was sent."
                     NewsletterName="CorporateNewsletter"
                     InformationText="Please enter your e-mail address to unsubscribe from Corporate newsletter <br />" EnableViewState="false" />
                     </div>
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
