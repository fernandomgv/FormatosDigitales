using System;
using System.Data;
using System.Web.Services;
using CMS.CMSHelper;
using CMS.EventLog;
using CMS.GlobalHelper;
using CMS.SiteProvider;
using CMS.UIControls;
using CMS.WorkflowEngine;

public partial class CMSTemplates_CorporateSiteAspx_Busqueda : TemplatePage
{
    #region Eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string searchText = QueryHelper.GetString("search", string.Empty);
            lblSearchText.Text = searchText;
            BuscarDocumentos(searchText);
        }
    }

    #endregion

    #region Métodos

    protected void BuscarDocumentos(string searchText)
    {
        string searchIndex = string.Empty;
        var documentIndex = SearchIndexInfoProvider.GetSearchIndexInfo("CorporateSiteASPX.default");

        if (documentIndex != null)
            searchIndex = documentIndex.IndexName;

        try
        {
            if (string.IsNullOrEmpty(searchIndex) || string.IsNullOrEmpty(searchText)) return;

            const string path = "/%";
            const string classNames = "";
            const string cultureCode = "es-ES";
            string defaultCulture = CultureHelper.DefaultCulture.IetfLanguageTag;
            var sort = SearchHelper.GetSort("##SCORE##");
            const bool combineWithDefaultCulture = true;
            const bool checkPermissions = false;
            const bool searchInAttachments = false;
            const int displayResults = 100;
            const int startingPosition = 0;
            const int numberOfProcessedResults = 100;
            UserInfo userInfo = CMSContext.CurrentUser;
            const string attachmentWhere = "";
            const string attachmentOrderBy = "Score";
            const string wildCard = "*";

            int numberOfResults;
            DataSet ds = SearchHelper.Search(searchText + wildCard, sort, path, classNames, cultureCode,
                defaultCulture, combineWithDefaultCulture, checkPermissions, searchInAttachments, searchIndex,
                displayResults, startingPosition, numberOfProcessedResults, userInfo, out numberOfResults,
                attachmentWhere, attachmentOrderBy);

            if (numberOfResults > 0)
            {
                repeaterSearch.DataSource = ds;
                repeaterSearch.DataBind();
            }
        }
        catch (Exception ex)
        {
            new EventLogProvider().LogEvent("E", DateTime.Now, "BuscarDocumentos", "BuscarDocumentos",
                "Resultado-Busqueda.aspx", ex.Message + " \n " + ex.StackTrace);
        }
    }

    protected string UrIImagen(object guidImage)
    {
        if (DataHelper.IsEmpty(guidImage) || guidImage.ToString().StartsWith("00000000"))
            return "~/App_Themes/Default/Images/CMSModules/CMS_SmartSearch/no_image.gif";
        return ResolveUrl("~/CMSPages/GetFile.aspx?guid=" + guidImage);
    }

    [WebMethod]
    public static JsonResponse GetDocumento(int documentId)
    {
        var jsonResponse = new JsonResponse { Success = false };
        try
        {
            var tree = Functions.GetTreeProvider();
            var data = DocumentHelper.GetDocument(documentId, tree);

            if (!DataHelper.DataSourceIsEmpty(data))
            {
                switch (data.NodeClassName)
                {
                    case "CMS.MenuItem":
                        jsonResponse.Data =
                            UrlHelper.ResolveUrl(data.NodeAliasPath.Contains("Home")
                                ? "~/"
                                : string.Format("{0}.aspx", data.NodeAliasPath));
                        break;
                    case "MFS.Proyecto":
                        jsonResponse.Data =
                                UrlHelper.ResolveUrl(string.Format("~/Innovacion-Detalle.aspx?nodeId={0}", data.NodeID));
                        break;
                    case "MFS.Publicacion":
                        if (data.NodeAliasPath.StartsWith("/Publicaciones/"))
                        {
                            jsonResponse.Data =
                                UrlHelper.ResolveUrl(string.Format("{0}.aspx", data.Parent.NodeAliasPath));
                        }
                        else if (data.NodeAliasPath.StartsWith("/Innovaciones/"))
                        {
                            jsonResponse.Data =
                                UrlHelper.ResolveUrl(string.Format("~/Innovacion-Detalle.aspx?nodeId={0}", data.Parent.Parent.DocumentID));
                        }
                        break;
                    case "MFS.Video":
                        if (data.NodeAliasPath.StartsWith("/Innovaciones/"))
                        {
                            jsonResponse.Data =
                                UrlHelper.ResolveUrl(string.Format("~/Innovacion-Detalle.aspx?nodeId={0}", data.Parent.Parent.DocumentID));
                        }
                        else if (data.NodeAliasPath.StartsWith("/Galerias/"))
                        {
                            jsonResponse.Data =
                                UrlHelper.ResolveUrl(string.Format("~/GaleriaDetalle.aspx?nodeId={0}", data.Parent.NodeID));
                        }
                        break;
                    case "MFS.File":
                        if (data.NodeAliasPath.StartsWith("/Galerias/"))
                        {
                            jsonResponse.Data =
                                UrlHelper.ResolveUrl(string.Format("~/GaleriaDetalle.aspx?nodeId={0}", data.Parent.NodeID));
                        }
                        break;
                    case "MFS.Colaborador":
                        jsonResponse.Data = UrlHelper.ResolveUrl("~/Programa-MFS/Comite.aspx");
                        break;
                    default:
                        jsonResponse.Data = UrlHelper.ResolveUrl("~/");
                        break;
                }
            }

            jsonResponse.Success = true;
        }
        catch (Exception ex)
        {
            jsonResponse.Message = ex.Message;
            new EventLogProvider().LogEvent("E", DateTime.Now, "GetDocumento", "GetDocumento",
                "Resultado-Busqueda.aspx", ex.Message + " \n " + ex.StackTrace);
        }

        return jsonResponse;
    }

    #endregion
}