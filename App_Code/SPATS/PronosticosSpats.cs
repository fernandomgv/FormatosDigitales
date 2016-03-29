using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;

using CMS.EventLog;
using CMS.Scheduler;

using CMS.DatabaseHelper;
using CMS.DataEngine;
using CMS.SettingsProvider;

using SMSNotification;

using CMS.GlobalHelper;
using CMS.SiteProvider;
using CMS.CMSHelper;

namespace SPTAS
{
    /// <summary>
    /// Sample task class.
    /// </summary>
    public class PronosticosSpats : ITask
    {
        /// <summary>
        /// Executes the task.
        /// </summary>
        /// <param name="ti">Task info</param>
        /// 
        private void GenLogNotificacion(string msj)
        {
            /********REgistrando inicio del proceso de pronostico********/
            EventLogProvider ev = new EventLogProvider();
            ev.LogEvent(EventLogProvider.EVENT_TYPE_INFORMATION, DateTime.Now, "PronosticosSpats", "Execute", null, msj);
   
        }
        private DataRowCollection GetTerritorio()
        {
             DataSet DataSetdata = (DataSet)CMS.CMSHelper.TreeHelper.GetDocuments(CMS.CMSHelper.CMSContext.CurrentSiteName
                                    , "/Modulos-en-Implementacion/%", "es-ES", true, "IntranetPortal.Department", "", "", -1, true, -1);
             if (!DataHelper.DataSourceIsEmpty(DataSetdata))
             {
                 return DataSetdata.Tables[0].Rows;
             }
             else
                 return null;
        }
        private DateTime GenSPATS_Ejecucion_Pronostico(int TerritorioID)
        {
            DateTime FechaEjecucion = DateTime.Now.Date;
            GenSPATS_Ejecucion_Pronostico(TerritorioID,FechaEjecucion);
            return FechaEjecucion;
        }
        private void GenSPATS_Ejecucion_Pronostico(int TerritorioID, DateTime FechaEjecucion)
        {
            
                string Observacion = "Ejecucion generada automaticamente al no encontrar ejecucion programada, esta ejecucion se programa para el: " + FechaEjecucion.ToShortDateString();
                string className = "customtable.SPATS_Ejecucion_Pronostico"; // cultivouser.ClassName;
                CustomTableItem Ejecucion_Pronostico = null;
                CustomTableItemProvider provider = new CustomTableItemProvider(CMSContext.CurrentUser);
                Ejecucion_Pronostico = new CustomTableItem(className, provider);
                Ejecucion_Pronostico.SetValue("TerritorioID", TerritorioID.ToString());
                Ejecucion_Pronostico.SetValue("FechaEjecucion", FechaEjecucion);
                Ejecucion_Pronostico.SetValue("IdEstado", "1");
                Ejecucion_Pronostico.SetValue("Observacion", Observacion);          

                if (Ejecucion_Pronostico.OrderEnabled)
                {
                    Ejecucion_Pronostico.ItemOrder = provider.GetLastItemOrder(className) + 1;
                }
                Ejecucion_Pronostico.Insert();
                
        }
        private int Get_SPATS_Ejecucion_Pronostico(int TerritorioID, DateTime FechaEjecucion)
        {
            GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet pronosticos = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();

            parameters.Add("@TerritorioID", TerritorioID.ToString());
            parameters.Add("@FechaEjecucion", FechaEjecucion);

            pronosticos = ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico.Get_SPATS_Ejecucion_Pronostico", parameters);

            if (pronosticos.Tables[0] != null)
            {
                if (pronosticos.Tables[0].Rows.Count > 0)
                { return ValidationHelper.GetInteger(pronosticos.Tables[0].Rows[0][0], 0); }

            }
            return 0;
        }
        private int GetItemIDbySPATS_Ejecucion_PronosticoDetalle(int TerritorioID, int EjecucionPronosticoID, int BaseconocimientoID)
        {
            GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet pronosticos = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();

            parameters.Add("@TerritorioID", TerritorioID.ToString());
            parameters.Add("@EjecucionPronosticoID", EjecucionPronosticoID);
            parameters.Add("@BaseconocimientoID", BaseconocimientoID);


            pronosticos = ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico_Detalle.GetItemID", parameters);
            
            if (pronosticos.Tables[0] != null)
            {
                if (pronosticos.Tables[0].Rows.Count > 0)
                { return ValidationHelper.GetInteger(pronosticos.Tables[0].Rows[0][0], 0); }
            
            }
            return 0;
        }
        //tabla customtable_SPATS_Ejecucion_Pronostico_Detalle_CondicionClimat 
        // EjecucionPronosticoDetalleID, CondicionClimaticaID, 
        //ReglasCumplida, ValorMinimoR, ValorMaximoR, ValorMedioAcumuladoR, PerioTiempoAcumuladoR, ValorMinimoH, ValorMaximoH, ValorMedioAcumuladoH, 
        //PerioTiempoAcumuladoH, Observacion
        private void GenSPATS_Ejecucion_PronosticoDetalleCondicionClimatica(int EjecucionPronosticoDetalleID, int CondicionClimaticaID, string ReglasCumplida,
          double ValorMinimoR, double ValorMaximoR, double ValorMedioAcumuladoR, double PerioTiempoAcumuladoR,
          string ValorMinimoH, string ValorMaximoH, string ValorMedioAcumuladoH, string PerioTiempoAcumuladoH, 
          string Observacion )
        {
            string className = "customtable.SPATS_Ejecucion_Pronostico_Detalle_CondicionClimat"; // cultivouser.ClassName;
            CustomTableItem Ejecucion_Pronostico_DetalleCC = null;
            CustomTableItemProvider provider = new CustomTableItemProvider(CMSContext.CurrentUser);
            Ejecucion_Pronostico_DetalleCC = new CustomTableItem(className, provider);
            Ejecucion_Pronostico_DetalleCC.SetValue("EjecucionPronosticoDetalleID", EjecucionPronosticoDetalleID);
            Ejecucion_Pronostico_DetalleCC.SetValue("CondicionClimaticaID", CondicionClimaticaID);
            Ejecucion_Pronostico_DetalleCC.SetValue("ReglasCumplida", ReglasCumplida);
            Ejecucion_Pronostico_DetalleCC.SetValue("ValorMinimoR", ValorMinimoR);
            Ejecucion_Pronostico_DetalleCC.SetValue("ValorMaximoR", ValorMaximoR);
            Ejecucion_Pronostico_DetalleCC.SetValue("ValorMedioAcumuladoR", ValorMedioAcumuladoR);
            Ejecucion_Pronostico_DetalleCC.SetValue("PerioTiempoAcumuladoR", PerioTiempoAcumuladoR);
            Ejecucion_Pronostico_DetalleCC.SetValue("ValorMinimoH", ValorMinimoH);
            Ejecucion_Pronostico_DetalleCC.SetValue("ValorMaximoH", ValorMaximoH);
            Ejecucion_Pronostico_DetalleCC.SetValue("ValorMedioAcumuladoH", ValorMedioAcumuladoH);
            Ejecucion_Pronostico_DetalleCC.SetValue("PerioTiempoAcumuladoH", PerioTiempoAcumuladoH);
            Ejecucion_Pronostico_DetalleCC.SetValue("Observacion", Observacion);

            if (Ejecucion_Pronostico_DetalleCC.OrderEnabled)
            {
                Ejecucion_Pronostico_DetalleCC.ItemOrder = provider.GetLastItemOrder(className) + 1;
            }
            try
            {

                Ejecucion_Pronostico_DetalleCC.Insert();
            }
            catch (Exception e)
            {
                GenLogNotificacion("Error al ejecutar GenSPATS_Ejecucion_PronosticoDetalleCondicionClimatica "  + e.Message);

            }
            
        }

