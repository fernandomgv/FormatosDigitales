using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;
using CMS.GlobalHelper;

public partial class CMSTemplates_CorporateSiteASPX_News : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CMSContext.CurrentDocument != null && CMSContext.CurrentDocument.NodeClassName.ToLower() != "cms.news")
        {
            wpcBreadCrumbs.Visible = false;
            pnlNews.Style.Add("margin-bottom", "20px");
        }
    }
}
