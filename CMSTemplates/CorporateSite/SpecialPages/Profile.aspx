<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    CodeFile="Profile.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_Profile"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Membership/Users/UserPublicProfile.ascx" TagName="UserPublicProfile"
    TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div>
        <h1>
            <cms:CMSEditableRegion runat="server" ID="editabletextHeader" RegionType="TextBox" />
        </h1>
        <uc1:UserPublicProfile runat="server" ID="userPublicProfile" NoProfileText="Requested profile not found." />
    </div>
</asp:Content>
