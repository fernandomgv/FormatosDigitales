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
using CMS.TreeEngine;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_ControlsExamples_BasicMultiColumnTable : ControlsExamplesPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[,] tableParams = new string[3, 4];
        DataSet notebooksDS = null;


        // set data source
        TreeProvider tree = new TreeProvider(CMSContext.CurrentUser);
        notebooksDS = tree.SelectNodes("CorporateSite", "/%", TreeProvider.ALL_CULTURES, true, "CMS.CellPhone", null, null, -1, true, 4);
        if (!DataHelper.DataSourceIsEmpty(notebooksDS))
        {
            BasicMultiColumnTable1.DataSource = notebooksDS.Tables[0];

            // define table header with product names
            tableParams[0, 0] = "Cellphone:";
            tableParams[0, 1] = "CellName";
            // add row with product description
            tableParams[1, 0] = "Display type:";
            tableParams[1, 1] = "CellDisplayType";
            // add row with product price
            tableParams[2, 0] = "Display resolution:";
            tableParams[2, 1] = "CellDisplayResolution";
            BasicMultiColumnTable1.TableParams = tableParams;
        }
    }
}
