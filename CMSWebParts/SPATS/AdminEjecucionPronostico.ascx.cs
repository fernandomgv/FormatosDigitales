using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using CMS.PortalControls;
using CMS.GlobalHelper;
using SMSNotification;
using CMS.SettingsProvider;
using CMS.CMSHelper;

using CMS.DatabaseHelper;
using CMS.DataEngine;
using CMS.SettingsProvider;

using CMS.EventLog;
using CMS.Scheduler;
using CMS.SiteProvider;

public partial class CMSWebParts_SPATS_AdminEjecucionPronostico : CMSAbstractWebPart
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //this.SqlDataSource1.SelectParameters[0].DefaultValue =
        e.Command.Parameters[0].Value = CMSContext.CurrentDepartment.DocumentID.ToString();
        //this.GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HyperLink link = (HyperLink)e.Row.FindControl("HyperLink1");
            link.NavigateUrl = CMSContext.CurrentDocumentParent.NodeAliasPath + "/Administrar-Ejecucion-de-Pronosticos-Detalle.aspx?ItemId=" + ((DataRowView)e.Row.DataItem)["ItemId"];
            
        }
    }
}
