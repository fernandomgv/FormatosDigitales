using System;
using System.Web;

using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_SpecialPages_Search : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cmscompletesearchdialog.PagesTemplate = "CMS.PagerTransformations.General-Pages";
        cmscompletesearchdialog.CurrentPageTemplate = "CMS.PagerTransformations.General-CurrentPage";
        cmscompletesearchdialog.SeparatorTemplate = "CMS.PagerTransformations.General-PageSeparator";
        cmscompletesearchdialog.FirstPageTemplate = "CMS.PagerTransformations.General-FirstPage";
        cmscompletesearchdialog.LastPageTemplate = "CMS.PagerTransformations.General-LastPage";
        cmscompletesearchdialog.PreviousPageTemplate = "CMS.PagerTransformations.General-PreviousPage";
        cmscompletesearchdialog.NextPageTemplate = "CMS.PagerTransformations.General-NextPage";
        cmscompletesearchdialog.PreviousGroupTemplate = "CMS.PagerTransformations.General-PreviousGroup";
        cmscompletesearchdialog.NextGroupTemplate = "CMS.PagerTransformations.General-NextGroup";
        cmscompletesearchdialog.LayoutTemplate = "CMS.PagerTransformations.General-PagerLayout"; 
    }
}
