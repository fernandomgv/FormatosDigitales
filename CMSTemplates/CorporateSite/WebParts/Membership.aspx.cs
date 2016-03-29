using System;

using CMS.CMSHelper;
using CMS.UIControls;
using CMS.GlobalHelper;
using System.Text;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_Membership : TemplatePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/my-account"))
        {
            plcMyAccount.Visible = true;
            MyAccount1.Visible = true;
            MyAccount1.ReloadData();
            lblMyAccount.Visible = true;
            lblMyAccount.Text = ResHelper.GetString("MyAccount.OnlyForAuthenticated");
        }
        else if (aliasPath.EndsWith("/current-user"))
        {
            plcCurrentuser.Visible = true;
        }
        else if (aliasPath.EndsWith("/change-password"))
        {
            plcChangePassword.Visible = true;
        }
        else if (aliasPath.EndsWith("/logon-form"))
        {
            plcLogonForm.Visible = true;
        }
        else if (aliasPath.EndsWith("/my-profile"))
        {
            plcMyProfile.Visible = true;
            MyProfileWebPart1.ReloadData();
        }
        else if (aliasPath.EndsWith("/registration-form"))
        {
            plcRegistrationForm.Visible = true;
        }
        else if (aliasPath.EndsWith("/custom-registration-form"))
        {
            plcCustomRegistrationForm.Visible = true;
        }
        else if (aliasPath.EndsWith("/sign-out-button"))
        {
            plcSignOutButton.Visible = true;
        }
        else if (aliasPath.EndsWith("/logonmini-form"))
        {
            plcLogonMiniForm.Visible = true;
        }
        else if (aliasPath.EndsWith("/windows-liveid"))
        {
            plcLiveId.Visible = true;
        }
        else if (aliasPath.EndsWith("/on-line-users"))
        {
            plcOnlineUsers.Visible = true;
        }
        else if (aliasPath.EndsWith("/user-public-profile"))
        {
            plcUserPublicProfile.Visible = true;
        }
        else if (aliasPath.EndsWith("/liveid-user-data"))
        {
            plcLiveData.Visible = true;
        }
        else if (aliasPath.EndsWith("/users-viewer"))
        {
            plcUsersViewer.Visible = true;
        }
        else if (aliasPath.EndsWith("users-smart-search"))
        {
            plcUsersSmartSearch.Visible = true;
        }
        else if (aliasPath.EndsWith("openid-logon"))
        {
            plcOpenIDLogon.Visible = true;

            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Yahoo!|http://me.yahoo.com/|yahoo.png");
            sb.AppendLine("myOpenID|http://##username##.myopenid.com/|myopenid.png");
            sb.AppendLine("Google|https://www.google.com/accounts/o8/id|google.png");
            sb.AppendLine("Flickr|http://www.flickr.com|flickr.png");
            sb.AppendLine("AOL|http://openid.aol.com/|aol.png");
            sb.AppendLine("Blogger|http://##username##.blogspot.com/|blogger.png");
            sb.AppendLine("Livejournal|http://##username##.livejournal.com/|livejournal.png");
            sb.AppendLine("Verisign|http://##username##.pip.verisignlabs.com/|verisign.png");
            sb.AppendLine("Vidoop|http://##username##.myvidoop.com/|vidoop.png");
            sb.AppendLine("claimID|http://claimid.com/##username##|claimid.png");
            sb.AppendLine("Vox|http://##username##.vox.com/|vox.png");

            openIDlogon.Providers = sb.ToString();
        }
        else if (aliasPath.EndsWith("openid-user-data"))
        {
            plcOpenIDData.Visible = true;
        }
        else if (aliasPath.EndsWith("facebook-logon"))
        {
            plcFacebookLogon.Visible = true;
        }
        else if (aliasPath.EndsWith("facebook-user-data"))
        {
            plcFacebookRequiredData.Visible = true;
        }
    }
}
