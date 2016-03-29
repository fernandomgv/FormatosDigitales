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

public partial class CMSWebParts_SPATS_AdminEjecucionPronosticoDetalle : CMSAbstractWebPart
{
    private int mItemID;
    protected int ItemID
    {
        get
        {
            return ValidationHelper.GetInteger(Session["mItemID"], 0);
        }
        set
        {
            Session["mItemID"] = value;
        }
    }
    protected string AnalisisComentario
    {
        get
        {
            return ValidationHelper.GetString(Session["mAnalisisComentario"], "");
        }
        set
        {
            Session["mAnalisisComentario"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
            this.GridView1.DataBind();
        //}
    }
    private void UpdateSPATS_Ejecucion_Pronostico_Detalle(int ItemID, string PreAlertaSMS)
    {
        try
        {

            GeneralConnection cn = ConnectionHelper.GetConnection();

            QueryDataParameters parameters = new QueryDataParameters();
            parameters.Add("@ItemID", ItemID);
            parameters.Add("@PreAlertaSMS", PreAlertaSMS);

            ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico_Detalle.UpdateSPATS_Ejecucion_Pronostico_PreAlerta", parameters);
        }
        catch (Exception e)
        {
            GenLogNotificacion("Error al ejecutar UpdateSPATS_Ejecucion_Pronostico_PreAlerta, ItemID: " + ItemID.ToString() + "PreAlertaSMS: " + PreAlertaSMS.ToString() + e.Message);

        }
    }

    protected DataSet GetEjecucion_Pronostico_Detalle_CondicionClimatica(int ID)
    {
        GeneralConnection cn = ConnectionHelper.GetConnection();
        //dataset con los usuarios a notificar
        DataSet condicionesclimaticas = new DataSet();

        QueryDataParameters parameters = new QueryDataParameters();

        parameters.Add("@EjecucionPronosticoDetalleID", ID);
        condicionesclimaticas = ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico_Detalle_CondicionClimat.GetEjecucionPronosticoDetalleCondicionClimativabyID", parameters);

        return condicionesclimaticas;        
    }
    protected DataSet GetEjecucion_Pronostico_Detalle_Analisis(int ID)
    {
        GeneralConnection cn = ConnectionHelper.GetConnection();
        //dataset con los usuarios a notificar
        DataSet Analisis = new DataSet();

        QueryDataParameters parameters = new QueryDataParameters();

        parameters.Add("@EjecucionPronosticoDetalleID", ID);
        Analisis = ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico_Detalle_AnalisisEspecia.GetAnalisisByEjecucionPronosticoDetalleID", parameters);

        return Analisis;
    }
    protected int GetBaseConocimientoIDBY_Pronostico_Detalle_Analisis(int ID)
    {
        GeneralConnection cn = ConnectionHelper.GetConnection();
        //dataset con los usuarios a notificar
        DataSet PronosticoDetalle = new DataSet();

        QueryDataParameters parameters = new QueryDataParameters();

        parameters.Add("@ID", ID);
        PronosticoDetalle = ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico_Detalle.select", parameters);

        if (!DataHelper.DataSourceIsEmpty(PronosticoDetalle)) 
        {
            return ValidationHelper.GetInteger(PronosticoDetalle.Tables[0].Rows[0]["BaseConocimientoID"],0);
        }
        else
        { return 0; }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GridView gdcondiciones = (GridView)e.Row.FindControl("GridView2");
            gdcondiciones.DataSource = GetEjecucion_Pronostico_Detalle_CondicionClimatica(ValidationHelper.GetInteger(((DataRowView)e.Row.DataItem)["ItemId"],0));
            gdcondiciones.DataBind();

            GridView gdanalisis = (GridView)e.Row.FindControl("GridView3");
            gdanalisis.DataSource = GetEjecucion_Pronostico_Detalle_Analisis(ValidationHelper.GetInteger(((DataRowView)e.Row.DataItem)["ItemId"], 0));
            gdanalisis.DataBind();

            string NombreRoleAnalista = CMSContext.CurrentDepartment.DocumentName + "AnalistaCondicionClimatica";
            Button btnregistrar = (Button)e.Row.FindControl("Button1");
            btnregistrar.Enabled = false;
            if (CMSContext.CurrentUser.IsInRole(NombreRoleAnalista, CMSContext.CurrentSiteName))
            {
                btnregistrar.Enabled = true;
            }

            string NombreRoleSupervisor = CMSContext.CurrentDepartment.DocumentName + "SupervisorAlertas";
            Button btnEnviarAlerta = (Button)e.Row.FindControl("BtnEnviarAlerta");
            btnEnviarAlerta.Enabled = false;
            if (CMSContext.CurrentUser.IsInRole(NombreRoleSupervisor, CMSContext.CurrentSiteName))
            {
                btnEnviarAlerta.Enabled = true;
            }
            
            ////btnregistrar.Click += new EventHandler(Button1_Click);
        }
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    int ItemId = ValidationHelper.GetInteger(GridView1.SelectedDataKey["ItemID"], 0);
    //    HtmlTextArea TextArea1 = (HtmlTextArea)GridView1.SelectedRow.FindControl("TextArea1");
    //}
    protected void insertanalisis(int EjecucionPronosticoDetalleID, string analisis)
    {
        string className = "customtable.SPATS_Ejecucion_Pronostico_Detalle_AnalisisEspecia"; // cultivouser.ClassName;
        CustomTableItem AnalisisTB = null;
        CustomTableItemProvider provider = new CustomTableItemProvider(CMSContext.CurrentUser);
        AnalisisTB = new CustomTableItem(className, provider);
        AnalisisTB.SetValue("EjecucionPronosticoDetalleID", EjecucionPronosticoDetalleID);
        AnalisisTB.SetValue("UserID", CMSContext.CurrentUser.UserID);
        AnalisisTB.SetValue("Analisis", analisis);
        if (AnalisisTB.OrderEnabled)
        {
            AnalisisTB.ItemOrder = provider.GetLastItemOrder(className) + 1;
        }
        AnalisisTB.Insert();
    }
    protected void GetModal(ref Panel pnl)
    {
        this.fondo.Attributes["style"]="position:fixed;width:100%;height:100%;top:0px;left:0px;background-image:url('~/App_Themes/REC/REC_imagenes/black.png');z-index:2;display:block";
        this.fondo.Visible = true;
        pnl.Attributes["style"] = "position:fixed; top:50%; left:50%; width:30em; height:20em; margin-top: -9em; margin-left: -15em; z-index:3; border:1px solid #5D7B9D; padding:0px; background-color:#F7F6F3; display:block;";
        pnl.Visible = true;
    }
    protected void CloseModal(ref Panel pnl)
    {
        this.fondo.Visible = false;
        pnl.Visible = false;
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Registrar")
        {
            int rowindex = ValidationHelper.GetInteger(e.CommandArgument,0);
            int ItemId = ValidationHelper.GetInteger(GridView1.DataKeys[rowindex][0], 0);
            this.ItemID = ItemId;
            GetModal(ref this.PnlAnalisis);
        }
        if (e.CommandName == "EnviarAlerta")
        {
            int rowindex = ValidationHelper.GetInteger(e.CommandArgument, 0);
            int ItemId = ValidationHelper.GetInteger(GridView1.DataKeys[rowindex][0], 0);
            this.ItemID = ItemId;
            HtmlTextArea preAlerta = (HtmlTextArea)GridView1.Rows[rowindex].FindControl("TxtAlerta");
            Label lblerror = (Label)GridView1.Rows[rowindex].FindControl("lblprealertaerror");
            string SmsPreAlerta =preAlerta.Value;
            if (SmsPreAlerta.Length < 20 || SmsPreAlerta.Length > 160)
            {
                
                lblerror.Visible = true;
                lblerror.Text = "Revise la Alerta a enviar, estta debe tener entre 20 y 160 caracteres, actualmente su Alerta tiene " + SmsPreAlerta.Length + " caracteres";
            }
            else
            {
                lblerror.Visible = false;
                lblerror.Text = "";

                int BaseConocimientoID = this.GetBaseConocimientoIDBY_Pronostico_Detalle_Analisis(ItemId);
                this.GenAlertabyBaseConocimientoID(BaseConocimientoID, SmsPreAlerta);
                this.UpdateSPATS_Ejecucion_Pronostico_Detalle(ItemId, SmsPreAlerta);

            }

           // GetModal(ref this.PnlAnalisis);
            //aqui insertar el codigo para el envio de la alerta, 
            //debemos obtener previamente el mensaje de alerta, desde la grilla
            //y debemos ontener ademas la base de conocimiento ID
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string analisis = this.TxtAnalisis.Value;
        if (!string.IsNullOrEmpty(analisis))
        {
            insertanalisis(this.ItemID, analisis);            
            GridView1.DataBind();
            CloseModal(ref PnlAnalisis);
        }
    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editar")
        {
            int rowindex = ValidationHelper.GetInteger(e.CommandArgument, 0);
            int ItemId = ValidationHelper.GetInteger(((GridView)sender).DataKeys[rowindex][0], 0);            
            this.ItemID = ItemId;
            this.TxtAnalisis.Value = ValidationHelper.GetString(((GridView)sender).DataKeys[rowindex][1], "");
            GetModal(ref this.PnlAnalisis);
            this.OnLoad( new EventArgs());
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
        CloseModal(ref PnlAnalisis);
    }
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            ImageButton BtnEditar = (ImageButton)e.Row.FindControl("BtnEditar");
            BtnEditar.Enabled = false;
            BtnEditar.ImageUrl = "~/App_Themes/REC/REC_imagenes/Edit_off.png";
            ImageButton BtnEliminar = (ImageButton)e.Row.FindControl("BtnEliminar");
            BtnEliminar.Enabled = false;
            BtnEliminar.ImageUrl = "~/App_Themes/REC/REC_imagenes/Delete_off.png";
            

            if (CMSContext.CurrentUser.UserID == ValidationHelper.GetInteger(((System.Data.DataRowView)(e.Row.DataItem)).Row["UserID"], 0))
            {
                BtnEditar.Enabled = true;
                BtnEditar.ImageUrl = "~/App_Themes/REC/REC_imagenes/Edit.png";
                BtnEliminar.Enabled = true;
                BtnEliminar.ImageUrl = "~/App_Themes/REC/REC_imagenes/Delete.png";

            }

            

            ////btnregistrar.Click += new EventHandler(Button1_Click);
        }
    }
    protected void BtnEnviarAlerta_Click(object sender, EventArgs e)
    {

    }

    private void GenAlertabyBaseConocimientoID(int BaseConocimientoID, string AlertaSMS)
    {
        //encolar notificaciones para todos los usuarios pertenecientes al territorio actual
        /********REgistrando inicio del proceso de pronostico********/
        EventLogProvider ev = new EventLogProvider();
        ev.LogEvent(EventLogProvider.EVENT_TYPE_INFORMATION, DateTime.Now, "CreateSMSNotificaciones", "Execute", null, "Generando Notificaciones.");
        //*********procesando usuarios por territorio
        GeneralConnection cn = ConnectionHelper.GetConnection();
        DataSet USERSMS_cola = new DataSet();
        QueryDataParameters parameters = new QueryDataParameters();
        parameters.Add("@BaseConocimientoID", BaseConocimientoID);
        USERSMS_cola = ConnectionHelper.ExecuteQuery("customtable.Base_Conocimiento.GetUserByBaseConocimientoID", parameters);
        String UsuariosSinCell = "";
        if (USERSMS_cola.Tables[0] != null)
        {
            /***************   Realizar en envio de SMS ******************/

            foreach (DataRow sms_item in USERSMS_cola.Tables[0].Rows)
            {
                if ((sms_item["CelularNotificacion"].ToString() == ""))
                {
                    string cad = "[ UserID:" + sms_item["UserID"].ToString() + " Nombre: " + sms_item["fullname"].ToString();
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
                    Notificacion_SMS.SetValue("UserID", ValidationHelper.GetInteger(sms_item["UserID"].ToString(), 0));
                    //Notificacion_SMS.SetValue("mensaje", sms_item["AlertaSMS"].ToString());
                    Notificacion_SMS.SetValue("mensaje", AlertaSMS);
                    Notificacion_SMS.SetValue("Estado", 0);
                    Notificacion_SMS.SetValue("NumeroOrigen", "51975523380");
                    Notificacion_SMS.SetValue("Celldestino", sms_item["CelularNotificacion"].ToString());
                    Notificacion_SMS.SetValue("FechaHoraparaEnviar", DateTime.Now);
                    Notificacion_SMS.SetValue("TerritorioID", sms_item["TerritorioId"].ToString());

                    if (Notificacion_SMS.OrderEnabled)
                    {
                        Notificacion_SMS.ItemOrder = provider.GetLastItemOrder(className) + 1;
                    }
                    Notificacion_SMS.Insert();
                }
            }
            if (!(UsuariosSinCell == ""))
            {
                this.GenLogNotificacion("Los siguientes usuarios no registran numero de celular: " + UsuariosSinCell);
            }
        }
    }
    private void GenLogNotificacion(string msj)
    {
        /********REgistrando inicio del proceso de pronostico********/
        EventLogProvider ev = new EventLogProvider();
        ev.LogEvent(EventLogProvider.EVENT_TYPE_INFORMATION, DateTime.Now, "PronosticosSpats", "Execute", null, msj);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
