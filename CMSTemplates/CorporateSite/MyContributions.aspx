<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="MyContributions.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_MyContributions"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/UserContributions/ContributionList.ascx" TagName="ContributionList"
    TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
        <uc1:breadcrumbs runat="server" ID="breadcrumbs" ClassNames="CMS.MenuItem;CMS.SimpleArticle"
            EnableViewState="false" />
    </cms:WebPartContainer>
    <h1>
        <cms:CMSEditableRegion runat="server" ID="EditableHeader" RegionType="TextBox" />
    </h1>
    <cms:CMSEditableRegion runat="server" ID="EditableDescription" RegionType="HtmlEditor" />
    <br />
    <br />
    <uc1:ContributionList runat="server" ID="ContributionList" Path="/Wiki/%" NewDocumentPath="/Wiki/%"
        AllowedChildClasses="CMS.SimpleArticle" ClassNames="CMS.SimpleArticle" OrderBy="NodeLevel DESC"
        DisplayList="true" AllowUsers="DocumentOwner" SelectOnlyPublished="false" />
</asp:Content>