        private int GenSPATS_Ejecucion_PronosticoDetalle(int TerritorioID, int EjecucionPronosticoID, int BaseconocimientoID, string ReglasCumplidas, string PreAlerta)
        {
            string className = "customtable.SPATS_Ejecucion_Pronostico_Detalle"; // cultivouser.ClassName;
            CustomTableItem Ejecucion_Pronostico_Detalle = null;
            CustomTableItemProvider provider = new CustomTableItemProvider(CMSContext.CurrentUser);
            Ejecucion_Pronostico_Detalle = new CustomTableItem(className, provider);
            Ejecucion_Pronostico_Detalle.SetValue("TerritorioID", TerritorioID.ToString());
            Ejecucion_Pronostico_Detalle.SetValue("EjecucionPronosticoID", EjecucionPronosticoID);
            Ejecucion_Pronostico_Detalle.SetValue("BaseconocimientoID", BaseconocimientoID);
            Ejecucion_Pronostico_Detalle.SetValue("ReglasCumplidas", ReglasCumplidas);
            Ejecucion_Pronostico_Detalle.SetValue("PreAlerta", PreAlerta);

            if (Ejecucion_Pronostico_Detalle.OrderEnabled)
            {
                Ejecucion_Pronostico_Detalle.ItemOrder = provider.GetLastItemOrder(className) + 1;
            }
            Ejecucion_Pronostico_Detalle.Insert();
            int ItemID = 0;
            ItemID = GetItemIDbySPATS_Ejecucion_PronosticoDetalle(TerritorioID, EjecucionPronosticoID, BaseconocimientoID);
            return ItemID;
        }
        private DataRowCollection GetBaseDeConocimiento(int TerritorioID)
        {
            GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet BaseDeConocimiento = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();

            /******************Recuperamos Reglas de condiciones para plagas por cultivo****************************/
            parameters.Add("@TerritorioID", TerritorioID);
            BaseDeConocimiento = ConnectionHelper.ExecuteQuery("customtable.Base_Conocimiento.GetBaseDeConocimientobyTerritorioID", parameters);

            if (BaseDeConocimiento.Tables[0] != null)
            {
                return BaseDeConocimiento.Tables[0].Rows;
            }
            else
            {
                return null;
            }
        }
        private DateTime    GetFechaInicialLecturas(int TerritorioID)
        {
            GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet pronosticos = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();

            parameters.Add("@TerritorioID", TerritorioID.ToString());
            pronosticos = ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico.GetFechaInicialLecturas", parameters);

            if (pronosticos.Tables[0] != null)
            {
                if (pronosticos.Tables[0].Rows.Count > 0)
                { return ValidationHelper.GetDateTime(pronosticos.Tables[0].Rows[0][0], DateTime.MinValue); }
                else
                {
                    /**********************Generamos una ejeucion de pronostico con la fecha actual***************************/

                    return GenSPATS_Ejecucion_Pronostico(TerritorioID);
                }
            }
            return DateTime.MinValue;
            
        }
        private DataRowCollection GetPronosticos(int TerritorioID,int PeriodoPronosticos)
        {
            GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet pronosticos = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();

            /******************Recuperamos segun programacion la fecha desde que leeremos los pronosticos****************************/
            DateTime FechaInicialLectura;
            FechaInicialLectura = GetFechaInicialLecturas(TerritorioID);
            
            parameters.Add("@TerritorioID", TerritorioID);
            parameters.Add("@PeriodoPronosticos", PeriodoPronosticos);
            pronosticos = ConnectionHelper.ExecuteQuery("customtable.SPATS_Notificacion_SMS.All_Pendiende", parameters);

            if (pronosticos.Tables[0] != null)
            {
                return pronosticos.Tables[0].Rows;
            }
            else
            {
                return null;
            }
        }

