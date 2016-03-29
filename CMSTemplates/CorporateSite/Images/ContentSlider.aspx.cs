using System;
using System.Web;

using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_Images_ContentSlider : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ContentSlider.ReloadData();
    }
}
