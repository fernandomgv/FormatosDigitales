<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="UserContributions.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_UserContributions"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/UserContributions/ContributionList.ascx" TagName="ContributionList"
    TagPrefix="uc2" %>
<%@ Register Src="~/CMSWebParts/UserContributions/EditContribution.ascx" TagName="EditContribution"
    TagPrefix="uc3" %>


<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>


<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="textPlaceholderLeftMenu">
        <!-- Left zone -->
        <div class="zoneLeft" style="float: left;">
            <uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" CellPadding="0" CellSpacing="0" DisplayHighlightedItemAsLink="true" HighlightAllItemsInPath="true" Indentation="3" ApplyMenuDesign="true" WordWrap="true" RenderImageAlt="true" EnableViewState="false" />
        </div>
        <!-- Content -->
        <div class="zoneContent" style="float: right;">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <uc1:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content">
                
                <asp:PlaceHolder ID="plcContributionList" runat="server" Visible="false">
                   <uc2:ContributionList ID="ContributionList1" runat="server" Path="/Wiki/%" NewDocumentPath="/Wiki/%" AllowedChildClasses="CMS.SimpleArticle" ClassNames="CMS.SimpleArticle" AllowInsert="true" AllowEdit="true" AllowDelete="true" AllowUsers="DocumentOwner" CheckPermissions="false" /> 
                </asp:PlaceHolder>
                
                <asp:PlaceHolder runat="server" ID="plcEditContribution" Visible="false">
                    <p>This webpart allows you to edit or delete simple article document in wiki.</p>
                    <uc3:EditContribution ID="EditContribution1" runat="server" Path="/Wiki/%" AllowDelete="true" AllowUsers="All" CheckPermissions="false" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
