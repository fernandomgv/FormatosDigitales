using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_UserContributions : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/contribution-list"))
        {
            plcContributionList.Visible = true;
        }
        else if (aliasPath.EndsWith("/edit-contribution"))
        {
            plcEditContribution.Visible = true;
        }
    }
}
