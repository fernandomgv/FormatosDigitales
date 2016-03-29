using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_AbuseReport : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/inline-abuse-report"))
        {
            plcInlineAbuseReport.Visible = true;
        }
        else if (aliasPath.EndsWith("/abuse-report"))
        {
            plcAbuseReport.Visible = true;
        }
    }
}
