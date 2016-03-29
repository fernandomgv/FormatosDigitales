using System;
using System.Web;

using CMS.Controls;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_Partners : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check permissions
        ((CMSPageManager)((TemplateMasterPage)this.Page.Master).PageManager).CheckPermissions = true;
    }
}
