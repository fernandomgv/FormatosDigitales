using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Newsletters : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/newsletter-subscription"))
        {
            plcNewsletterSubscribtion.Visible = true;
        }
        else if (aliasPath.EndsWith("/newsletter-archive"))
        {
            plcNewsletterArchive.Visible = true;
            NewsletterArchive1.ReloadData();
        }
        else if (aliasPath.EndsWith("/my-subscription"))
        {
            plcMySubscription.Visible = true;
        }
        else if (aliasPath.EndsWith("/unsubscription-request"))
        {
            plcUnsubscription.Visible = true;
            Unsubscription.Visible = true;
        }
    }
}
