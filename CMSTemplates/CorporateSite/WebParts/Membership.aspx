<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master"
    AutoEventWireup="true" CodeFile="Membership.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_WebParts_Membership"
    ValidateRequest="false" %>

<%@ Register Src="~/CMSWebParts/Membership/Profile/MyProfile.ascx" TagName="MyProfileWebPart"
    TagPrefix="uc6" %>
<%@ Register Src="~/CMSWebParts/Membership/Profile/MyAccount.ascx" TagName="MyAccount"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Membership/Registration/RegistrationForm.ascx" TagName="RegistrationForm"
    TagPrefix="uc7" %>
<%@ Register Src="~/CMSWebParts/Membership/Logon/SignOutButton.ascx" TagName="SignOutButton"
    TagPrefix="uc8" %>
<%@ Register Src="~/CMSWebParts/Membership/Registration/CustomRegistrationForm.ascx"
    TagName="CustomRegistrationForm" TagPrefix="uc9" %>
<%@ Register Src="~/CMSWebParts/Membership/Users/OnlineUsers.ascx" TagName="OnlineUsers"
    TagPrefix="uc10" %>
<%@ Register Src="~/CMSWebParts/Membership/Users/UserPublicProfile.ascx" TagName="UserPublicProfile"
    TagPrefix="uc11" %>
<%@ Register Src="~/CMSWebParts/Membership/Users/UsersViewer.ascx" TagName="UsersViewer"
    TagPrefix="uc12" %>
<%@ Register Src="~/CMSWebParts/Membership/Logon/currentuser.ascx" TagName="currentuser"
    TagPrefix="uc2" %>
<%@ Register Src="~/CMSWebParts/Membership/Profile/ChangePassword.ascx" TagName="ChangePassword"
    TagPrefix="uc3" %>
<%@ Register Src="~/CMSWebParts/Membership/Logon/LogonForm.ascx" TagName="LogonForm"
    TagPrefix="uc4" %>
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Membership/Logon/LogonMiniForm.ascx" TagName="LogonMiniForm"
    TagPrefix="uc9" %>
<%@ Register Src="~/CMSWebParts/Membership/Registration/WindowsLiveID.ascx" TagName="WindowsLiveID"
    TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/Membership/Registration/LiveIDUsersRequiredData.ascx"
    TagName="LiveIDUsersRequiredData" TagPrefix="uc1" %>
<%@ Register Src="~/CMSWebParts/SmartSearch/SearchDialogWithResults.ascx" TagName="SearchDialogWithResults"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Membership/OpenID/OpenIDLogon.ascx" TagName="OpenIDLogon"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Membership/OpenID/OpenIDUserRequiredData.ascx" TagName="OpenIDUserRequiredData"
    TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Membership/FacebookConnect/FacebookConnectLogon.ascx"
    TagName="FacebookLogon" TagPrefix="cms" %>
