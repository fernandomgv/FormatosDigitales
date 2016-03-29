using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_News : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/latest-news"))
        {
          plcLatestNews.Visible = true;
        }
        else if (aliasPath.EndsWith("/news-list"))
        {
            plcNewsList.Visible = true;
        }
        else if (aliasPath.EndsWith("/scrolling-news"))
        {
            plcScrollingNews.Visible = true;
            ScrollingText1.ReloadData();
        }
    }
}
