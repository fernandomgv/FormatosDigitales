<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Offices.aspx.cs"
    Inherits="CMSTemplates_CorporateSiteASPX_Offices" ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>

<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsdatalist.ascx" TagName="cmsdatalist" TagPrefix="uc1" %>

<%@ Register Src="~/CMSWebParts/Maps/GoogleMaps.ascx" TagName="GoogleMaps"
    TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div style="float: left; width: 180px;">
        <uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" DisplayHighlightedItemAsLink="true" EnableViewState="false" />
    </div>
    <div style="float: right; width: 735px;">
        <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
            <uc1:breadcrumbs runat="server" ID="breadcrumbs" ClassNames="CMS.MenuItem;CMS.Office" EnableViewState="false" />
        </cms:WebPartContainer>
        <div class="officeListMap">
            <!-- Left zone -->
            <div class="zoneLeft" style="float: left;">
                <br />
                <div class="GeneralList">
                    <uc1:cmsdatalist runat="server" ID="OfficesDataList" Path="/{0}/%" ClassNames="cms.office"
                        OrderBy="OfficeName" TransformationName="cms.office.simple" SelectedItemTransformationName="cms.office.Default"
                        RepeatColumns="1" RepeatDirection="vertical" RepeatLayout="table" PagingMode="querystring"
                        BackNextLocation="none" PagerPosition="bottom" ResultsPosition="top" RelationshipWithNodeGUID="00000000-0000-0000-0000-000000000000"
                        RelationshipName="isrelatedto" ShowNewButton="True" NewButtonText="Add new office"
                        ShowEditDeleteButtons="True" EnableViewState="false" />
                </div>
            </div>
            <!-- Right zone -->
            <div class="zoneRight" style="float: right;">
                <br />
                <div class="Map">
                    <uc1:GoogleMaps runat="server" ID="OfficeGoogleMap" ClassNames="cms.office"
                        TransformationName="cms.office.preview" Scale="2" Width="432" Height="400" Latitude="51"
                        Longitude="-30" LatitudeField="OfficeLatitude" LongitudeField="OfficeLongitude" ZoomScale="12"
                        ToolTipField="OfficeName" EnableViewState="false" />
                </div>
            </div>
            <div style="clear: both;" ></div>
        </div>
    </div>
    <div style="clear: both;" ></div>
</asp:Content>
