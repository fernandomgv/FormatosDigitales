using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Syndication : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/rss-feed"))
        {
            plcRssFeed.Visible = true;
            plcNewsDataSource.Visible = true;
            RSSFeed.DataSourceControl = DocumentsDataSource;
        }
        else if (aliasPath.EndsWith("/cms-rss-feed"))
        {
            plcCMSRssFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/news-rss-feed"))
        {
            plcNewsRssFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/blog-posts-rss-feed"))
        {
            plcBlogPostsRssFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/blog-comments-rss-feed"))
        {
            plcBlogCommentsRSSFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/blog-comments-rss-feed"))
        {
            plcNewsRssFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/events-rss-feed"))
        {
            plcEventsRssFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/feed-link"))
        {
            plcLinkFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/xml-repeater"))
        {
            plcXMLRepeater.Visible = true;
            plcNewsDataSource.Visible = true;
            XMLRepeater.DataSourceControl = DocumentsDataSource;
        }
        else if (aliasPath.EndsWith("/atom-repeater"))
        {
            plcAtomRepeater.Visible = true;
            plcNewsDataSource.Visible = true;
            AtomRepeater.DataSourceControl = DocumentsDataSource;
        }
        else if (aliasPath.EndsWith("/atom-feed"))
        {
            plcAtomFeed.Visible = true;
            plcNewsDataSource.Visible = true;
            AtomFeed.DataSourceControl = DocumentsDataSource;
        }
        else if (aliasPath.EndsWith("/media-files-rss-feed"))
        {
            plcMediaFilesRSSFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/board-messages-rss-feed"))
        {
            plcBoardMessagesRSSFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/articles-rss-feed"))
        {
            plcArticlesRSSFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/rss-repeater"))
        {
            plcRSSRepeater.Visible = true;
            plcNewsDataSource.Visible = true;
            rssRepeater.DataSourceControl = DocumentsDataSource;
        }
        else if (aliasPath.EndsWith("/forum-posts-rss-feed"))
        {
            plcForumPosts.Visible = true;
        }
        else if (aliasPath.EndsWith("/products-rss-feed"))
        {
            plcProducts.Visible = true;
        }
        else if (aliasPath.EndsWith("/query-rss-feed"))
        {
            plcQueryRSSFeed.Visible = true;
        }
        else if (aliasPath.EndsWith("/custom-table-rss-feed"))
        {
            plcCustomTableRSSFeed.Visible = true;
        }
    }
}
