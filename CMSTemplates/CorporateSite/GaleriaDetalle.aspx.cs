using System;
using System.Collections.Generic;
using System.Data;
using CMS.CMSHelper;
using CMS.EventLog;
using CMS.GlobalHelper;
using CMS.TreeEngine;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteAspx_GaleriaDetalle : TemplatePage
{
    #region Propiedades

    public TreeNode Galeria { get; private set; }
    public DataRowCollection Imagenes { get; private set; }
    public DataRowCollection Videos { get; private set; }
    public List<TreeNode> GaleriaAntesySig { get; private set; }
    public bool HasNodeId { get; private set; }

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
                    HasNodeId = true;
                    var tree = Functions.GetTreeProvider();
                    Galeria = tree.SelectSingleNode(CMSContext.CurrentSiteName, null, CMSContext.PreferredCultureCode, false,
                        "MFS.Galeria", "NodeId = " + nodeId, null, -1, true,
                        "NodeID, NodeLinkedNodeID, DocumentCulture, ClassName, Titulo, [File], DescripcionLarga, DocumentPublishFrom");

                    var nodesFiles = tree.SelectNodes(CMSContext.CurrentSiteName, null, CMSContext.PreferredCultureCode, false,
                        "MFS.File", "NodeParentId = " + nodeId, "", -1, true, 100, "Titulo, Descripcion, [File]");
                    Imagenes = nodesFiles != null ? nodesFiles.Tables[0].Rows : null;

                    nodesFiles = tree.SelectNodes(CMSContext.CurrentSiteName, null, CMSContext.PreferredCultureCode, false,
                        "MFS.Video", "NodeParentId = " + nodeId, "", -1, true, 100, "Titulo, Descripcion, Uri, ImagePreview");
                    Videos = nodesFiles != null ? nodesFiles.Tables[0].Rows : null;

                    GaleriaAntesySig = new List<TreeNode>
                    {
                        tree.SelectSingleNode(CMSContext.CurrentSiteName, null, CMSContext.PreferredCultureCode, false,
                            "MFS.Galeria",
                            string.Format("NodeId != {0} AND DocumentPublishFrom <= '{1:yyyy/MM/dd HH:mm:ss}'", nodeId,
                                Galeria.DocumentPublishFrom), "DocumentPublishFrom DESC", -1, true,
                            "NodeID, NodeLinkedNodeID, DocumentCulture, ClassName, Titulo, [File]"),
                        tree.SelectSingleNode(CMSContext.CurrentSiteName, null, CMSContext.PreferredCultureCode, false,
                            "MFS.Galeria",
                            string.Format("NodeId != {0} AND DocumentPublishFrom >= '{1:yyyy/MM/dd HH:mm:ss}'", nodeId,
                                Galeria.DocumentPublishFrom), "DocumentPublishFrom ASC", -1, true,
                            "NodeID, NodeLinkedNodeID, DocumentCulture, ClassName, Titulo, [File]")
                    };
                }
            }
            catch (Exception ex)
            {
                new EventLogProvider().LogEvent("E", DateTime.Now, "GaleriaDetalle", "Page_Load",
                    CMSContext.CurrentDocument.NodeAliasPath + ".aspx", ex.Message + " \n " + ex.StackTrace);
                UrlHelper.Redirect(UrlHelper.ResolveUrl("~/Error.aspx"));
            }
        }
    }

    #endregion
}