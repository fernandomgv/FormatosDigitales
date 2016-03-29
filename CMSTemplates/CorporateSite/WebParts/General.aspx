<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="General.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_General"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Text/statictext.ascx" TagName="statictext" TagPrefix="uc2" %>
<%@ Register Src="~/CMSWebParts/Viewers/DateTime.ascx" TagName="DateTime" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/general/headhtml.ascx" TagName="HeadHTML" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/general/javascript.ascx" TagName="javascript" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/general/languageselection.ascx" TagName="languageselection"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/general/languageselectionwithflags.ascx" TagName="languageselectionwithflags"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/General/filter.ascx" TagName="filter" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/General/randomredirection.ascx" TagName="randomredirection" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/General/mobiledeviceredirection.ascx" TagName="mobiledeviceredirection" TagPrefix="uc1" %>
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
                <asp:PlaceHolder ID="plcDateTime" runat="server" Visible="false">
                    <uc1:DateTime runat="server" ID="DateTime1" JsUseServerTime="true" JsFormat="dd.mm.yy HH:MM:ss"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcHeadHtmlCode" runat="server" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="EditableText1" RegionType="HtmlEditor" />
                    <uc1:HeadHTML runat="server" ID="HeadHTML1" HTMLCode="&lt;meta http-equiv=&quot;pragma&quot; content=&quot;no-cache&quot; id=&quot;metaNoCache&quot; /&gt;"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcJavaScript" runat="server" Visible="false">
                    <uc1:javascript runat="server" ID="javascript" InlineScript="alert('Javascript webpart inline script');"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcLanguageSelection" runat="server" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="EditableText2" />
                    <uc1:languageselection runat="server" ID="LanguageSelection1" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcLanguageSelectionWithFlags" runat="server" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="EditableText3" />
                    <uc1:languageselectionwithflags runat="server" ID="LanguageSelectionWithFlags1" Separator="-"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcFilter" runat="server" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="editableTextElem" RegionType="HtmlEditor" />
                    <uc1:filter ID="filterElem" runat="server" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcPoweredByKentico" runat="server" Visible="false">
                    <uc2:statictext ID="PoweredByKentico1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcRandomRedirection" runat="server" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextRandom" RegionType="HtmlEditor" />
                    <uc1:randomredirection ID="randomredirection1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMobileDeviceRedirection" runat="server" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="DescriptionTextMobile" RegionType="HtmlEditor" />
                    <uc1:mobiledeviceredirection ID="mobiledeviceredirection1" runat="server" EnableViewState="false" RedirectionURL="~/Examples/General/Mobile-device-redirection.aspx" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
