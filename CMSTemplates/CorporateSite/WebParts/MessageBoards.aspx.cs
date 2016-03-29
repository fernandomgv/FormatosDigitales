using System;
using System.Web;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_MessageBoards : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();
        if (aliasPath.ToLower().EndsWith("/message-boards"))
        {
            this.lblWelcomeText.Text = "Message boards category";
            this.plcWelcome.Visible = true;
            this.plcMessageBoard.Visible = false;
        }
        else if (aliasPath.ToLower().EndsWith("/message-board"))
        {
            this.plcRepeater.Visible = true;

            this.messageBoardASPX.BoardAccess = CMS.SiteProvider.SecurityAccessEnum.AllUsers;
            this.messageBoardASPX.BoardOwner = "document";
            this.messageBoardASPX.ShowApprove = true;
            this.messageBoardASPX.ShowDelete = true;
            this.messageBoardASPX.ShowEdit = true;
            this.messageBoardASPX.ShowReject = true;
            this.messageBoardASPX.BoardRequireEmails = true;
            this.messageBoardASPX.BoardUseCaptcha = true;
            this.messageBoardASPX.BoardOpened = true;
            this.messageBoardASPX.EnableAnonymousRead = true;
            this.messageBoardASPX.WebPartTitle = "MessageBoardASPX";
        }

        else if (aliasPath.ToLower().EndsWith("/message-board-viewer"))
        {
            this.plcMessageBoardViewer.Visible = true;
            this.plcMessageBoard.Visible = false;
        }

        this.messageBoardASPX.ReloadData();        
    }
}