        private DataRowCollection GetReglasByBaseConocimientoID(int BaseConocimientoID)
        {
            GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet BaseConocimiento = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();
            parameters.Add("@BaseConocimientoID", BaseConocimientoID);
            BaseConocimiento = ConnectionHelper.ExecuteQuery("customtable.Base_Conocimiento.GetReglasByBaseConocimientoID", parameters);

            if (BaseConocimiento.Tables[0] != null)
            {
                return BaseConocimiento.Tables[0].Rows;
            }
            else
            {
                return null;
            }
        }
        private DataRowCollection GetPronosticosbyCondicionClimaticaID(int BaseConocimientoID, int CondicionClimaticaID, DateTime fechaejecucioninicial, DateTime fechaejecucionfinal)
        {
            GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet BaseHechos = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();
            parameters.Add("@BaseConocimientoID", BaseConocimientoID);
            parameters.Add("@CondicionClimaticaID", CondicionClimaticaID);
            parameters.Add("@fechaejecucioninicial", fechaejecucioninicial);
            parameters.Add("@fechaejecucionfinal", fechaejecucionfinal);

            BaseHechos = ConnectionHelper.ExecuteQuery("customtable.Base_Hechos_Lecturas.GetPronosticosbyCondicionClimaticaID", parameters);

            if (BaseHechos.Tables[0] != null)
            {
                return BaseHechos.Tables[0].Rows;
            }
            else
            {
                return null;
            }
        }
        private void UpdateEstadoBase_Conocimiento_Lecturas(int TerritorioID, DateTime FechaHoraInicialLectura, DateTime FechaHoraFinalLectura)
        {
            try
            {

                GeneralConnection cn = ConnectionHelper.GetConnection();

                QueryDataParameters parameters = new QueryDataParameters();
                parameters.Add("@TerritorioID", TerritorioID);
                parameters.Add("@FechaHoraInicialLectura", FechaHoraInicialLectura);
                parameters.Add("@FechaHoraFinalLectura", FechaHoraFinalLectura);

                ConnectionHelper.ExecuteQuery("customtable.Base_Hechos_Lecturas.UpdateEstadoBase_Conocimiento_Lecturas", parameters);
            }
            catch (Exception e)
            {
                GenLogNotificacion("Error al ejecutar UpdateEstadoBase_Conocimiento_Lecturas, TerritorioId: " + TerritorioID.ToString() + "fechaejecucioninicial: " + FechaHoraInicialLectura.ToString() + " fechaejecucionfinal: " + FechaHoraFinalLectura.ToString() + e.Message);

            }         
        }
        private void UpdateSPATS_Ejecucion_Pronostico_ID(int EjecucionPronosticoID)
        {
            try
            {

                GeneralConnection cn = ConnectionHelper.GetConnection();

                QueryDataParameters parameters = new QueryDataParameters();
                parameters.Add("@EjecucionPronosticoID", EjecucionPronosticoID);
                
                ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico.UpdateSPATS_Ejecucion_Pronostico_ID", parameters);
            }
            catch (Exception e)
            {
                GenLogNotificacion("Error al ejecutar UpdateEstadoBase_Conocimiento_Lecturas, EjecucionPronosticoID: " + EjecucionPronosticoID.ToString() + "fechaejecucioninicial: " + e.Message);

            }
        }
        private void UpdateSPATS_Ejecucion_Pronostico(int EjecucionPronosticoID, DateTime BaseHechoFechaHoraInicial, DateTime BaseHechoFechaHoraFinal)
        {
            try
            {

                GeneralConnection cn = ConnectionHelper.GetConnection();

                QueryDataParameters parameters = new QueryDataParameters();
                parameters.Add("@EjecucionPronosticoID", EjecucionPronosticoID);
                parameters.Add("@BaseHechoFechaHoraInicial", BaseHechoFechaHoraInicial);
                parameters.Add("@BaseHechoFechaHoraFinal", BaseHechoFechaHoraFinal);

                ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico.UpdateSPATS_Ejecucion_Pronostico", parameters);
            }
            catch (Exception e)
            {
                GenLogNotificacion("Error al ejecutar UpdateEstadoBase_Conocimiento_Lecturas, EjecucionPronosticoID: " + EjecucionPronosticoID.ToString() + "fechaejecucioninicial: " + BaseHechoFechaHoraInicial.ToString() + e.Message);

            }
        }
        private void UpdateSPATS_Ejecucion_Pronostico_Detalle_Reglas(int ItemID, string ReglasCumplidas)
        {
            try
            {

                GeneralConnection cn = ConnectionHelper.GetConnection();

                QueryDataParameters parameters = new QueryDataParameters();
                parameters.Add("@ItemID", ItemID);
                parameters.Add("@ReglasCumplidas", ReglasCumplidas);

                ConnectionHelper.ExecuteQuery("customtable.SPATS_Ejecucion_Pronostico_Detalle.UpdateSPATS_Ejecucion_Pronostico_ReglasCumplidas", parameters);
            }
            catch (Exception e)
            {
                GenLogNotificacion("Error al ejecutar UpdateSPATS_Ejecucion_Pronostico_ReglasCumplidas, ItemID: " + ItemID.ToString() + "ReglasCumplidas: " + ReglasCumplidas.ToString() + e.Message);

            }
        }
        private int mPeriodoPronostico=0;
        private int mPeriodoMedicionReal=0;
        public int PeriodoMedicionReal
        {
            get
            {
                if (this.mPeriodoMedicionReal == 0)
                {
                    string siteName = (CMSContext.CurrentSiteName != null ? CMSContext.CurrentSiteName : "");
                    this.mPeriodoMedicionReal = SettingsKeyProvider.GetIntValue(siteName + ".PeriodoMedicionReal");
                }
                return this.mPeriodoMedicionReal;
            }
            set
            {
                this.mPeriodoMedicionReal = value;
            }
        }
        public int PeriodoPronostico
        {
            get
            {
                if (this.mPeriodoPronostico == 0)
                {
                    string siteName = (CMSContext.CurrentSiteName != null ? CMSContext.CurrentSiteName : "");
                    this.mPeriodoPronostico = SettingsKeyProvider.GetIntValue(siteName + ".PeriodoPronostico");
                }
                return this.mPeriodoPronostico;
            }
            set
            {
                this.mPeriodoPronostico = value;
            }
        }

