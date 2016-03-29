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

public partial class CMSTemplates_CorporateSiteASPX_ControlsExamples_BasicTabControl : ControlsExamplesPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[,] tabs = new string[3, 7];
        tabs[0, 0] = "&nbsp;Home&nbsp;";
        tabs[0, 1] = "alert('It is very simple!');";
        tabs[0, 2] = "http://www.kentico.com";
        tabs[1, 0] = "&nbsp;Products&nbsp;";
        tabs[1, 2] = "http://www.comparesql.com";
        tabs[2, 0] = "&nbsp;Contact&nbsp;";
        tabs[2, 2] = "http://www.syncserverfiles.com";
        tabs[2, 3] = "Some tooltip";
        BasicTabControl1.Tabs = tabs;
        BasicTabControl1.SelectedTab = 0;
        BasicTabControl1.UrlTarget = "_blank";
        BasicTabControl1.UseClientScript = true;
    }
}
