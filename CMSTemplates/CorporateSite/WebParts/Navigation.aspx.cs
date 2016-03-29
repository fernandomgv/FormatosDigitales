using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;
using CMS.GlobalHelper;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Navigation : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/breadcrumbs"))
        {
          plcBreadcrumbs.Visible = true;
        }
        else if (aliasPath.EndsWith("/css-list-menu"))
        {
            plcCmsListMenu.Visible = true;
            if (BrowserHelper.IsIE6())
            {
                this.cmslistmenu.HoverCssClassName = "HoverClass";
                this.cmslistmenu1.HoverCssClassName = "HoverClass";
                this.cmslistmenu2.HoverCssClassName = "HoverClass";
            }
        }
        else if (aliasPath.EndsWith("/drop-down-menu"))
        {
            plcCmsMenu.Visible = true;
        }
        else if (aliasPath.EndsWith("/tab-menu"))
        {
            plcCmsTabControl.Visible = true;
        }
        else if (aliasPath.EndsWith("/tree-menu"))
        {
            plcCmsTreeMenu.Visible = true;
        }
        else if (aliasPath.EndsWith("/tree-view"))
        {
            plcCmsTreeView.Visible = true;
        }
        else if (aliasPath.EndsWith("/site-map"))
        {
            plcCmsSiteMap.Visible = true;
        }
    }
}
