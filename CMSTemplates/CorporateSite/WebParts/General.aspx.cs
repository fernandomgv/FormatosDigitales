using System;
using System.Web;

using CMS.CMSHelper;
using CMS.UIControls;
using CMS.GlobalHelper;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_General : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/date-time"))
        {
            plcDateTime.Visible = true;
        }
        else if (aliasPath.EndsWith("/head-html-code"))
        {
            plcHeadHtmlCode.Visible = true;
        }
        else if (aliasPath.EndsWith("/java-script"))
        {
            plcJavaScript.Visible = true;
        }
        else if (aliasPath.EndsWith("/language-selection"))
        {
            plcLanguageSelection.Visible = true;
        }
        else if (aliasPath.EndsWith("/language-selection-with-flags"))
        {
            plcLanguageSelectionWithFlags.Visible = true;
        }
        else if (aliasPath.EndsWith("/filter"))
        {
            plcFilter.Visible = true;
        }
        else if (aliasPath.EndsWith("/powered-by-kentico"))
        {
            plcPoweredByKentico.Visible = true;
            PoweredByKentico1.Text = "<a href=\"http://www.kentico.com\" title=\"Kentico CMS for ASP.NET - the WEB 2.0 Content Management System for .NET developers\"><img border=\"0\" src=\"" + UIHelper.GetImageUrl(this.Page, "Powered_by_kentico.gif") + "\" alt=\"This web site uses Kentico CMS, the content management system for ASP.NET developers.\" /></a>";
        }
        else if (aliasPath.EndsWith("/random-redirection"))
        {
            plcRandomRedirection.Visible = true;
            randomredirection1.RedirectionURLs = "~/Examples/Webparts/General/Random-redirection.aspx?campaign=variant1\r\n~/Examples/Webparts/General/Random-redirection.aspx?campaign=variant2\r\n~/Examples/Webparts/General/Random-redirection.aspx?campaign=variant3";
        }
        else if (aliasPath.EndsWith("/mobile-device-redirection"))
        {
            plcMobileDeviceRedirection.Visible = true;
        }
    }
}
