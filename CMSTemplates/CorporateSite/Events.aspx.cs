using System;
using System.Web;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_Events : TemplatePage
{
    protected const string mDatyField = "EventDate";

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((CMSContext.CurrentDocument != null) && (CMSContext.CurrentDocument.NodeClassName.ToLower() == "cms.bookingevent"))
        {
            repEvent.Visible = true;
            repEvent.Path = CMSContext.CurrentDocument.NodeAliasPath;

            object value = DataHelper.GetDataRowValue(CMSContext.CurrentDocument.DataRow, mDatyField);
            if (ValidationHelper.GetDateTime(value, DataHelper.DATETIME_NOT_SELECTED) != DataHelper.DATETIME_NOT_SELECTED)
            {
                EventCalendar.TodaysDate = (DateTime)value;
            }
        }
    }
}
