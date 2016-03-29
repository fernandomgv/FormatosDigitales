using System;
using System.Web;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Ecommerce : TemplatePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        string aliasPath = CMSContext.CurrentAliasPath.ToLower();
        filterElem.StopProcessing = true;

        if (aliasPath.EndsWith("/product-datalist"))
        {
            plcProductDatalist.Visible = true;
            ProductDataList1.Visible = true;
            if (CurrentPage != null && CurrentPage.NodeSiteId > 0)
            {
                ProductDataList1.WhereCondition = "(SKUOptionCategoryID IS NULL) AND (SKUID IN (SELECT NODESKUID FROM View_CMS_Tree_Joined WHERE (NodeSKUID IS NOT NULL) AND (NodeSiteID = " + CurrentPage.NodeSiteId + ")))";
            }
            else
            {
                ProductDataList1.WhereCondition = "(SKUOptionCategoryID IS NULL) AND (SKUID IN (SELECT NODESKUID FROM View_CMS_Tree_Joined WHERE (NodeSKUID IS NOT NULL)))";
            }
            this.ProductDataList1.ReloadData();
        }
        else if (aliasPath.EndsWith("/product-filter"))
        {
            filterElem.StopProcessing = false;
            plcProductFilter.Visible = true;
            filterElem.Visible = true;
            lstProducts.Visible = true;
        }
        else if (aliasPath.EndsWith("/random-product"))
        {
            plcRandomProduct.Visible = true;
            RandomProduct1.Visible = true;
            RandomProduct1.ReloadData();
        }
        else if (aliasPath.EndsWith("/shopping-cart"))
        {
            plcShoppingCart.Visible = true;
            ShoppingCart1.Visible = true;
        }
        else if (aliasPath.EndsWith("/shopping-cart-preview"))
        {
            plcShoppingPreview.Visible = true;
            ShoppingCartPreview1.Visible = true;
        }
        else if (aliasPath.EndsWith("/similar-products-by-sale"))
        {
            plcProductListSimilar.Visible = true;
            ProductListSimilarByBuy1.Visible = true;            
        }
        else if (aliasPath.EndsWith("/wish-list"))
        {
            plcWishlist.Visible = true;
            Wishlist1.Visible = true;
            lblWishlist.Visible = true;
            lblWishlist.Text = ResHelper.GetString("Wishlist.OnlyForAuthenticated");
        }
        else if (aliasPath.EndsWith("/top-n-products-by-sale"))
        {
            plcTopNProducts.Visible = true;
            TopNProducts1.Visible = true;
        }
        else if (aliasPath.EndsWith("/top-n-newest-products"))
        {
            plcTopNNewestProducts.Visible = true;
            TopNNewestProducts1.Visible = true;
        }
    }
}