      private DataRowCollection GetUserbyRole(string RoleName)
        {
            GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet users = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();
            parameters.Add("@RoleName", RoleName);
            users = ConnectionHelper.ExecuteQuery("customtable.SPATS_Notificacion_SMS.GetUserByRole", parameters);

            if (users.Tables[0] != null)
            {
                return users.Tables[0].Rows;
            }
            else
            {
                return null;
            }
        }



      private void GenNotificacionEmailPronostico(string urlnotificacion, string RoleName, string Territorio, 
          DateTime FechaInicial, DateTime FechaFinal, string emailTemplateName, string EventName)
      {
          foreach (DataRow sms_item in GetUserbyRole(RoleName))
          {

            string[,] replacements = new string [9,2] ;
            string destinatarios = sms_item["Email"].ToString();
            SendEmailUsingTemplateHelper envio = new SendEmailUsingTemplateHelper();               
           
            replacements[0, 0] = "destinatario";
            replacements[0, 1] = sms_item["fullname"].ToString();
            replacements[1, 0] = "territorio";
            replacements[1, 1] = Territorio;
            replacements[2, 0] = "FechaInicial";
            replacements[2, 1] = FechaInicial.ToShortDateString();
            replacements[3, 0] = "FechaFinal";
            replacements[3, 1] = FechaFinal.ToShortDateString();
            replacements[4, 0] = "urlnotificacion";
            replacements[4, 1] = urlnotificacion;
            envio.SendEmailUsingTemplate(emailTemplateName, destinatarios, replacements,EventName);
          }
      }
        private void GenAlertabyBaseConocimientoID(int BaseConocimientoID)
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
                        Notificacion_SMS.SetValue("mensaje", sms_item["AlertaSMS"].ToString());
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
        private void ProcesaPronosticos(int TerritorioID, string urldetalle, string territorioname)
        {
            try
            {
                /********estableciendo parametros de inicio********/
                int TPeriodoPronostico = this.PeriodoPronostico;  // Valor expresado en horas para establecer el numero de muestras de pronostico a utilizar para la generacion de pronosticos
                int TPeriodoMedicionReal = this.PeriodoMedicionReal;  // Valor expresado en horas para establecer el numero de mediciones reales registradas para la generacion de alertas

                TPeriodoPronostico = (TPeriodoPronostico == 0) ? 120 : TPeriodoPronostico;
                TPeriodoMedicionReal = (TPeriodoMedicionReal == 0) ? 120 : TPeriodoMedicionReal;
                /***********Recuperamos la siguiente ejecucion programada******************/
                DateTime FechaInicialLecturas, FechaFinalLecturas;
                FechaInicialLecturas = this.GetFechaInicialLecturas(TerritorioID);
                FechaFinalLecturas = FechaInicialLecturas.AddHours(TPeriodoPronostico);
                int EjecucionPronosticoID = this.Get_SPATS_Ejecucion_Pronostico(TerritorioID, FechaInicialLecturas);

                /****************leer reglas definidas para el territorio actual****************************/
                // una regla se formula para un Cultivo y una plaga en especifico
                // cada regla se formula en base a los parametros climaticos definidos dentro del territorio
                // se asume una relacion mandatoria en el cumplimiento de la regla
                int tmpexisteriego = 0;
                foreach (DataRow ReglaCultivoPlaga in this.GetBaseDeConocimiento(TerritorioID))
                {
                    //por cada regla que se recupera analizaremos, el cumplimiento de las
                    //condiciones establecidas por cada condicion climatica
                    //recuperamos la definicion de la regla en funcion de las condiciones climaticas
                    int TempNumeroReglas = 0;
                    int TempNumeroReglasCumplidas = 0;
                   
                    int BaseConocimientoID;
                   
                    BaseConocimientoID = ValidationHelper.GetInteger(ReglaCultivoPlaga["BaseConocimientoID"], 0);
                    
                    //Creamos el detalle de la Ejecucion en curso
                    // Un detalle corresponde a una definicion de regla = cultivo + plaga + condiciones climaticas
                    int EjecucionPronosticoDetalleID = this.GenSPATS_Ejecucion_PronosticoDetalle(TerritorioID, EjecucionPronosticoID, BaseConocimientoID, "Ninguna", "Ninguna");
                   

                    foreach (DataRow regla in this.GetReglasByBaseConocimientoID(BaseConocimientoID))
                    {
                        //regla es la definicion de valores para un parametro climatico.
                        string reglacumplidatmp = "";
                        TempNumeroReglas = TempNumeroReglas + 1;
                        int CondicionClimaticaID;
                        int PeriodoTiempoAcumulado;
                        int TempTiempoAcumulado = 0;
                        double ValorMinimoR = 0, ValorMaximoR = 0, ValorMedioAcumuladoR = 0;
                        string ValorMinimoH = "", ValorMaximoH = "", ValorMedioAcumuladoH = "", STempTiempoAcumulado="";
                        DateTime TempFechaAcumulado = DateTime.MinValue;
                        CondicionClimaticaID = ValidationHelper.GetInteger(regla["CondicionClimaticaID"], 0);
                        PeriodoTiempoAcumulado = ValidationHelper.GetInteger(regla["PerioTiempoAcumulado"], 0);
                        ValorMinimoR = ValidationHelper.GetDouble(regla["ValorMinimo"], 0);
                        ValorMaximoR = ValidationHelper.GetDouble(regla["ValorMaximo"], 0);
                        ValorMedioAcumuladoR = ValidationHelper.GetDouble(regla["ValorMedioAcumulado"], 0);
                        string Probabilidad_cumplimiento_regla = "";
                        foreach ( DataRow muestra in this.GetPronosticosbyCondicionClimaticaID(BaseConocimientoID,CondicionClimaticaID,FechaInicialLecturas,FechaFinalLecturas))
                        {
                            double LValormedio = ValidationHelper.GetDouble(muestra["ValorMedio"], 0);
                            double LValorMin = ValidationHelper.GetDouble(muestra["LValorMinimo"], 0);
                            double LValorMax = ValidationHelper.GetDouble(muestra["LValorMaximo"], 0);
                            double porcentaje_cumplimiento = 0;
                            string Probabilidad_cumplimiento = "";
                            
                            //Aqui realizar el calculo de % de cumplimiento de la regla
                            if (LValorMin < ValorMinimoR)
                            {
                                LValorMin = ValorMinimoR;
                            }
                            if (LValorMax > ValorMaximoR)
                            {
                                LValorMax = ValorMaximoR;
                            }
                            porcentaje_cumplimiento = ((LValorMax - LValorMin) / (ValorMaximoR - ValorMinimoR))*100;

                            if ( porcentaje_cumplimiento <25)
                            {
                                Probabilidad_cumplimiento = "Nulo";
                            }
                            else
                            {
                                if ( porcentaje_cumplimiento <45)
                                {
                                    Probabilidad_cumplimiento = "Baja";
                                }
                                else
                                {
                                    if ( porcentaje_cumplimiento <70)
                                {
                                    Probabilidad_cumplimiento = "Media";
                                    
                                }
                                    else
                                    {
                                        Probabilidad_cumplimiento = "Alta";
                                    }
                                }
                            }

                            ///fin calculo de % de cumplimiento/////
                            
                            if (TempFechaAcumulado == DateTime.MinValue) // primera iteracion
                            {
                                TempFechaAcumulado = ValidationHelper.GetDateTime(muestra["FechaHoraInicialLectura"], DateTime.MinValue).Date;
                                
                              //  if ((LValormedio >= ValorMinimoR) && (LValormedio <= ValorMaximoR))
                                if ( (Probabilidad_cumplimiento =="Alta") || (Probabilidad_cumplimiento=="Media")) 
                                {
                                    TempTiempoAcumulado = 24;
                                    Probabilidad_cumplimiento_regla = Probabilidad_cumplimiento;
                                }
                                else
                                {
                                    TempTiempoAcumulado = 0;
                                }

                            }
                            else
                            {
                                if (TempFechaAcumulado.AddHours(24) == ValidationHelper.GetDateTime(muestra["FechaHoraInicialLectura"], DateTime.MinValue).Date)
                                {
                                   // if ((LValormedio >= ValorMinimoR) && (LValormedio <= ValorMaximoR))
                                     if ( (Probabilidad_cumplimiento =="Alta") || (Probabilidad_cumplimiento=="Media")) 
                                    {
                                        TempTiempoAcumulado = TempTiempoAcumulado + 24;
                                        TempFechaAcumulado = TempFechaAcumulado.AddHours(24);
                                        if (Probabilidad_cumplimiento_regla == "")
                                        {
                                            Probabilidad_cumplimiento_regla = Probabilidad_cumplimiento;
                                        }
                                        else
                                        {
                                            if (Probabilidad_cumplimiento_regla != Probabilidad_cumplimiento)
                                            {
                                                Probabilidad_cumplimiento_regla = "Media";
                                                
                                            }
                                            else
                                            {
                                                Probabilidad_cumplimiento_regla = Probabilidad_cumplimiento;
                                            }
                                        }
                                    }
                                    else
                                    {
                                         /// debemos verificar si con el tramo cubirto hasta el momento la regla se cumple///
                                        reglacumplidatmp = "Regla NO cumplida";
                                        if (TempTiempoAcumulado >= PeriodoTiempoAcumulado)
                                        {
                                            TempNumeroReglasCumplidas = TempNumeroReglasCumplidas + 1;
                                            reglacumplidatmp = "Regla cumplida con probabilidad " + Probabilidad_cumplimiento_regla;
                                        }
                                        TempTiempoAcumulado = 0;
                                        TempFechaAcumulado = DateTime.MinValue;
                                        Probabilidad_cumplimiento_regla = "";
                                    }                                 
                                   
                                }
                                else
                                {
                                    reglacumplidatmp = "Regla NO cumplida";
                                    if (TempTiempoAcumulado >= PeriodoTiempoAcumulado)
                                    {
                                        TempNumeroReglasCumplidas = TempNumeroReglasCumplidas + 1;
                                        reglacumplidatmp = "Regla cumplida con probabilidad " + Probabilidad_cumplimiento_regla;
                                    }

                                    TempTiempoAcumulado = 0;
                                    TempFechaAcumulado = DateTime.MinValue;
                                    Probabilidad_cumplimiento_regla = "";
                                }
                            }


                            ValorMinimoH = (ValorMinimoH.Length == 0) ? ValidationHelper.GetDouble(muestra["LValorMinimo"], 0).ToString() : ValorMinimoH + "|" + ValidationHelper.GetDouble(muestra["LValorMinimo"], 0).ToString();
                            ValorMaximoH = (ValorMaximoH.Length == 0) ? ValidationHelper.GetDouble(muestra["LValorMaximo"], 0).ToString() : ValorMaximoH + "|" + ValidationHelper.GetDouble(muestra["LValorMaximo"], 0).ToString();
                            ValorMedioAcumuladoH = (ValorMedioAcumuladoH.Length == 0) ? ValidationHelper.GetDouble(muestra["ValorMedio"], 0).ToString() : ValorMedioAcumuladoH + "|" + ValidationHelper.GetDouble(muestra["ValorMedio"], 0).ToString();
                            STempTiempoAcumulado = (STempTiempoAcumulado.Length == 0) ? ValidationHelper.GetDouble(muestra["ValorMedicionReal"], 0).ToString() : STempTiempoAcumulado + "|" + ValidationHelper.GetDouble(muestra["ValorMedicionReal"], 0).ToString();
                        }
                        /*
                        string reglacumplidatmp = "Regla NO cumplida";
                        if (TempTiempoAcumulado >= PeriodoTiempoAcumulado)
                        {
                            TempNumeroReglasCumplidas = TempNumeroReglasCumplidas + 1;
                            reglacumplidatmp = "Regla cumplida con probabilidad " + Probabilidad_cumplimiento_regla;
                        }
                         */
                        if (reglacumplidatmp == "")
                        {
                            if (TempTiempoAcumulado >= PeriodoTiempoAcumulado)
                            {
                                TempNumeroReglasCumplidas = TempNumeroReglasCumplidas + 1;
                                reglacumplidatmp = "Regla cumplida con probabilidad " + Probabilidad_cumplimiento_regla;
                            }
                        }
                        // fin de recorrido de los pronosticos registrados que cumplen con la definicion de la regla en curso
                        // iniciamos el registro del detalle de ejecucion por condicion climatica
                        // tabla customtable_SPATS_Ejecucion_Pronostico_Detalle_CondicionClimat 
                        // EjecucionPronosticoDetalleID, CondicionClimaticaID, 
                        //ReglasCumplida, ValorMinimoR, ValorMaximoR, ValorMedioAcumuladoR, PerioTiempoAcumuladoR, ValorMinimoH, ValorMaximoH, ValorMedioAcumuladoH, 
                        //PerioTiempoAcumuladoH, Observacion
                        GenSPATS_Ejecucion_PronosticoDetalleCondicionClimatica( EjecucionPronosticoDetalleID, CondicionClimaticaID, reglacumplidatmp, 
                            ValorMinimoR,  ValorMaximoR,  ValorMedioAcumuladoR, PeriodoTiempoAcumulado,
                            ValorMinimoH, ValorMaximoH, ValorMedioAcumuladoH, STempTiempoAcumulado, 
                            "Sin observacion por el momento" );
                        
                    } // fin recorrido de definicion de reglas (condiciones climaticas) por regla

                    //Inicia registro de 
                    double gradocumplimientoregla = 0;
                    if (TempNumeroReglas > 0)
                    {
                        gradocumplimientoregla = (TempNumeroReglasCumplidas / TempNumeroReglas) * 100;
                    }

                    // Aqui debemos actualizar ejecucionpronosticodetalle con la pre-alerta, el envio de la notificacion hacia los
                    // especialistas y hacia el encargado de emitir la alerta, considerar la notificacion via email
                    // y via SMS, considerar el programar los recordatorios.
                    this.UpdateSPATS_Ejecucion_Pronostico_Detalle_Reglas(EjecucionPronosticoDetalleID, TempNumeroReglasCumplidas.ToString() + " de " + TempNumeroReglas.ToString());
                    if (gradocumplimientoregla == 100)
                    {
                        // Generar alerta para ese territorio + Cultivo + Plaga
                       // this.GenAlertabyBaseConocimientoID(BaseConocimientoID);
                        tmpexisteriego = 1;
                    }
                                      

                } // fin de recorrido de definicion de reglas por territorio
                //En este punto generaremos la notificacion con la url para el analisis de los
                //Especialistas (Rol=AnalistaCondicionClimatica) y envio de alertas (Rol=SupervisorAlertas)
                // La notificacion de revision se genera para todo el territorio.
                if (tmpexisteriego == 1)
                {
                    string urlnotificar = urldetalle + EjecucionPronosticoID.ToString();
                    GenNotificacionEmailPronostico(urlnotificar, territorioname + "AnalistaCondicionClimatica", territorioname,
                    FechaInicialLecturas, FechaFinalLecturas, "SPATS_ANALISIS_PRONOSTICO", "SPATS_ANALISIS_PRONOSTICO");
                  
                }
                //Actualizacion de estado, de la programacion ejecutada
                this.UpdateSPATS_Ejecucion_Pronostico(EjecucionPronosticoID, FechaInicialLecturas, FechaFinalLecturas);
                //this.UpdateSPATS_Ejecucion_Pronostico_ID(EjecucionPronosticoID);
                //Actualizacion de estado, de las lecturas procesadas
                this.UpdateEstadoBase_Conocimiento_Lecturas(TerritorioID, FechaInicialLecturas, FechaFinalLecturas);
               
            }
            catch
            {
                GenLogNotificacion("Error al procesar Pronostico, nivel general, TerritorioId: " + TerritorioID.ToString());
            }
            
        }
        public string Execute(TaskInfo ti)
        {
            GenLogNotificacion("Inicio de Procesamiento de Pronosticos");
                               /********Recorrer territorios********/
            {
                // Loop through all documents
                foreach (DataRow documentRow in GetTerritorio())
                {
                    int TerritorioID = ValidationHelper.GetInteger(documentRow["DocumentId"], 0);
                    string Territorio = ValidationHelper.GetString(documentRow["Documentname"], "Territorio no valido");
                 //    Get the URL information
                    CMS.SiteProvider.SiteInfo si = CMS.SiteProvider.SiteInfoProvider.GetSiteInfo(CMSContext.CurrentSiteName);
                    string relativeURL = CMS.TreeEngine.DocumentURLProvider.GetUrl(Convert.ToString(documentRow["NodeAliasPath"]));
                    string docURL = CMS.GlobalHelper.URLHelper.GetAbsoluteUrl(relativeURL,si.DomainName);
                    docURL = docURL.Substring(0, docURL.Length - 5) + "/Administrar-SPATS/Administrar-Ejecucion-de-Pronosticos-Detalle.aspx?ItemId=";
                    //http://spats.pe.iica.int/Modulos-en-Implementacion/Lamas/Administrar-SPATS/Administrar-Ejecucion-de-Pronosticos-Detalle.aspx?ItemId=4

                    try
                    {
                        this.ProcesaPronosticos(TerritorioID, docURL, Territorio);
                    }
                    catch
                    {
                        GenLogNotificacion("Error al procesar Pronostico, nivel general, TerritorioId: " + TerritorioID.ToString());

                    }
                }
            }

            return null;
        }
    }
}
