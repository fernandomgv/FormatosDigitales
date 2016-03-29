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

using CMS.UIControls;
using CMS.GlobalHelper;

public partial class CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSListMenu : ControlsExamplesPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (BrowserHelper.IsIE6())
        {
            this.Horizontal1.HoverCSSClassName = "HoverClass";
            this.Vertical.HoverCSSClassName = "HoverClass";
        }
    }
}
