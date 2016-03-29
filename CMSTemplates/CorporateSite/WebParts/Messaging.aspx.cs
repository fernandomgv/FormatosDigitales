using System;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Messaging : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/contact-list"))
        {
            plcContactList.Visible = true;
        }
        else if (aliasPath.EndsWith("/ignore-list"))
        {
            plcIgnoreList.Visible = true;
        }
        else if (aliasPath.EndsWith("/inbox"))
        {
            plcInbox.Visible = true;
        }
        else if (aliasPath.EndsWith("/outbox"))
        {
            plcOutbox.Visible = true;
        }
        else if (aliasPath.EndsWith("/my-messages"))
        {
            plcMyMessages.Visible = true;
        }
        else if (aliasPath.EndsWith("/send-message"))
        {
            plcSendMessage.Visible = true;
        }
        else if (aliasPath.EndsWith("/messaging-info-panel"))
        {
            plcMessagingInfoPanel.Visible = true;
        }
    }
}
