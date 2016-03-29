using System;
using System.Web;

using CMS.UIControls;
using CMS.CMSHelper;

public partial class CMSTemplates_CorporateSiteASPX_Examples : TemplatePage
{
    protected string shorterClass = String.Empty;
    protected string largerClass = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (CMSContext.CurrentAliasPath.ToLower().Contains("full-text-search"))
        {
            shorterClass = " forumsExample";
            largerClass = " largeLeftContent";
        }
    }
}
