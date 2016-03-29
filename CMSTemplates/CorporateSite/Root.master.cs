using System;
using System.Web;
using System.Web.UI;

using CMS.UIControls;
using CMS.GlobalHelper;
using CMS.SiteProvider;

using TimeZoneInfo = CMS.SiteProvider.TimeZoneInfo;

public partial class CMSTemplates_CorporateSiteASPX_Root : TemplateMasterPage, ITimeZoneManager
{
    #region "Private variables"

    private TimeZoneTypeEnum mTimeZoneType = TimeZoneTypeEnum.WebSite;
    private TimeZoneInfo mCustomTimeZone = null;

    #endregion


    protected override void CreateChildControls()
    {
        base.CreateChildControls();

        PageManager = CMSPageManager1;
    }


    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        ((TemplatePage)Page).ManagersContainer = plcManagers;

        // Include debug if enabled
        if (CMSFunctions.AnyLiveDebugEnabled)
        {
            Control debug = LoadControl("~/CMSAdminControls/Debug/Debug.ascx");
            debug.ID = "dbg";

            this.plcLogs.Controls.Add(debug);
        }
    }


    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        ltlTags.Text = HeaderTags;
        lnkHome.NavigateUrl = ResolveUrl("~/Home.aspx");
        imgLogo.ImageUrl = ResolveUrl("~/Images-(1)/CompanyLogo.aspx");

        lnkCMSDesk.NavigateUrl = ResolveUrl("~/CMSPages/logon.aspx?ReturnUrl=~/cmsdesk/default.aspx&username=administrator");
        lnkSiteManager.NavigateUrl = ResolveUrl("~/CMSPages/logon.aspx?ReturnUrl=~/cmssitemanager/default.aspx&username=administrator");

        lnkSiteMap.NavigateUrl = ResolveUrl("~/SpecialPages/Sitemap.aspx");
        lnkDisclaimer.NavigateUrl = ResolveUrl("~/SpecialPages/Disclaimer.aspx");

        imgPowered.ImageUrl = UIHelper.GetImageUrl(Page, "Powered_by_kentico.gif");

        SignOutButton.ContentBefore = "<div class=\"signOut\">";
        SignOutButton.ContentAfter = "</div>";
    }


    #region "ITimeZoneManager Members"


    /// <summary>
    /// Gets or sets time zone.
    /// </summary>
    public TimeZoneTypeEnum TimeZoneType
    {
        get
        {
            return mTimeZoneType;
        }
        set
        {
            mTimeZoneType = value;
        }
    }


    /// <summary>
    /// Gets or sets user defined time zone if time zone type is "custom".
    /// </summary>
    public TimeZoneInfo CustomTimeZone
    {
        get
        {
            return mCustomTimeZone;
        }
        set
        {
            mCustomTimeZone = value;
        }
    }

    #endregion
}
