using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Text : TemplatePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/editable-image"))
        {
            plcEditableImage.Visible = true;
        }
        else if (aliasPath.EndsWith("/editable-text"))
        {
            plcEditableText.Visible = true;
        }
        else if (aliasPath.EndsWith("/paged-text"))
        {
            plcPagedText.Visible = true;
        }
        else if (aliasPath.EndsWith("/static-html"))
        {
            plcStaticHTML.Visible = true;
        }
        else if (aliasPath.EndsWith("/static-text"))
        {
            plcStaticText.Visible = true;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
    }
}
