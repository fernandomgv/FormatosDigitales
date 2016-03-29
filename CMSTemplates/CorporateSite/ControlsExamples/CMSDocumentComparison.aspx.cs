using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSDocumentComparison : ControlsExamplesPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // define table rows
        string[,] tableParameters = new string[4, 4];

        tableParameters[0, 0] = "Cellphone:";
        tableParameters[0, 1] = "CellName";
        tableParameters[1, 0] = "Display type:";
        tableParameters[1, 1] = "CellDisplayType";
        tableParameters[2, 0] = "Display resolution:";
        tableParameters[2, 1] = "CellDisplayResolution";

        this.CMSDocumentComparison1.TableParams = tableParameters;
        // set CSS styles
        this.CMSDocumentComparison1.BasicMultiColumnTable.TableFirstRowCellCSSClass = "MulticolumnTableFirstRow";
        this.CMSDocumentComparison1.BasicMultiColumnTable.TableFirstColumnCellCssClass = "MulticolumnTableFirstColumnCell";

        this.CMSDocumentComparison1.Path = "/%";
        this.CMSDocumentComparison1.ClassNames = "CMS.CellPhone";
        this.CMSDocumentComparison1.SiteName = "CorporateSite";
    }
}
