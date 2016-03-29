using System;
using System.Data;
using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_Home : TemplatePage
{
    #region Propiedades

    public DataRowCollection Proyectos { get; private set; }

    #endregion

    #region Eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var tree = Functions.GetTreeProvider();
            var nodesFiles = tree.SelectNodes(CMSContext.CurrentSiteName, "/Innovaciones/%", CMSContext.PreferredCultureCode, false,
                    "MFS.Proyecto", null, "DocumentPublishFrom DESC", -1, true, 4, "Titulo, Lugar, Resumen, ImagenPreview");
            Proyectos = nodesFiles != null ? nodesFiles.Tables[0].Rows : null;
        }
    }

    #endregion
}