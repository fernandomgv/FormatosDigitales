using System;
using System.Data;
using System.Web.Services;
using CMS.CMSHelper;
using CMS.DataEngine;
using CMS.EventLog;
using CMS.GlobalHelper;
using CMS.UIControls;
using CMS.WorkflowEngine;

public partial class CMSTemplates_CorporateSiteAspx_Publicaciones : TemplatePage
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

            repeaterPublicacion.WhereCondition = where;
            repeaterPublicacion.ReloadData(true);
        }
    }

    [WebMethod]
    public static JsonResponse GetPublicaciones(string filterType, string filterValue, int topN)
    {
        var jsonResponse = new JsonResponse {Success = false};
        try
        {
            string where = string.IsNullOrEmpty(filterType)
                ? string.Empty
                : filterType.ToUpper() == "PAIS"
                    ? string.Format("{0} like '%{1}%'", filterType, filterValue)
                    : string.Format("{0} = '{1}'", filterType, filterValue);
            var tree = Functions.GetTreeProvider();
            var data = DocumentHelper.GetDocuments(CMSContext.CurrentSiteName, "/Publicaciones/%",
                CMSContext.PreferredCultureCode, false, "MFS.Publicacion", where, "DocumentPublishFrom DESC", -1, true, topN,
                "Titulo, Sinopsis, ArchivoPublicacion, TipoDocumento, TipoEjeTematico, DocumentPublishFrom", tree);

            if (!DataHelper.DataSourceIsEmpty(data))
            {
                var list = data.Tables[0].AsEnumerable().Select(p => new
                {
                    Titulo = p.Field<string>("Titulo"),
                    Sinopsis = p.Field<string>("Sinopsis"),
                    ArchivoPublicacion = p.Field<Guid>("ArchivoPublicacion"),
                    TipoDocumento = p.Field<string>("TipoDocumento"),
                    TipoEjeTematico = p.Field<string>("TipoEjeTematico"),
                    FechaPublicacion = string.Format("{0:dd - MM - yyyy}", p.Field<DateTime>("DocumentPublishFrom")
                    //FechaPublicacion = p.Field<DateTime>("DocumentPublishFrom").Equals(DBNull.Value) ? null : string.Format("{0:dd - MM - yyyy}", p.Field<DateTime>("DocumentPublishFrom"))
                });

                var count = DocumentsCount(where);

                jsonResponse.Data = new {Count = count, List = list};
            }
            else
            {
                jsonResponse.Data = new {Count = 0};
            }

            jsonResponse.Success = true;
        }
        catch (Exception ex)
        {
            jsonResponse.Message = ex.Message;
            new EventLogProvider().LogEvent("E", DateTime.Now, "GetPublicaciones", "GetPublicaciones",
                "Publicaciones.aspx", ex.Message + " \n " + ex.StackTrace);
        }

        return jsonResponse;
    }

    #endregion

    #region Métodos

    public static int DocumentsCount(string where)
    {
        var count = ConnectionHelper.GetConnection()
            .ExecuteScalar("mfs.publicacion.documentscount", null,
                "Published = 1" + (string.IsNullOrEmpty(where) ? string.Empty : " AND " + where));

        return Convert.ToInt32(count);
    }

    #endregion
}