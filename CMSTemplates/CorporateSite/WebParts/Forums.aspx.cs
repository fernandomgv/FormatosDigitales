using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Forums : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/forum-(threaded-view)"))
        {
            plcFlat.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-(tree-view)"))
        {
            plcTree.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-group"))
        {
            ForumGroup.GroupName = "CorporateSiteASPX.WebSiteGlobalForums";
            plcGroup.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-search-box"))
        {
            plcSearch.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-search-results"))
        {
            plcSearchResults.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-unsubscription"))
        {
            plcUnsubscription.Visible = true;
        }

        else if (aliasPath.EndsWith("/forum-extended-search-dialog"))
        {
            plcExtendedSearchDialog.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-favorites"))
        {
            plcFavorites.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-most-active-threads"))
        {
            plcMostActiveThreads.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-recently-updated"))
        {
            plcRecentlyActiveThreads.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-top-contributors"))
        {
            plcTopContributors.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-posts-viewer"))
        {
            plcPostsViewer.Visible = true;
            ForumPostsViewer.ReloadData();
        }
        else if (aliasPath.EndsWith("forum-smart-search"))
        {
            plcForumSmartSearch.Visible = true;
        }
        else if (aliasPath.EndsWith("/forum-breadcrumbs"))
        {
            ForumGroup1.GroupName = "CorporateSiteASPX.WebSiteGlobalForums";
            ForumBreadcrumbs1.BreadcrumbPrefix = "<a href=\"" + ResolveUrl(CMSContext.GetUrl(CMSContext.CurrentAliasPath)) + "\">Forum page</a>";
            plcForumBreadcrumbs.Visible = true;


        }
    }
}
