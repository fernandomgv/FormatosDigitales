using System;
using System.Data;
using System.Web.Services;
using CMS.CMSHelper;
using CMS.DataEngine;
using CMS.EventLog;
using CMS.GlobalHelper;
using CMS.UIControls;
using CMS.WorkflowEngine;

public partial class CMSTemplates_CorporateSiteAspx_Innovaciones : TemplatePage
{
    #region Eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string filter = QueryHelper.GetString("paisId", string.Empty);
            string where = string.Empty;

            if (filter != string.Empty)
            {
                where = string.Format("Pais like '%{0}%'", filter);
            }
            else
            {
                filter = QueryHelper.GetString("eje", string.Empty);
                if (filter != string.Empty)
                    where = string.Format("TipoEjeTematico = '{0}'", filter);
            }

            repeaterInnovacion.WhereCondition = where;
            repeaterInnovacion.ReloadData(true);
        }
    }

    [WebMethod]
    public static JsonResponse GetInnovaciones(string filterType, string filterValue, int topN)
    {
        var jsonResponse = new JsonResponse { Success = false };
        try
        {
            string where = string.IsNullOrEmpty(filterType)
                ? string.Empty
                : filterType.ToUpper() == "PAIS"
                    ? string.Format("{0} like '%{1}%'", filterType, filterValue)
                    : string.Format("{0} = '{1}'", filterType, filterValue);
            var tree = Functions.GetTreeProvider();
            var data = DocumentHelper.GetDocuments(CMSContext.CurrentSiteName, "/Innovaciones/%",
                CMSContext.PreferredCultureCode, false, "MFS.Proyecto", where, "DocumentPublishFrom DESC", -1, true, topN,
                "NodeId, Titulo, Lugar, Resumen, ImagenPreview, TipoEjeTematico", tree);

            if (!DataHelper.DataSourceIsEmpty(data))
            {
                var list = data.Tables[0].AsEnumerable().Select(p => new
                {
                    NodeId = p.Field<int>("NodeId"),
                    Titulo = p.Field<string>("Titulo"),
                    Lugar = p.Field<string>("Lugar"),
                    Resumen = p.Field<string>("Resumen"),
                    ImagenPreview = p.Field<Guid>("ImagenPreview"),
                    TipoEjeTematico = p.Field<string>("TipoEjeTematico")
                });

                var count = DocumentsCount(where);

                jsonResponse.Data = new { Count = count, List = list };
            }
            else
            {
                jsonResponse.Data = new { Count = 0 };
            }

            jsonResponse.Success = true;
        }
        catch (Exception ex)
        {
            jsonResponse.Message = ex.Message;
            new EventLogProvider().LogEvent("E", DateTime.Now, "GetInnovaciones", "GetInnovaciones", "Innovaciones.aspx",
                ex.Message + " \n " + ex.StackTrace);
        }

        return jsonResponse;
    }

    #endregion

    #region Métodos

    public static int DocumentsCount(string where)
    {
        var count = ConnectionHelper.GetConnection()
            .ExecuteScalar("mfs.proyecto.documentscount", null,
                "Published = 1" + (string.IsNullOrEmpty(where) ? string.Empty : " AND " + where));

        return Convert.ToInt32(count);
    }

    #endregion
}