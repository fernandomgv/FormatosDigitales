using System;
using System.Web;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_TaggingCategories : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Display category welcome text when required
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();
        if (aliasPath.ToLower().EndsWith("/tagging---categories"))
        {
            this.lblWelcomeText.Text = "Document tags and categories";
            this.plcWelcome.Visible = true;
        }
        
        if (aliasPath.ToLower().EndsWith("/tag-cloud") || aliasPath.ToLower().Contains("/tag-cloud"))
        {
            plcTagCloud.Visible = true;
            tagcloudarticles.Visible = true;
            tagcloudproducts.Visible = true;

            // Get ID of the currently requested tag
            string tagId = QueryHelper.GetString("tagid", string.Empty).Replace("'", "''");
            
            this.tagArticles.Visible = true;
            this.tagProducts.Visible = true;

            // Get all the documents with specified tag applied
            string where = "'" + tagId + "' = '' OR (DocumentID IN ( SELECT DocumentID FROM CMS_DocumentTag WHERE TagID = '" + tagId + "'))";

            // Get all articles document according specified WHERE condition
            this.tagArticles.WhereCondition = where;
            this.tagArticles.ReloadData();

            // Get all products document according specified WHERE condition
            this.tagProducts.WhereCondition = where;
            this.tagProducts.ReloadData();

            if (CMSContext.CurrentPageInfo.ClassName.ToLower() != "cms.menuitem")
            {
                this.wpcTagCloudArticles.Visible = false;
                this.wpcTagCloudProducts.Visible = false;
            }           
        }
        else if (aliasPath.ToLower().EndsWith("/category-list") || aliasPath.ToLower().Contains("/category-list"))
        {
            plcCategoryList.Visible = true;
            categorylist.Visible = true;

            // Get ID of the currently requested category
            string categoryId = QueryHelper.GetString("categoryid", string.Empty).Replace("'", "''");
            
            // Get all the articles that belong to the specified category
            this.categoryArticles.WhereCondition = "'" + categoryId + "' = '' OR (DocumentID IN ( SELECT DocumentID FROM CMS_DocumentCategory WHERE CategoryID = '" + categoryId + "'))";           
            this.categoryArticles.Visible = true;
            this.categoryArticles.ReloadData();

            if (CMSContext.CurrentPageInfo.ClassName.ToLower() != "cms.menuitem") 
            {
                this.wpcCategoryList.Visible = false;
            }
        }
    }
}
