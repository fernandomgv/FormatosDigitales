<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="DataSources.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_DataSources"
    ValidateRequest="false" %>
    
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
    
<%@ Register Src="~/CMSWebParts/Membership/Logon/LogonMiniForm.ascx" TagName="LogonMiniForm" TagPrefix="uc9" %>    
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
                <cms:CMSDocumentsDataSource EnableViewState="false" Path="/News/%" ID="documentsDataSource" runat="server" ClassNames="CMS.News" /> 
                <asp:PlaceHolder ID="plcDataSourceRepeater" runat="server" Visible="false">
                    <div>
                    This example uses documents data source control in combination with repeater and unipager controls.
                    </div>
                    <cms:CMSRepeater ID="ucRepeater" ZeroRowsText="No data found" runat="server" TransformationName="CMS.News.NewsPreviewWithSummary" SelectedItemTransformationName="CMS.News.NewsDetail" EnableViewState="false" />
                    <div class="clear">
                        &nbsp;</div>
                    <cms:UniPager ID="ucUniPagerRepeater" PageControl="ucRepeater" runat="server" PageSize="5" EnableViewState="false">
                        <CurrentPageTemplate>
                            <strong>
                                <%# Eval("Page") %>
                            </strong>
                        </CurrentPageTemplate>
                        <PageNumbersTemplate>
                            <a href="<%# Eval("PageURL") %>">
                                <%# Eval("Page") %>
                            </a>
                        </PageNumbersTemplate>
                        <NextPageTemplate>
                            <a href="<%# Eval("NextURL") %>">&gt;</a>
                        </NextPageTemplate>
                        <PreviousPageTemplate>
                            <a href="<%# Eval("PreviousURL") %>">&lt;</a>
                        </PreviousPageTemplate>
                        <FirstPageTemplate>
                            <a href="<%# Eval("FirstURL") %>">|&lt;</a>
                        </FirstPageTemplate>
                        <LastPageTemplate>
                            <a href="<%# Eval("LastURL") %>">&gt;|</a>
                        </LastPageTemplate>
                        <PageNumbersSeparatorTemplate>
                            &nbsp;
                        </PageNumbersSeparatorTemplate>
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="plcFirstPage"></asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plcPreviousPage"></asp:PlaceHolder>
                            &nbsp;
                            <asp:PlaceHolder runat="server" ID="plcPreviousGroup"></asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plcPageNumbers"></asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plcNextGroup"></asp:PlaceHolder>
                            &nbsp;
                            <asp:PlaceHolder runat="server" ID="plcNextPage"></asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plcLastPage"></asp:PlaceHolder>
                            Results
                            <%# Eval("FirstOnPage")%>
                            -
                            <%# Eval("LastOnPage") %>
                            of
                            <%# Eval("Items")%>
                            <br />
                            <%--<Pages:  <%# Eval("CurrentPage") %> of <%# Eval("Pages") %><br />--%>
                        </LayoutTemplate>
                    </cms:UniPager>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcDataSourceDatalist" runat="server" Visible="false">
                    <div>
                    This example uses documents data source control in combination with datalist and unipager controls.
                    </div>
                    <cms:CMSDataList ID="ucDatalist" runat="server" RepeatColumns="3" TransformationName="CMS.News.NewsPreviewWithSummary" SelectedItemTransformationName="CMS.News.NewsDetail" ZeroRowsText="No data found" EnableViewState="false" />
                    <div class="clear">
                        &nbsp;</div>
                    <cms:UniPager ID="ucUniPagerDatalist" PageControl="ucDatalist" runat="server" PageSize="5" EnableViewState="false">
                        <CurrentPageTemplate>
                            <strong>
                                <%# Eval("Page") %>
                            </strong>
                        </CurrentPageTemplate>
                        <PageNumbersTemplate>
                            <a href="<%# Eval("PageURL") %>">
                                <%# Eval("Page") %>
                            </a>
                        </PageNumbersTemplate>
                        <NextPageTemplate>
                            <a href="<%# Eval("NextURL") %>">&gt;</a>
                        </NextPageTemplate>
                        <PreviousPageTemplate>
                            <a href="<%# Eval("PreviousURL") %>">&lt;</a>
                        </PreviousPageTemplate>
                        <FirstPageTemplate>
                            <a href="<%# Eval("FirstURL") %>">|&lt;</a>
                        </FirstPageTemplate>
                        <LastPageTemplate>
                            <a href="<%# Eval("LastURL") %>">&gt;|</a>
                        </LastPageTemplate>
                        <PageNumbersSeparatorTemplate>
                            &nbsp;
                        </PageNumbersSeparatorTemplate>
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="plcFirstPage"></asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plcPreviousPage"></asp:PlaceHolder>
                            &nbsp;
                            <asp:PlaceHolder runat="server" ID="plcPreviousGroup"></asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plcPageNumbers"></asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plcNextGroup"></asp:PlaceHolder>
                            &nbsp;
                            <asp:PlaceHolder runat="server" ID="plcNextPage"></asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="plcLastPage"></asp:PlaceHolder>
                            Results
                            <%# Eval("FirstOnPage")%>
                            -
                            <%# Eval("LastOnPage") %>
                            of
                            <%# Eval("Items")%>
                            <br />
                            <%--<Pages:  <%# Eval("CurrentPage") %> of <%# Eval("Pages") %><br />--%>
                        </LayoutTemplate>
                    </cms:UniPager>
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>