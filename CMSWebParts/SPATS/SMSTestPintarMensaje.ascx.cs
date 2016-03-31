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


public partial class CMSWebParts_SPATS_SMSTestPintarMensaje : CMSAbstractWebPart

{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = TextBox1.Text;
        TextBox1.Text = "";     

    }
}
