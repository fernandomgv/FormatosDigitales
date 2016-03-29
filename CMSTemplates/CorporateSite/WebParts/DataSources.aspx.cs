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
using CMS.UIControls;
using CMS.GlobalHelper;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_DataSources : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/data-source-with-repeater"))
        {
            plcDataSourceRepeater.Visible = true;
            ucRepeater.DataSource = documentsDataSource.DataSource;
            ucRepeater.DataBind();
        }
        else if (aliasPath.EndsWith("/data-source-with-datalist"))
        {
            plcDataSourceDatalist.Visible = true;
            ucDatalist.DataSource = documentsDataSource.DataSource;
            ucDatalist.DataBind();
        }
    }
}
