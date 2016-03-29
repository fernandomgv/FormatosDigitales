using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_ContentRating : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/stars"))
        {
            plcStars.Visible = true;
            cntStars.Visible = true;
        }
        else if (aliasPath.EndsWith("/radio-buttons"))
        {
            plcRadio.Visible = true;
            cntRadio.Visible = true;
        }
        else if (aliasPath.EndsWith("/drop-down-list"))
        {
            plcDropdown.Visible = true;
            cntDropDown.Visible = true;
        }
    }
}
