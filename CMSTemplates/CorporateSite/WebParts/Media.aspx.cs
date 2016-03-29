using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Media : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/flash"))
        {
            plcFlash.Visible = true;
        }
        else if (aliasPath.EndsWith("/video"))
        {
            plcVideo.Visible = true;
        }
        else if (aliasPath.EndsWith("/quicktime"))
        {
            plcQuickTime.Visible = true;
        }
        else if (aliasPath.EndsWith("/realmedia"))
        {
            plcRealMedia.Visible = true;
        }
    }
}
