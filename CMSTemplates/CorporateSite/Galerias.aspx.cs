using System;
using System.Data;
using System.Web.Services;
using CMS.CMSHelper;
using CMS.DataEngine;
using CMS.EventLog;
using CMS.GlobalHelper;
using CMS.UIControls;
using CMS.WorkflowEngine;

public partial class CMSTemplates_CorporateSiteAspx_Galerias : TemplatePage
{
    #region Eventos

    [WebMethod]
    public static JsonResponse GetGalerias(int topN)
    {
        var jsonResponse = new JsonResponse { Success = false };
        try
        {
            var tree = Functions.GetTreeProvider();
            var data = DocumentHelper.GetDocuments(CMSContext.CurrentSiteName, "/Galerias/%",
                CMSContext.PreferredCultureCode, false, "MFS.Galeria", "", "DocumentPublishFrom DESC", -1, true, topN,
                "NodeID, GaleriaID, Titulo, [File], DescripcionCorta, NodeChildNodesCount", tree);

            if (!DataHelper.DataSourceIsEmpty(data))
            {
                var list = data.Tables[0].AsEnumerable().Select(p => new
                {
                    NodeId = p.Field<int>("NodeID"),
                    GaleriaId = p.Field<int>("GaleriaID"),
                    Titulo = p.Field<string>("Titulo"),
                    File = p.Field<Guid>("File"),
                    DescripcionCorta = p.Field<string>("DescripcionCorta"),
                    NodeChildNodesCount = p.Field<int>("NodeChildNodesCount")
                });

                jsonResponse.Data = list;
            }

            jsonResponse.Success = true;
        }
        catch (Exception ex)
        {
            jsonResponse.Message = ex.Message;
            new EventLogProvider().LogEvent("E", DateTime.Now, "GetGalerias", "GetGalerias", "Galerias.aspx",
                ex.Message + " \n " + ex.StackTrace);
        }

        return jsonResponse;
    }

    public static int DocumentsCount(string where)
    {
        var count = ConnectionHelper.GetConnection()
            .ExecuteScalar("mfs.galeria.documentscount", null,
                "Published = 1" + (string.IsNullOrEmpty(where) ? string.Empty : " AND " + where));

        return Convert.ToInt32(count);
    }

    #endregion
}