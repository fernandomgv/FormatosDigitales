using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using CMS.UIControls;
using CMS.GlobalHelper;

public partial class CMSTemplates_CorporateSiteASPX_ControlsExamples_controlsmenu : ControlsExamplesPage
{
    protected void Page_Load(Object sender, EventArgs e)
    {
        if (!RequestHelper.IsPostBack())
        {
            Menu1.DataSource = Server.MapPath("menu.xml");
            Menu1.CssClass = "menustyle";
            Menu1.DefaultMouseOverCssClass = "menustyleover";
            Menu1.DefaultTarget = "desktop";
            Menu1.HighlightTopMenu = true;
            Menu1.DataBind();
            Menu1.Cursor = CMS.skmMenuControl.MouseCursor.Pointer;
        }
    }
}
