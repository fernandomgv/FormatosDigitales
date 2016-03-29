using System;
using CMS.DataEngine;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteAspx_EjeValorAgregado : TemplatePage
{
    #region Propiedades

    public const string TipoEje = "3";
    public bool Intercambiar = false;

    #endregion

    #region Eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string where = string.Format("TipoEjeTematico = '{0}'", TipoEje);

            repeaterInnovacion.WhereCondition = where;
            repeaterInnovacion.ReloadData(true);

            repeaterSlider.WhereCondition = where;
            repeaterSlider.ReloadData(true);
        }
    }

    #endregion

    #region Métodos

    public static int DocumentsCount()
    {
        var count = ConnectionHelper.GetConnection()
            .ExecuteScalar("mfs.proyecto.documentscount", null,
                string.Format("Published = 1 AND TipoEjeTematico = '{0}'", TipoEje));

        return Convert.ToInt32(count);
    }

    #endregion
}