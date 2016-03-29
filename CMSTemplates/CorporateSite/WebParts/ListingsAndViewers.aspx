<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="ListingsAndViewers.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_ListingsAndViewers"
    ValidateRequest="false" Theme="CorporateSite" %>

<%@ Register Src="~/CMSWebParts/viewers/Documents/attachments.ascx" TagName="attachments" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Effects/ContentSlider.ascx" TagName="ContentSlider"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsdatalist.ascx" TagName="cmsdatalist" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/viewers/Query/querydatalist.ascx" TagName="querydatalist"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/documentpager.ascx" TagName="DocumentPager"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsdatagrid.ascx" TagName="cmsdatagrid" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/viewers/Query/querydatagrid.ascx" TagName="querydatagrid"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/viewers/Documents/imagegallery.ascx" TagName="ImageGallery"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/viewers/Effects/lightbox.ascx" TagName="lightbox" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/viewers/Documents/randomdocument.ascx" TagName="randomDocument"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/viewers/Documents/relateddocuments.ascx" TagName="relateddocuments"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="repeater" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/viewers/Query/queryrepeater.ascx" TagName="queryrepeater"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Effects/ScrollingText.ascx" TagName="ScrollingText"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsviewer.ascx" TagName="cmsxsltlist" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/sendtofriend.ascx" TagName="sendtofriend"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmscalendar.ascx" TagName="cmscalendar" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Viewers/PageViews.ascx" TagName="PageViews" TagPrefix="uc1" %>
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
                <asp:PlaceHolder ID="plcAttachments" runat="server" Visible="false">
                    <uc1:attachments runat="server" ID="attachments" EnableAddButton="True" TransformationName="cms.file.attachmentlist"
                        Visible="false" CacheItemName="CSASPX|Examples|WebParts|ListingAndViewers|Attachments"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcCalendar" runat="server" Visible="false">
                    <div style="width: 400px;">
                        <uc1:cmscalendar runat="server" ID="cmscalendar" CalendarControl-SkinID="EventCalendar"
                            Visible="false" EnableViewState="false" Path="/%" ClassNames="CMS.BookingEvent" TransformationName="CMS.BookingEvent.CalendarEvent" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcContentSlider" runat="server" Visible="false">
                    <uc1:ContentSlider runat="server" ID="ContentSlider" Path="/News/%" ClassNames="CMS.News"
                        OrderBy="NewsReleaseDate DESC" TransformationName="CMS.News.NewsWithSummaryAndTeasers"
                        DivWidth="500" DivHeight="170" JsFadeIn="1000" JsFadeOut="1000" JsAutoStart="true"
                        Visible="false" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcDatalist" runat="server" Visible="false">
                    <div class="ProductList">
                        <uc1:cmsdatalist runat="server" ID="cmsdatalist" Path="/%" ClassNames="cms.cellphone;cms.laptop;cms.pda"
                            TransformationName="ecommerce.transformations.product_preview" RepeatColumns="4"
                            RepeatDirection="horizontal" RepeatLayout="table" PagingMode="querystring" PagerPosition="bottom"
                            ResultsPosition="top" ShowEditDeleteButtons="True" Visible="false" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcDatalistWithCustomQuery" runat="server" Visible="false">
                    <div class="ProductList" style="width: 500px">
                        <uc1:querydatalist runat="server" ID="querydatalist" QueryName="CMS.Pda.selectdocuments"
                            TransformationName="CMS.Pda.Default" RepeatDirection="horizontal" RepeatLayout="table"
                            EnablePaging="True" PagingMode="querystring" PagerPosition="bottom" PageSize="1"
                            ResultsPosition="top" ShowEditDeleteButtons="True" Visible="false" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcDocumentPager" runat="server" Visible="false">
                    <div class="ProductList" style="width: 180px;">
                        <uc1:DocumentPager runat="server" ID="DocumentPager" Path="/Products/%" ClassNames="cms.cellphone;cms.laptop;cms.pda"
                            TransformationName="ecommerce.transformations.product_preview" PagerPosition="bottom"
                            PageSize="1" Visible="false" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcGrid" runat="server" Visible="false">
                    <cms:CMSDataGrid ID="CMSDataGrid1" runat="server" ClassNames="cms.pda;cms.laptop;cms.cellphone"
                        Path="/Products/%" BackColor="White" CellPadding="5" AllowPaging="True" AutoGenerateColumns="False"
                        AllowSorting="True" GridLines="Vertical" ZeroRowsText="No data found." CheckPermissions="False"
                        HideControlForZeroRows="False" SkinID="DataGrid" Visible="false" PageSize="10">
                        <Columns>
                            <asp:BoundColumn DataField="NodeAliasPath" SortExpression="NodeAliasPath" HeaderText="Node alias path" />
                            <asp:BoundColumn DataField="NodeName" SortExpression="NodeName" HeaderText="Node name" />
                            <asp:BoundColumn DataField="NodeAlias" SortExpression="NodeAlias" HeaderText="Node alias" />
                            <asp:BoundColumn DataField="DocumentName" SortExpression="DocumentName" HeaderText="Document name" />
                        </Columns>
                    </cms:CMSDataGrid>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcGridWithCustomQuery" runat="server" Visible="false">
                    <cms:QueryDataGrid ID="querydatagrid" runat="server" QueryName="cms.cellphone.selectdocuments"
                        AutoGenerateColumns="False" AllowPaging="False" AllowSorting="True" GridLines="Vertical"
                        BackColor="White" CellPadding="5" ZeroRowsText="no data found" ShowFooter="true"
                        HideControlForZeroRows="False" SkinID="QueryGrid" Visible="false">
                        <Columns>
                            <asp:BoundColumn DataField="cellphoneID" SortExpression="cellphoneID" HeaderText="ID" />
                            <asp:BoundColumn DataField="CellDisplayType" SortExpression="CellDisplayType" HeaderText="Display type" />
                            <asp:BoundColumn DataField="CellName" SortExpression="CellName" HeaderText="Name" />
                        </Columns>
                    </cms:QueryDataGrid>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcImageGallery" runat="server" Visible="false">
                    <uc1:ImageGallery runat="server" ID="ImageGallery" Path="/Images/%" ThumbnailTransformation="CMS.File.imagegallery_thumbnails200"
                        PagingMode="querystring" Columns="3" RowsPerPage="3" Visible="false" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcLightbox" runat="server" Visible="false">
                    <uc1:lightbox runat="server" ID="lightbox" Path="/Products/%" ClassNames="cms.pda;cms.laptop;cms.cellphone"
                        TransformationName="ecommerce.transformations.Product_LightboxPreview" SelectedItemTransformationName="ecommerce.transformations.Product_LightboxDetail"
                        PagingMode="querystring" PagerPosition="bottom" Visible="false" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcPageViews" runat="server" Visible="false">
                    <div style="padding: 20px;">
                        <uc1:PageViews runat="server" ID="pageviews" Visible="false" MessageText="Page views: {0}"
                            EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcRandomDocument" runat="server" Visible="false">
                    <div class="ProductList" style="width: 180px">
                        <uc1:randomDocument runat="server" ID="randomDocument" Path="/%" ClassNames="cms.laptop;cms.pda;cms.cellphone"
                            TransformationName="ecommerce.transformations.product_preview" SelectRandomN="1"
                            Visible="false" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcRelatedDocuments" runat="server" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="editabletext" />
                    <div style="padding-top: 20px;">
                        <uc1:relateddocuments runat="server" ID="relateddocuments" RelationshipName="isrelatedto"
                            TransformationName="CMS.Root.relateddocuments" Visible="false" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcRepeater" runat="server" Visible="false">
                    <div class="ProductList" style="width: 180px;">
                        <uc1:repeater runat="server" ID="repeater" Path="/%" ClassNames="cms.cellphone;cms.laptop;cms.pda"
                            OrderBy="SKUPrice" TransformationName="ecommerce.transformations.product_preview"
                            SelectedItemTransformationName="{%classname%}.default" EnablePaging="True" PagingMode="querystring"
                            PagerPosition="bottom" PageSize="2" ResultsPosition="top" Visible="false" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcRepeaterWithCustomQuery" runat="server" Visible="false">
                    <div class="ProductList">
                        <uc1:queryrepeater runat="server" ID="queryrepeater" QueryName="CMS.BlogPost.selectdocuments"
                            WhereCondition="SiteName LIKE 'CorporateSiteASPX'" TransformationName="CMS.BlogPost.Default"
                            EnablePaging="True" PagingMode="querystring" PagerPosition="bottom" PageSize="2"
                            ResultsPosition="top" Visible="false" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcScrollingText" runat="server" Visible="false">
                    <div class="ProductList">
                        <uc1:ScrollingText runat="server" ID="ScrollingText" Path="/%" ClassNames="cms.pda;cms.cellphone;cms.laptop"
                            TransformationName="ecommerce.transformations.product_preview" DivWidth="180"
                            Visible="false" DivHeight="300" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcXsltViewer" runat="server" Visible="false">
                    <uc1:cmsxsltlist runat="server" ID="cmsxsltlist" Path="/%" ClassNames="CMS.CellPhone;CMS.Laptop;CMS.Pda"
                        TransformationName="ecommerce.transformations.Product_Default_xslt" Visible="false"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcSendToFriend" runat="server" Visible="false">
                    <uc1:sendtofriend runat="server" ID="sendtofriend" Path="/%" ClassNames="cms.cellphone"
                        TransformationName="CMS.CellPhone.Simple" HeaderText="Send to friend" EmailTemplate="{%Message%}<br /><br />{%Document%}"
                        EmailFrom="admin@localhost.local" EmailSubject="I have found great cellphones!"
                        Visible="false" EnableViewState="false" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
