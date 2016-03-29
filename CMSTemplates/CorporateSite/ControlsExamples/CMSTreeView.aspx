<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSTreeView.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_CMSTreeView" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" enableviewstate="false">
    <title>Untitled Page</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
    <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td>
                    <cms:CMSTreeView ID="CMSTreeView1" runat="server" Path="/%" ClassNames="cms.article;cms.blog;cms.blogmonth;cms.blogpost;cms.cellphone;cms.event;cms.faq;CMS.File;CMS.Folder;CMS.Job;cms.kbarticle;cms.laptop;CMS.News;cms.office;CMS.MenuItem;cms.pda;cms.pressrelease;CMS.Product;CMS.Root;CMS.SimpleArticle"
                        OnClickAction="alert('{%%DocumentName%%}'); return false;">
                    </cms:CMSTreeView>
                </td>
                <td style="vertical-align: top;">
                    <cms:CMSTreeView ID="CMSTreeView2" RootText="E-commerce products" ExpandAllOnStartup="true"
                        runat="server" Path="/Products/%" ClassNames="cms.cellphone;cms.laptop;CMS.MenuItem;cms.pda;CMS.Product;"
                        Target="_blank">
                    </cms:CMSTreeView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
