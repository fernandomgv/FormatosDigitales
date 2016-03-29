<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Careers.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_Careers" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="repeater"
    TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div style="float: left; width: 180px;">
        <uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" DisplayHighlightedItemAsLink="true" />
    </div>
    <div style="float: right; width: 735px;">
        <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
            <uc1:breadcrumbs runat="server" ID="breadcrumbs" ClassNames="CMS.MenuItem;CMS.Job"
                EnableViewState="false" />
        </cms:WebPartContainer>
        <div class="jobList">
            <h1>
                <cms:CMSEditableRegion runat="server" ID="HeaderText" ShowForDocumentTypes="CMS.MenuItem"
                    RegionType="TextBox" />
            </h1>
            <asp:Panel ID="pnlCareers" runat="server">
                <cms:CMSEditableRegion runat="server" ID="ContentText" ShowForDocumentTypes="CMS.MenuItem" />
            </asp:Panel>
            <div class="GeneralList">
                <uc1:repeater runat="server" ID="JobsRepeater" ClassNames="CMS.Job" OrderBy="JobName"
                    TransformationName="CMS.Job.preview" SelectedItemTransformationName="CMS.Job.Default"
                    EnablePaging="True" PagingMode="querystring" PagerPosition="bottom" ResultsPosition="top"
                    CacheMinutes="0" ShowNewButton="True" NewButtonText="Add new job opening" ShowEditDeleteButtons="True"
                    EnableViewState="false" />
            </div>
        </div>
    </div>
    <div style="clear: both;">
    </div>
</asp:Content>
