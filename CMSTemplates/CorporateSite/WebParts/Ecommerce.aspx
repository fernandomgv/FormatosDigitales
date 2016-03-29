<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Ecommerce.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Ecommerce"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Ecommerce/Products/TopNProductsBySales.ascx" TagName="TopNProductsBySales"
    TagPrefix="uc2" %>
<%@ Register Src="~/CMSWebParts/Ecommerce/Products/ProductDataList.ascx" TagName="ProductDataList"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Ecommerce/Products/randomproducts.ascx" TagName="RandomProduct"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Ecommerce/ShoppingCart/ShoppingCartMiniPreviewWebPart.ascx" TagName="ShoppingCartPreview"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Ecommerce/ShoppingCart/ShoppingCartWebPart.ascx" TagName="ShoppingCart"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Ecommerce/Products/SimilarProductsBySale.ascx" TagName="ProductListSimilarByBuy"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Ecommerce/Products/TopNNewestProducts.ascx" TagName="TopNNewestProducts"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Ecommerce/Wishlist.ascx" TagName="Wishlist" TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Ecommerce/Products/ProductFilter.ascx" TagName="ProductFilter"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsdatalist.ascx" TagName="CMSDataList" TagPrefix="uc4" %>
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
        <div class="zoneContent ecommerceExample" style="float: right;">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <uc1:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content">
                <asp:PlaceHolder ID="plcProductDatalist" runat="server" Visible="false">
                    <div class="ProductList">
                        <uc4:ProductDataList ID="ProductDataList1" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table" PagerPosition="Bottom" TransformationName="ecommerce.transformations.Product_SimplePreview"
                            OrderBy="SKUPrice" RepeatColumns="4" Visible="false" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcProductFilter" runat="server" Visible="false">
                    <div style="background-color: #F0F0F0;">
                        <uc4:ProductFilter ID="filterElem" runat="server" Visible="false" FilterName="ProductFilter"
                            PagingOptions="1,2,3,4,5" />
                    </div>
                    <div class="ProductList">
                        <cms:CMSDataList ID="lstProducts" runat="server" Path="/Products/%" ClassNames="CMS.CellPhone;CMS.Pda;CMS.Laptop"
                            FilterName="ProductFilter" RepeatColumns="3" TransformationName="ecommerce.transformations.Product_Preview"
                            RepeatDirection="Horizontal" EnablePaging="true" PagerControl-PagingMode="PostBack" PageSize="3"
                            CacheMinutes="0" Visible="false" EnableViewState="false">
                        </cms:CMSDataList>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcRandomProduct" runat="server" Visible="false">
                    <div class="ProductList">
                        <cms:WebPartContainer ID="wpcRadomProduct" runat="server" ContainerName="BlackBox"
                            ContainerTitle="Featured product">
                            <uc4:RandomProduct ID="RandomProduct1" runat="server" Path="/%" WhereCondition="NodeSKUID IS NOT NULL AND NodeSKUID <> 0"
                                TransformationName="ecommerce.transformations.Product_Featured" OnlyNRandomProducts="1"
                                CacheMinutes="0" Visible="false" EnableViewState="false" />
                        </cms:WebPartContainer>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcShoppingCart" runat="server" Visible="false">
                    <uc4:ShoppingCart ID="ShoppingCart1" runat="server" Visible="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcShoppingPreview" runat="server" Visible="false">
                    <uc4:ShoppingCartPreview ID="ShoppingCartPreview1" runat="server" Visible="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcProductListSimilar" runat="server" Visible="false">
                    <div class="ProductList">
                        The <strong>Similar products by sale</strong> web part displays N products which
                        other customers buy with the chosen product most commonly. For instance, if a first
                        customer buys the product A together with product B and C, a second customer is
                        in the product A detailed displayed with the product B and C which have been purchased
                        together with the product A by the first customer
                        <uc4:ProductListSimilarByBuy ID="ProductListSimilarByBuy1" runat="server" TransformationName="ecommerce.transformations.product_preview"
                            Visible="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcTopNNewestProducts" runat="server" Visible="false">
                    <div class="ProductList">
                        <uc4:TopNNewestProducts ID="TopNNewestProducts1" runat="server" TransformationName="ecommerce.transformations.EcommerceSite_TopNNewestProducts"
                            Visible="false" SelectTopN="5" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcWishlist" runat="server" Visible="false">
                    <asp:Label ID="lblWishlist" runat="server" Visible="false" />
                    <div class="wishList">
                        <uc4:Wishlist ID="Wishlist1" TransformationName="ecommerce.transformations.Product_Wishlist"
                            runat="server" Visible="false" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcTopNProducts" runat="server" Visible="false">
                    <div class="topproducts">
                        The <strong>Top N products by sale</strong> web part displays the top N best-selling
                        products. The best-selling products are chosen according to the frequency of their
                        occurrence in customers' orders, not according to the total volume of sales. For
                        instance, if a customer buys 10 items of the product A and 2 items of the product
                        B and a second customer buys 4 items of the product B, the product B is evaluated
                        as the best-selling.
                        <uc2:TopNProductsBySales ID="TopNProducts1" runat="server" SelectTopN="5" TransformationName="ecommerce.transformations.EcommerceSite_TopNProductsBySales" EnableViewState="false" HideControlForZeroRows="true" />
                    </div>
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
