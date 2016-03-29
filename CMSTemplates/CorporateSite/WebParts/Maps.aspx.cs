using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Maps : TemplatePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/google-maps"))
        {
            this.plcGoogleMaps.Visible = true;
        }
        else if (aliasPath.EndsWith("/bing-maps"))
        {
            this.plcBingMaps.Visible = true;
        }
        else if (aliasPath.EndsWith("/yahoo-maps"))
        {
            this.plcYahooMaps.Visible = true;
        }
    }
}