<%@ Register Src="~/CMSWebParts/Membership/FacebookConnect/FacebookUsersRequiredData.ascx"
    TagName="FacebookUserRequiredData" TagPrefix="cms" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" runat="Server">
    <!-- Container -->
    <div class="textPlaceholderLeftMenu">
        <!-- Left zone -->
        <div class="zoneLeft" style="float: left;">
            <uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" CellPadding="0" CellSpacing="0"
                DisplayHighlightedItemAsLink="true" HighlightAllItemsInPath="true" Indentation="3"
                ApplyMenuDesign="true" WordWrap="true" RenderImageAlt="true" EnableViewState="false" />
        </div>
        <!-- Content -->
        <div class="zoneContent" style="float: right;">
            <cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray">
                <uc1:breadcrumbs runat="server" ID="breadcrumbs" SelectNodesStartPath="" EnableViewState="false" />
            </cms:WebPartContainer>
            <cms:WebPartContainer ID="wpcpageplaceholder" runat="server" ContainerName="Padding.Content">
                <asp:PlaceHolder ID="plcCurrentuser" runat="server" Visible="false">
                    <uc2:currentuser ID="Currentuser1" ShowOnlyWhenAuthenticated="false" runat="server"
                        EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcChangePassword" Visible="false">Here you can
                    change your password if you are signed in<br />
                    <uc3:ChangePassword ID="ChangePassword1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcLogonForm" Visible="false">
                    <uc4:LogonForm ID="LogonForm1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcMyProfile" Visible="false">Only authenticated
                    user can see and edit the profile information.
                    <div class="TabsContent">
                        <uc6:MyProfileWebPart ID="MyProfileWebPart1" runat="server" EnableViewState="false" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcRegistrationForm" Visible="false">
                    <uc7:RegistrationForm ID="RegistrationForm1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcOnlineUsers" Visible="false">You must enable
                    &quot;Monitor online users&quot; in CMS Site Manager -&gt; Settings -&gt; Membership
                    to see currently on-line users.<br />
                    <br />
                    <uc10:OnlineUsers ID="OnlineUsers" runat="server" TransformationName="CMS.Root.OnLineUsers"
                        AdditionalInfoText="{0} user(s) on-line: {2} registered and {1} guests<br /><br />"
                        NoUsersOnlineText="There are currently no users on-line." EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcUserPublicProfile" Visible="false"><span>Displays
                    public profile of the current user or of a user defined in web part properties.</span>
                    <uc11:UserPublicProfile ID="UserPublicProfile" runat="server" AlternativeFormName="CMS.User.DisplayProfile"
                        UserID="53" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcUsersViewer" Visible="false">Displays a list
                    of site users. Displayed users can be limited using the filter section of web part
                    properties.<br />
                    <br />
                    <uc12:UsersViewer ID="UsersViewer1" runat="server" TransformationName="Community.Transformations.MembersList"
                        ShowFilterControl="true" SelectOnlyApproved="true" HideControlForZeroRows="true"
                        ZeroRowsText="No data found" PageSize="10" PagingMode="QueryString" GroupSize="10"
                        HidePagerForSinglePage="false" PagesTemplate="CMS.PagerTransformations.General-Pages" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcCustomRegistrationForm" Visible="false"><span>
                    This web part can be used to display a custom registration form created by an alternative
                    form and let users register using it.</span>
                    <uc9:CustomRegistrationForm ID="CustomRegistrationForm1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcSignOutButton" Visible="false">If you are signed
                    in, you can sign out using this button<br />
                    <uc8:SignOutButton ID="SignOutButton1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcLogonMiniForm" Visible="false">
                    <uc9:LogonMiniForm ID="LogonMiniForm1" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcLiveId" runat="server" Visible="false">
                    <p>
                        This is sample of LiveID login. Application uses special settings for domain <strong>
                            mydomainxy.com</strong>. To make this example work you must edit your <strong>hosts
                                file</strong> to redirect mydomainxy.com to 127.0.0.1,&nbsp;add&nbsp;same
                        domain <strong>alias</strong> to sample Corporate Site,&nbsp;install Kentico into&nbsp;virtual
                        directory named <strong>KenticoCMS&nbsp;</strong>and&nbsp;you<strong> must not be signed
                            in </strong>(control is hidden). Basically you need to make accessible&nbsp;the
                        return URL (<a href="http://mydomainxy.com/KenticoCMS/CMSPages/LiveIDlogin.aspx">http://mydomainxy.com/KenticoCMS/CMSPages/LiveIDlogin.aspx</a>)
                        or register your own domain for the Live ID services. You will need to ask our support
                        for community&nbsp;<strong>license key</strong> for mydomainxy.com.&nbsp;For&nbsp;more
                        information see the documentation.</p>
                    <uc1:WindowsLiveID ID="liveIDLogin" runat="server" ShowSignOut="true" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcLiveData" runat="server" Visible="false">
                    <p>
                        <strong>LiveID reuqired data </strong>is a webpart which allows you to join LiveID
                        with existing user account. If the page where this webpart sits is set in settings
                        (Required user data page), user who signs in by LiveID is redirected to this page.<br />
                        If he already has some account&nbsp;he can use&nbsp;existing user part and login
                        with his current credentials. His LiveID will be joined with the&nbsp;account. Otherwise&nbsp;he&nbsp;can
                        use the other part&nbsp;to create new user. <strong>LiveID sign in must occur</strong>,
                        otherwise webpart does not have needed data and does nothing - normally would not
                        be visible.</p>
                    <uc1:LiveIDUsersRequiredData ID="LiveIDUsersRequiredData1" AllowExistingUser="true"
                        AllowFormsAuthentication="true" runat="server" EnableViewState="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcMyAccount" runat="server" Visible="false">
                    <asp:Label ID="lblMyAccount" runat="server" Visible="false" />
                    <uc4:MyAccount ID="MyAccount1" runat="server" DisplayMyAddresses="true" DisplayMyCredits="true"
                        Visible="false" />
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="plcUsersSmartSearch" Visible="false">
                    <cms:CMSEditableRegion runat="server" ID="ExampleText" ShowForDocumentTypes="CMS.MenuItem"
                        RegionType="HtmlEditor" />
                    <cms:SearchDialogWithResults ID="SearchDialogWithResults" runat="server" Indexes="CorporateSiteASPX.Users"
                        TransformationName="CMS.Root.SmartSearchResultsWithImages" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcOpenIDLogon" runat="server" Visible="false">
                    <p>
                        This is an example of an <strong>OpenID login webpart</strong>. If OpenID module
                        is enabled then users can sign in or sign up to this site with their <strong>existing
                            OpenID accounts</strong>. OpenID account can be created on various sites such
                        as yahoo.com or google.com so it is very likely that <strong>every user already has
                            one or more OpenID accounts</strong>. Editor can specify OpenID providers in
                        the webpart properties and then user chooses preferred provider to log in. User
                        is redirected to the <strong>OpenID provider-specific login page</strong> after
                        clicking on the button. After successful authentication user is redirected back
                        to this site where he might be logged in or requested to enter additional data if
                        a page with <strong>OpenID required data webpart is specified</strong> in the OpenID
                        category of the Settings. Please see <a href="http://openid.net/get-an-openid/start-using-your-openid/">
                            http://openid.net/get-an-openid/start-using-your-openid/</a> for more information
                        about OpenID.</p>
                    <cms:OpenIDLogon ID="openIDlogon" runat="server" SignInText="Sign in" SignOutText="Sign out"
                        ShowAsButton="true" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcOpenIDData" runat="server" Visible="false">
                    <p>
                        <strong>OpenID required data</strong> is a webpart which allows you to join OpenID
                        with existing user account. If the page where this webpart sits is set in the OpenID
                        category of site settings (Required user data page), user who signs in by OpenID
                        logon webpart is redirected to this page.<br />
                        If user already has an account he can use existing user part and login with his
                        current credentials. User's OpenID will be joined with the account. Otherwise user
                        can use the other part to create new user.</p>
                    <cms:OpenIDUserRequiredData ID="openIDUserRequiredData" AllowExistingUser="true"
                        AllowFormsAuthentication="true" runat="server" HideForNoOpenID="false" DefaultTargetUrl="~/Examples/WebParts/Membership/OpenID-logon.aspx" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcFacebookLogon" runat="server" Visible="false">
                    <p>
                        This is an example of an <strong>Facebook Connect login webpart</strong>. To make
                        this example work you need to set up a basic Facebook application, get an API key
                        and application secret and set those values into the Settings. If Facebook Connect
                        is enabled then users can sign in or sign up to this site with their <strong>existing
                            Facebook accounts</strong>. After successful authentication user is redirected
                        back to this site where user might be logged in or requested to enter additional
                        data if a page with <strong>Facebook Connect required data webpart is specified</strong>
                        in the Settings. Please see the documentation for more information.
                    </p>
                    <cms:FacebookLogon ID="facebookConnectLogon" runat="server" ShowSignOut="true" ShowAsButton="true"
                        LatestVersion="true" />
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="plcFacebookRequiredData" runat="server" Visible="false">
                    <p>
                        <strong>Facebook Connect required data</strong> is a webpart which allows you to
                        join Facebook user ID with existing user account. If the page where this webpart
                        sits is set in the site settings (Required user data page), user who signs in by
                        Facebook Connect logon webpart is redirected to this page. If user already has an
                        account he can use existing user part and login with his current credentials. User's
                        Facebook ID will be joined with the account. Otherwise user can use the other part
                        to create new user.
                    </p>
                    <cms:FacebookUserRequiredData ID="facebookUserRequiredData" AllowExistingUser="true"
                        AllowFormsAuthentication="true" runat="server" HideForNoFacebookID="false" />
                </asp:PlaceHolder>
            </cms:WebPartContainer>
        </div>
    </div>
</asp:Content>
