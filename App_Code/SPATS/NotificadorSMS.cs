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

namespace SPTAS
{
    /// <summary>
    /// Sample task class.
    /// </summary>
    public class NotificadorSMS : ITask
    {
        /// <summary>
        /// Executes the task.
        /// </summary>
        /// <param name="ti">Task info</param>
        public string Execute(TaskInfo ti)
        {

            EventLogProvider ev = new EventLogProvider();
            ev.LogEvent(EventLogProvider.EVENT_TYPE_INFORMATION, DateTime.Now, "NotificadorSMS", "Execute", null, "Notificador SMS en ejecucion.");
            /********Despacho de la cola de SMS********/
            GeneralConnection cn = ConnectionHelper.GetConnection();
            DataSet SMS_cola = new DataSet();
            QueryDataParameters parameters = new QueryDataParameters();
            
            SMS_cola = ConnectionHelper.ExecuteQuery("customtable.SPATS_Notificacion_SMS.All_Pendiende", parameters);

            if (SMS_cola.Tables[0] != null)
            {
                /***************   Realizar en envio de SMS ******************/

                foreach (DataRow sms_item in SMS_cola.Tables[0].Rows)
                {
                    string from = sms_item["NumeroOrigen"].ToString();
                    string to = sms_item["Celldestino"].ToString();
                    string message = sms_item["mensaje"].ToString();

                    SMSMessage smsMessage = new SMSMessage();
                    smsMessage.From = from;
                    smsMessage.To = to;
                    smsMessage.Text = message;

                    SMSProvider provider = new SMSProvider();
                    provider.SendSMS(smsMessage);
                    if (provider.MessageSended)
                    {
                        /***************   Actualizar en la cola estatus de en envio de SMS ******************/
                        int ItemID = ValidationHelper.GetInteger(sms_item["ItemID"], 0);
                        SimpleDataClass Sms_Item_Up = new SimpleDataClass("customtable.SPATS_Notificacion_SMS", ItemID);
                       if (!Sms_Item_Up.IsEmpty())
                            {
                                //BaseConocimiento.SetValue("BaseConocimientoID", BaseConocimientoID);
                                Sms_Item_Up.SetValue("Estado", "1");
                                Sms_Item_Up.SetValue("FechaHoraEnvio", System.DateTime.Now);
                                Sms_Item_Up.Update();
                            }                       
                    }                   
                }
            }
            return null;
        }
    }
}
