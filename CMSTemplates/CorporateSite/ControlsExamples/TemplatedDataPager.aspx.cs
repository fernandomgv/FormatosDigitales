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

using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_ControlsExamples_TemplatedDataPager : ControlsExamplesPage
{
    public string pageCount = "1";
    public string previousPage = "1";
    public string nextPage = "1";


    /// <summary>
    /// OnInit override
    /// </summary>
    protected override void OnInit(EventArgs e)
    {
        // Disable repeater pager and databindbydefault
        CMSRepeater1.EnablePaging = false;
        CMSRepeater1.DataBindByDefault = false;

        base.OnInit(e);
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        // Get repeater datasource
        TemplateDataPager1.DataSource = CMSRepeater1.DataSource;

        // Set page size
        TemplateDataPager1.PageSize = 1;

        // Set current page from query string
        TemplateDataPager1.CurrentPage = ValidationHelper.GetInteger(Request.QueryString["Page"], 1);

        // Get page count for last link 
        pageCount = TemplateDataPager1.PageCount.ToString();

        // Set default next page link
        nextPage = pageCount;

        // Set previous link
        if ((TemplateDataPager1.CurrentPage - 1) >= 1)
        {
            previousPage = ((int)(TemplateDataPager1.CurrentPage - 1)).ToString();
        }

        // Set next link
        if ((TemplateDataPager1.CurrentPage) <= (TemplateDataPager1.PageCount - 1))
        {
            nextPage = ((int)(TemplateDataPager1.CurrentPage + 1)).ToString();
        }

        // Set paged datasource to the repeater and databind it
        CMSRepeater1.DataSource = TemplateDataPager1.PagedData;
        if (!DataHelper.DataSourceIsEmpty(CMSRepeater1.DataSource))
        {
            CMSRepeater1.DataBind();
        }
    }
}
