using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_Wiki : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Show only for document type "cms.menuitem"
        if (CMSContext.CurrentDocument != null)
        {
            if (CMSContext.CurrentDocument.NodeClassName.ToLower() == "cms.menuitem")
            {
                plcMyContributions.Visible = true;
            }
        }
    }
}
