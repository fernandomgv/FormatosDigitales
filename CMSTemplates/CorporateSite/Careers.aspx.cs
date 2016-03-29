using System;
using System.Web;

using CMS.UIControls;
using CMS.CMSHelper;

public partial class CMSTemplates_CorporateSiteASPX_Careers : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CMSContext.CurrentDocument != null && CMSContext.CurrentDocument.NodeClassName.ToLower() != "cms.job")
        {
            pnlCareers.Style.Add("margin-bottom", "20px");
        }
    }
}
