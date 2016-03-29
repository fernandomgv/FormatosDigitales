using System;
using System.Web;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Notifications : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();
        if (aliasPath.ToLower().EndsWith("/notifications"))
        {
            this.lblWelcomeText.Text = "Notifications category";
            this.plcWelcome.Visible = true;
            this.plcContentSubscription.Visible = false;
        } if (aliasPath.ToLower().EndsWith("/content-subscription"))
        {
            this.plcWelcome.Visible = false;
            this.plcContentSubscription.Visible = true;
        }
    }
}
