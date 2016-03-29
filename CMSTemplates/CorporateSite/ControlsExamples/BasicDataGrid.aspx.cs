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
using System.Data.SqlClient;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_ControlsExamples_BasicDataGrid : ControlsExamplesPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = TreeHelper.SelectNodes("/%", false, "CMS.CellPhone", "", "CellName", -1, true);

        if (!DataHelper.DataSourceIsEmpty(ds))
        {
            this.BasicDataGrid1.DataSource = ds;
            this.BasicDataGrid1.DataBind();
        }
    }
}
