using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_Print : TemplatePage
{
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);

        MacroResolver resolver = CMSContext.CurrentResolver;

        repeater.Path = resolver.ResolveMacros("{?printpath|/%?}");
        repeater.ClassNames = resolver.ResolveMacros("{?classname|cms.root?}");
        repeater.TransformationName = resolver.ResolveMacros("{?classname|cms.root?}.print");
    }


    protected void Page_Load(object sender, EventArgs e)
    {
    }
}
