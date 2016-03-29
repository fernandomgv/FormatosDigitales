<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Forum-search.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_Forum_search" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Forums/Search/ForumExtendedSearchDialog.ascx" TagName="ForumExtendedSearch" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Forums/Search/ForumSearchResults.ascx" TagName="ForumSearchResults" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs" TagPrefix="cms" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
        <cms:breadcrumbs runat="server" id="breadcrumbs" EnableViewState="false" />
    </cms:WebPartContainer>
    <h1>
        <cms:CMSEditableRegion runat="server" ID="editabletextHeader" RegionTitle="Header"
            RegionType="TextBox" />
    </h1>
    
    <cms:ForumExtendedSearch runat="server" ID="ForumSearchResults1" />
    <br />
    <cms:ForumSearchResults runat="server" ID="ForumSearchResults" EnableViewState="false" />
</asp:Content>
