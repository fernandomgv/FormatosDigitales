<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Navigation.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Navigation"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Navigation/cmstabcontrol.ascx" TagName="cmstabcontrol"
    TagPrefix="uc7" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreeview.ascx" TagName="cmstreeview"
    TagPrefix="uc8" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmsmenu.ascx" TagName="cmsmenu" TagPrefix="uc5" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmssitemap.ascx" TagName="cmssitemap"
    TagPrefix="uc6" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmslistmenu.ascx" TagName="cmslistmenu"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>


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
                <asp:PlaceHolder ID="plcBreadcrumbs" runat="server" Visible="false">
                    <uc1:breadcrumbs ID="Breadcrumbs1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCmsListMenu" Visible="false">
                    <%--<div class="examListMenu">
                    <uc4:cmslistmenu ID="Cmslistmenu1" runat="server" ClassNames="cms.menuitem" Path="/%" RenderCssClasses="true" HighlightAllItemsInPath="true" DisplayHighlightedItemAsLink="true" />
                    </div>--%>
                    <div style="float: left; width: 30%;">
                        <div class="Vertical">
                            <uc4:cmslistmenu runat="server" ID="cmslistmenu2" RenderCssClasses="True" ItemIDPrefix="Vertical"
                                ApplyMenuDesign="true" HighlightAllItemsInPath="true" DisplayHighlightedItemAsLink="true" EnableViewState="false" />
                        </div>
                    </div>
                    <div style="float: left; width: 40%;">
                        <div class="examListMenu">
                            <uc4:cmslistmenu runat="server" ID="cmslistmenu" Path="/Examples/Webparts/%" RenderCssClasses="True"
                                HighlightAllItemsInPath="true" DisplayHighlightedItemAsLink="true" EnableViewState="false" />
                        </div>
                    </div>
                    <div style="float: left; width: 25%;">
                        <div class="DropDown">
                            <div style="padding: 2px;">
                                ... choose ...
                            </div>
                            <div class="DropDownHover">
                                <uc4:cmslistmenu runat="server" ID="cmslistmenu1" DisplayHighlightedItemAsLink="true"  MaxRelativeLevel="1" ItemIDPrefix="DropDown" EnableViewState="false" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCmsMenu" Visible="false">
                    <uc5:cmsmenu ID="Cmsmenu1" runat="server" ClassNames="cms.menuitem" Path="/%" HighlightAllItemsInPath="true" CSSPrefix="vertical;verticalsub"
                        Layout="Vertical" Padding="0" Spacing="0" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCmsSiteMap" Visible="false">
                    <uc6:cmssitemap ID="Cmssitemap1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCmsTreeView" Visible="false">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <cms:CMSTreeView ShowLines="true" ID="CMSTreeView1" runat="server" Path="/Examples/%" ClassNames="cms.article;cms.blog;cms.blogmonth;cms.blogpost;cms.cellphone;cms.event;cms.faq;CMS.File;CMS.Folder;CMS.Job;cms.kbarticle;cms.laptop;CMS.News;cms.office;CMS.MenuItem;cms.pda;cms.pressrelease;CMS.Product;CMS.Root;CMS.SimpleArticle"
                                    OnClickAction="alert('{%%DocumentName%%}'); return false;" ExpandCurrentPath="true" ExpandAllOnStartup="false" HiglightSelectedItem="true" ExpandImageToolTip="Expand" CollapseImageToolTip="Collapse"  SelectedItemStyle="background-color:#000055; color:#ffffff; padding-left: 1px; padding-right: 5px; text-decoration: none;" EnableViewState="false" >
                                </cms:CMSTreeView>
                            </td>
                            <td style="vertical-align: top;">
                                <cms:CMSTreeView ID="CMSTreeView2" ShowLines="true" ExpandCurrentPath="true"
                                    runat="server" ExpandImageToolTip="Expand" HiglightSelectedItem="true" CollapseImageToolTip="Collapse" SelectedItemStyle="background-color:#000055; color:#ffffff; padding-left: 1px; padding-right: 5px; text-decoration: none;" DisplayDocumentTypeImages="false" Path="/Products/%" ClassNames="cms.cellphone;cms.laptop;CMS.MenuItem;cms.pda;CMS.Product;"
                                    Target="_blank" ExpandAllOnStartup="true" HideRootNode="false" EnableViewState="false">
                                </cms:CMSTreeView>
                            </td>
                        </tr>
                    </table>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCmsTreeMenu" Visible="false">
                    <div style="width:280px">
                        <uc1:cmstreemenu ID="Cmstreemenu2" runat="server" ClassNames="cms.menuitem" Path="/%"
                        HighlightAllItemsInPath="true" DisplayHighlightedItemAsLink="true" Indentation="3" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCmsTabControl" Visible="false">
                    <uc7:cmstabcontrol ID="Cmstabcontrol2" runat="server" ClassNames="cms.menuitem" MaxRelativeLevel="1" EnableViewState="false" />
                </asp:PlaceHolder>

            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
