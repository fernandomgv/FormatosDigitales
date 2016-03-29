using System;
using System.Web;

using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_SpecialPages_MyAccount : TemplatePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.MyAccount.ReloadData();
    }
}
