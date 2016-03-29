<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_MyAccount"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Membership/Profile/MyAccount.ascx" TagName="MyAccount" TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="myAccount">
        <h1>
            <cms:CMSEditableRegion runat="server" ID="editabletextHeader" RegionType="TextBox" />
        </h1>
        <uc1:MyAccount runat="server" ID="MyAccount" DisplayMyFriends="false" />
    </div>
</asp:Content>
