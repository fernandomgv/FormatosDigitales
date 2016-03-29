using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_CommunityServices : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/google-video"))
        {
          plcGoogle.Visible = true;
        }
        else if (aliasPath.EndsWith("/youtube-video"))
        {
            plcYouTube.Visible = true;
        }

        else if (aliasPath.EndsWith("/social-bookmarking"))
        {
            plcSocialBookmarking.Visible = true;
        }
    }
}
