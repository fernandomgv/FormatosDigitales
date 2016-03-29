using System;
using System.Web;

using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_SpecialPages_ShoppingCart : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ShoppingCart.ImageStepSeparator = "<img class=\"ShoppingCartStepSeparator\" src=\"" + GetImageUrl("ShoppingCart/Separator.gif") + "\" alt=\"Separator\" />";
    }
}
