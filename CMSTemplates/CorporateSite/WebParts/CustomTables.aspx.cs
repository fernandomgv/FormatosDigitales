using System;
using System.Web;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_CustomTables : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/custom-table-repeater"))
        {
            plcRepeater.Visible = true;
            CustomTableRepeater.Visible = true;
            CustomTableRepeater.ReloadData();
        }
        else if (aliasPath.EndsWith("/custom-table-datalist"))
        {
            plcList.Visible = true;
            CustomTableDataList.Visible = true;
            CustomTableDataList.ReloadData();
        }
        else if (aliasPath.EndsWith("/custom-table-datagrid"))
        {
            plcGrid.Visible = true;
            CustomTableDataGrid.AllowSorting = true;
            CustomTableDataGrid.Visible = true;
        }
        else if (aliasPath.EndsWith("custom-table-smart-search"))
        {
            plcCustomTableSmartSearch.Visible = true;
        }
    }
}
