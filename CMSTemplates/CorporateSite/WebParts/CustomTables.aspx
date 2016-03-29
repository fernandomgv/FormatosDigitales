<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="CustomTables.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_CustomTables"
    ValidateRequest="false" Theme="CorporateSite" %>

<%@ Register Src="~/CMSWebParts/CustomTables/CustomTableRepeater.ascx" TagName="customtablerepeater"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/CustomTables/CustomTableDataList.ascx" TagName="customtabledatalist"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/CustomTables/CustomTableDataGrid.ascx" TagName="customtabledatagrid"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/SmartSearch/SearchDialogWithResults.ascx" TagName="SearchDialogWithResults"
    TagPrefix="cms" %>
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
                <asp:PlaceHolder ID="plcGrid" runat="server" Visible="false">
                    <uc1:customtabledatagrid ID="CustomTableDataGrid" runat="server" CustomTable="customtable.SampleTable"
                        Visible="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcRepeater" runat="server" Visible="false">
                    <uc1:customtablerepeater ID="CustomTableRepeater" runat="server" CustomTable="customtable.SampleTable"
                        SelectedDatabaseColumnName="ItemID" SelectedQueryStringKeyName="ItemID" SelectedValidationType="int"
                        TransformationName="customtable.SampleTable.Default" SelectedItemTransformationName="customtable.SampleTable.Preview"
                        Visible="false" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcList" runat="server" Visible="false">
                    <uc1:customtabledatalist ID="CustomTableDataList" runat="Server" CustomTable="customtable.SampleTable"
                        SelectedDatabaseColumnName="ItemID" SelectedQueryStringKeyName="ItemID" SelectedValidationType="int"
                        RepeatColumns="2" TransformationName="customtable.SampleTable.Default" SelectedItemTransformationName="customtable.SampleTable.Preview"
                        Visible="false" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCustomTableSmartSearch" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="ExampleText" ShowForDocumentTypes="CMS.MenuItem"
                        RegionType="HtmlEditor" />
                    <cms:SearchDialogWithResults ID="SearchDialogWithResults" runat="server" Indexes="CorporateSiteASPX.CustomTable"
                        TransformationName="customtable.SampleTable.SmartSearchResultsWithImages" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
