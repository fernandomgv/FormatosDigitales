using System;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteAspx_MFSAndina : TemplateMasterPage
{
    #region Eventos

    protected override void CreateChildControls()
    {
        base.CreateChildControls();

        PageManager = CMSPageManager1;
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        ltlTags.Text = HeaderTags;
    }

    #endregion
}