using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Reporting : TemplatePage
{
    /// <summary>
    /// OnInit
    /// </summary>
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Report1.ReportName = "RecentlyModifiedDocuments";
        Report1.ReloadData();
    }
}
