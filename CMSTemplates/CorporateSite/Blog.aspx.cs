using System;
using System.Web;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_Blog : TemplatePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        string aliasPath = CMSContext.CurrentAliasPath.Replace("'", "''");

        rptBlogDescription.WhereCondition = "'" + aliasPath + "' LIKE NodeAliasPath + '%'";
        rptSideColumn.WhereCondition = "'" + aliasPath + "' LIKE NodeAliasPath + '%'";
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        PostArchive.ReloadData();

        string tagId = QueryHelper.GetString("tagid", "").Replace("'", "''");
        string tagName = QueryHelper.GetString("tagname", "").Replace("'", "''");
        string groupId = QueryHelper.GetString("groupid", "").Replace("'", "''");

        this.rptAllPosts.WhereCondition = "('" + tagId + "' = '' AND N'" + tagName + "'='') OR (DocumentID IN (SELECT DocumentID FROM CMS_DocumentTag WHERE TagID = '" +
            tagId + "')) OR (DocumentID IN (SELECT DocumentID FROM CMS_DocumentTag WHERE TagID IN (SELECT TagID FROM CMS_Tag WHERE TagName = N'" + tagName +
            "' AND TagGroupID = '" + groupId + "')))";
        
        this.rptAllPosts.ReloadData();
        this.CommentView.CommentSeparator = "<hr class=\"PostCommentSeparatorLine\" />";
    }
}
