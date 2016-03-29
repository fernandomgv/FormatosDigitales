using System;

using CMS.URLRewritingEngine;
using CMS.CMSHelper;
using CMS.UIControls;
using CMS.SiteProvider;
using CMS.GlobalHelper;
using Lucene.Net.Documents;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_FullTextSearch : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        lblSearchResult.Text = "This webpart displays search results.";
        lblSmartSearchResult.Text = "This webpart displays search results.";

        if (aliasPath.EndsWith("/search-box"))
        {
            plcSearchBox.Visible = true;
            Cmssearchbox1.SearchResultsPageUrl = URLRewriter.CurrentURL;
        }
        else if (aliasPath.EndsWith("/search-dialog"))
        {
            Cmssearchresults1.PagerPosition = CMS.Controls.PagingPlaceTypeEnum.Top;
            plcSearchDialog.Visible = true;
        }
        else if (aliasPath.EndsWith("/search-dialog-with-results"))
        {
            plcSearchResults.Visible = false;

            plcSearchDialogWithResults.Visible = true;
        }
        else if (aliasPath.EndsWith("/search-results"))
        {
            plcSearchResults.Visible = true;
            lblSearchResult.Visible = true;
            plcSearchBox.Visible = true;
        }
        else if (aliasPath.EndsWith("/smart-search-box"))
        {
            plcSmartSearchBox.Visible = true;
            plcSmartSearchResults.Visible = true;
            plcSearchResults.Visible = false;
        }
        else if (aliasPath.EndsWith("/smart-search-dialog"))
        {
            plcSmartSearchDialog.Visible = true;
            plcSmartSearchResults.Visible = true;
            plcSearchResults.Visible = false;
        }
        else if (aliasPath.EndsWith("/smart-search-dialog-with-results"))
        {
            plcSmartSearchDialogWithResults.Visible = true;
            plcSearchResults.Visible = false;
        }
        else if (aliasPath.EndsWith("/smart-search-filter"))
        {
            srchDialog.ResultWebpartID = ValidationHelper.GetString(srchResults.GetValue("WebPartControlID"), srchResults.ClientID);
            plcSmartSearchResults.Visible = true;
            srchResults.DocumentTypes = "CMS.Laptop;CMS.CellPhone;CMS.Pda;CMS.Product";
            plcSmartSearchDialog.Visible = true;

            plcSmartFilter.Visible = true;
            plcSearchResults.Visible = false;

            // Product type filter
            srchFilter.FilterValues = ";;All\r\n+classname;cms.cellphone;Cell phones\r\n+classname;cms.laptop;Laptops\r\n+classname;cms.pda;PDAs";
            srchFilter.FilterMode = SearchFilterModeEnum.RadioButton;
            srchFilter.SearchWebpartID = ValidationHelper.GetString(srchDialog.GetValue("WebPartControlID"), srchDialog.ClientID);

            // Sort filter
            srchSortFilter.FilterValues = "##SCORE##;;Score (Default)\r\n documentcreatedwhen;;Creation date";
            srchSortFilter.FilterAutoPostback = true;
            srchSortFilter.FilterIsConditional = false;
            srchSortFilter.SearchWebpartID = ValidationHelper.GetString(srchDialog.GetValue("WebPartControlID"), srchDialog.ClientID);

            DateTime now = DateTime.Now;

            // Date filter
            srchDateFilter.FilterValues = ";;Anytime\r\n" +
                                            "+_created;[" + DateTools.DateToString(now.AddDays(-7), DateTools.Resolution.SECOND) + " TO " + DateTools.DateToString(now, DateTools.Resolution.SECOND) + "];Past week\r\n" +
                                            "+_created;[" + DateTools.DateToString(now.AddDays(-30), DateTools.Resolution.SECOND) + " TO " + DateTools.DateToString(now, DateTools.Resolution.SECOND) + "];Past 30 days\r\n" +
                                            "+_created;[" + DateTools.DateToString(now.AddYears(-1), DateTools.Resolution.SECOND) + " TO " + DateTools.DateToString(now, DateTools.Resolution.SECOND) + "];Past year";
            srchDateFilter.FilterMode = SearchFilterModeEnum.DropdownList;
            srchDateFilter.SearchWebpartID = ValidationHelper.GetString(srchDialog.GetValue("WebPartControlID"), srchDialog.ClientID);

        }
        else if (aliasPath.EndsWith("/smart-search-results"))
        {
            plcSmartSearchResults.Visible = true;
            plcSmartSearchBox.Visible = true;
            lblSmartSearchResult.Visible = true;
            plcSearchResults.Visible = false;
        }
        else if (aliasPath.EndsWith("/did-you-mean"))
        {
            plcSearchResults.Visible = false;
            plcSmartSearchDialog.Visible = true;
            plcDidYouMean.Visible = true;
            DidYouMean.Text = ResHelper.GetString("search.didyoumean");
            plcSmartSearchResults.Visible = true;
        }
    }

}
