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

public partial class CMSWebParts_SPATS_SMSNotificacionSender : CMSAbstractWebPart
{
    #region "Properties"

    protected int TerritorioID
    {
        get
        {
            return ((CMS.TreeEngine.TreeNode)CMSContext.CurrentDepartment).DocumentID;
        }
    }
    protected string Territorionombre
    {
        get
        {
            return ((CMS.TreeEngine.TreeNode)CMSContext.CurrentDepartment).DocumentName;
        }
    }
    #endregion
    private void cargarnotificaciones()
    {
        GeneralConnection cn = ConnectionHelper.GetConnection();
        //dataset con los usuarios a notificar
        DataSet Notificaciones = new DataSet();

        QueryDataParameters parameters = new QueryDataParameters();

        parameters.Add("@TerritorioID", ValidationHelper.GetString(this.TerritorioID.ToString(),""));
        parameters.Add("@Wheretexto", ValidationHelper.GetString(this.TextBox1.Text, ""));
        parameters.Add("@fechainicio", ValidationHelper.GetDateTime(this.TextBox2.Text,  DateTime.Parse("01/01/2014")));
        parameters.Add("@fechafin", ValidationHelper.GetDateTime(this.TextBox3.Text, DateTime.MaxValue));

        Notificaciones = ConnectionHelper.ExecuteQuery("customtable.SPATS_Notificacion_SMS.GetSMSNotificacionesWhere", parameters);

        this.GrdNotificaciones.DataSource = Notificaciones;

        this.DataBind();

        this.DataBindChildren();

        this.GrdNotificaciones.DataBind();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!RequestHelper.IsPostBack())
        {
            this.ddlTerritorio.Items.Clear();
            this.ddlTerritorio.Items.Add(new ListItem(this.Territorionombre, this.TerritorioID.ToString()));
            ManagePaneles(false);
        }
        cargarnotificaciones();
    }

    protected void sqlnotificaciones_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters["@fechainicio"].Value = DBNull.Value;
        e.Command.Parameters["@fechafin"].Value = DBNull.Value;
    }
    protected void sqlnotificaciones_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        this.TextBox1.Text = e.AffectedRows.ToString();
    }
    protected void BtnNuevo_Click(object sender, EventArgs e)
    {
        ManagePaneles(true);
        LblNotificaciones.Visible = false;
    }
    protected void BtnCancelar_Click(object sender, EventArgs e)
    {
        ManagePaneles(false);
    }
    protected void ManagePaneles(bool opc)
    {
        this.PnlNuevo.Visible = opc;
        this.PnlGrid.Visible = !opc;
    }
    protected void BtnEnviar_Click(object sender, EventArgs e)
    {
        //encolar notificaciones para todos los usuarios pertenecientes al territorio actual
        /********REgistrando inicio del proceso de pronostico********/
        EventLogProvider ev = new EventLogProvider();
        ev.LogEvent(EventLogProvider.EVENT_TYPE_INFORMATION, DateTime.Now, "CreateSMSNotificaciones", "Execute", null, "Generando Notificaciones.");
      //*********procesando usuarios por territorio
        GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet USERSMS_cola = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();
            parameters.Add("@TerritorioID", ValidationHelper.GetString(this.TerritorioID.ToString(), ""));
            USERSMS_cola = ConnectionHelper.ExecuteQuery("customtable.SPATS_Notificacion_SMS.GetUserByTerritorioID", parameters);
            String UsuariosSinCell = "";
            if (USERSMS_cola.Tables[0] != null)
            {
                /***************   Realizar en envio de SMS ******************/

                foreach (DataRow sms_item in USERSMS_cola.Tables[0].Rows)
                {
                    if ((sms_item["CelularNotificacion"].ToString() == ""))
                    {
                        string cad = "[ UserID:"+sms_item["UserID"].ToString() + " Nombre: " +sms_item["fullname"].ToString();
                        if (UsuariosSinCell == "")
                        { UsuariosSinCell = cad; }
                        else { UsuariosSinCell = UsuariosSinCell + cad; }
                    }
                    else
                    {
                        //procedemos a insertar una nueva notificacion
                    string className = "customtable.SPATS_Notificacion_SMS"; // cultivouser.ClassName;
                    CustomTableItem Notificacion_SMS = null;
                        CustomTableItemProvider provider = new CustomTableItemProvider(CMSContext.CurrentUser);
                        Notificacion_SMS = new CustomTableItem(className, provider);
                        Notificacion_SMS.SetValue("UserID", ValidationHelper.GetInteger(sms_item["UserID"].ToString(),0));
                        Notificacion_SMS.SetValue("mensaje", this.TxtMensaje.Text);
                        Notificacion_SMS.SetValue("Estado", 0);
                        Notificacion_SMS.SetValue("NumeroOrigen", "51975523380");
                        Notificacion_SMS.SetValue("Celldestino", sms_item["CelularNotificacion"].ToString());
                        Notificacion_SMS.SetValue("FechaHoraparaEnviar", ValidationHelper.GetDateTime(this.TxtProgramado.Text,DateTime.Now));
                        Notificacion_SMS.SetValue("TerritorioID", this.TerritorioID.ToString());

                        if (Notificacion_SMS.OrderEnabled)
                        {
                            Notificacion_SMS.ItemOrder = provider.GetLastItemOrder(className) + 1;
                        }
                        Notificacion_SMS.Insert();
                    }
                }
                string csCrLf = "\r\n";
                string csKeyTab = "\t";
                if (!(UsuariosSinCell==""))
                {
                    this.LblNotificaciones.Text = "Los siguientes usarios no tienen asignado un [Numero Celular]:" + csCrLf + csKeyTab + UsuariosSinCell;
                    this.BtnEnviar.Enabled = false;
                }
                this.ManagePaneles(false);
                this.cargarnotificaciones();
            }
    }
}
