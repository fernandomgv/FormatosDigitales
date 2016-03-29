using System;
using CMS.CMSHelper;
using CMS.EventLog;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteAspx_InnovacionDetalle : TemplatePage
{
    #region Propiedades

    public InnovacionMfs Innovacion { get; private set; }
    public bool Intercambiar = false;

    #endregion

    #region Eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string nodeId = QueryHelper.GetString("nodeid", string.Empty);
            try
            {
                if (nodeId != string.Empty)
                {
                    var tree = Functions.GetTreeProvider();
                    var treeNode = tree.SelectSingleNode(CMSContext.CurrentSiteName, null, CMSContext.PreferredCultureCode,
                        false, "MFS.Proyecto", "NodeId = " + nodeId, null, -1, true,
                        "NodeID, NodeLinkedNodeID, DocumentCulture, ClassName, Titulo, Descripcion, ImagenPage, Contexto, SeccionInfoEje, " +
                        "ModeloInnovacion, Beneficio, Cifras, Potencial, EntidadDesarrollada, DescargaPublicacion, TipoEjeTematico");

                    Innovacion = new InnovacionMfs
                    {
                        Titulo = treeNode.GetValue("Titulo").ToString(),
                        Descripcion = treeNode.GetValue("Descripcion").ToString(),
                        ImagenPage = (Guid)treeNode.GetValue("ImagenPage"),
                        Contexto = treeNode.GetValue("Contexto").ToString(),
                        SeccionInfoEje = treeNode.GetValue("SeccionInfoEje").ToString(),
                        ModeloInnovacion = treeNode.GetValue("ModeloInnovacion").ToString(),
                        Beneficio = treeNode.GetValue("Beneficio").ToString(),
                        Cifras = treeNode.GetValue("Cifras").ToString(),
                        Potencial = treeNode.GetValue("Potencial").ToString(),
                        EntidadDesarrollada = treeNode.GetValue("EntidadDesarrollada").ToString(),
                        DescargaPublicacion = treeNode.GetValue("DescargaPublicacion").ToString(),
                        TipoEjeTematico = treeNode.GetValue("TipoEjeTematico").ToString()
                    };

                    //repeaterVideos.WhereCondition = string.Format("NodeParentId = {0}", nodeId);
                    repeaterPublicacion.WhereCondition = string.Format("NodeParentId = {0} AND TipoEjeTematico = '{1}'",
                        nodeId, Innovacion.TipoEjeTematico);
                }

                if (Innovacion == null)
                    Innovacion = new InnovacionMfs { TipoEjeTematico = "1" };

                //repeaterVideos.ReloadData(true);
                repeaterPublicacion.ReloadData(true);
            }
            catch (Exception ex)
            {
                new EventLogProvider().LogEvent("E", DateTime.Now, "InnovacionDetalle", "Page_Load",
                    CMSContext.CurrentDocument.NodeAliasPath + ".aspx", ex.Message + " \n " + ex.StackTrace);
                UrlHelper.Redirect(UrlHelper.ResolveUrl("~/Error.aspx"));
            }
        }
    }

    #endregion
}