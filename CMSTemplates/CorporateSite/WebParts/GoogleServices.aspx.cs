using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_GoogleServices : TemplatePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/google-analytics"))
        {
            this.plcGoogleAnalytics.Visible = true;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }
}
