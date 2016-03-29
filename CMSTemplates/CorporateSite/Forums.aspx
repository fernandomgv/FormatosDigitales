<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Forums.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_Forums" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Membership/Logon/LogonMiniForm.ascx" TagName="LogonMiniForm"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Membership/Users/OnlineUsers.ascx" TagName="OnlineUsers"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Forums/Search/ForumSearch.ascx" TagName="ForumSearch" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Forums/ForumGroup.ascx" TagName="ForumGroup" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Forums/Search/ForumSearchResults.ascx" TagName="ForumSearchResults"
    TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="forumSearch">
        <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
            <uc1:breadcrumbs runat="server" ID="breadcrumbs" EnableViewState="false" />
        </cms:WebPartContainer>
        <h1>
            <cms:CMSEditableRegion runat="server" ID="editabletextHeader" RegionTitle="Header"
                RegionType="TextBox" />
        </h1>
        <cms:CMSEditableRegion runat="server" ID="editabletextContent" RegionTitle="Content"
            RegionType="HtmlEditor" />
        <div style="margin: 10px 0 10px 0">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td style="vertical-align: top;">
                        <strong>Search forums:&nbsp; </strong>
                    </td>
                    <td>
                        <uc1:ForumSearch runat="server" ID="ForumSearch" AdvancedSearchPath="/Forums/Forum-search" EnableViewState="false" />
                    </td>
                </tr>
            </table>
        </div>
        <uc1:ForumGroup runat="server" ID="ForumGroup" ForumViewMode="1" GroupName="corporatesiteaspx.websiteglobalforums" EnableViewState="false" />
        <uc1:ForumSearchResults runat="server" ID="ForumSearchResults" EnableViewState="false" />
        <br />
        <cms:WebPartContainer ID="wpcLogin" runat="server" ContainerName="BlackBox"
            ContainerTitle="Login">
            <uc1:LogonMiniForm ID="LogonMiniForm1" UserNameText="Username" runat="server" EnableViewState="false" />
        </cms:WebPartContainer>        
    </div>
</asp:Content>
