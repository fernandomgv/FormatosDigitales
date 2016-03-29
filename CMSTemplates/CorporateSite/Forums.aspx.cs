using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_Forums : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CMSContext.CurrentUser.IsAuthenticated())
        {
            wpcLogin.Visible = false;
        }
    }
}
