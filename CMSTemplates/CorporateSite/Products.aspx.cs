using System;
using System.Web;

using CMS.CMSHelper;
using CMS.PortalEngine;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_Products : TemplatePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (CurrentPage != null)
        {
            ProductDataList.SelectedItemTransformationName = CurrentPage.ClassName + ".default";
            
            // When product detail
            switch (CurrentPage.ClassName.ToLower())
            {
                case "cms.cellphone":
                case "cms.pda":
                case "cms.laptop":
                case "cms.product":

                    // Show "Print" link
                    plcPrint.Visible = true;

                    string className = CurrentPage.ClassName;
                    string path = CurrentPage.NodeAliasPath;
                    lnkPrint.NavigateUrl = "~/SpecialPages/Print.aspx?printpath=" + path + "&classname=" + className;

                    // Show "Send to friend" form
                    ucSendToFriend.Visible = true;

                    ucSendToFriend.ClassNames = "cms.cellphone;cms.laptop;cms.pda;cms.product";
                    ucSendToFriend.EmailFrom = "admin@localhost.local";
                    ucSendToFriend.EmailSubject = "Product recommendation";
                    ucSendToFriend.HeaderText = "Send to friend";
                    ucSendToFriend.EmailTemplate = "<strong>Message:<br /></strong>{%Message%}<br /><br /><strong>Document:</strong><br />{%Document%}";
                    ucSendToFriend.TransformationName = "ecommerce.transformations.sendtofriend";

                    break;
            }
        }        
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        imgPrint.ImageUrl = GetImageUrl("General/Print.png");
    }
}
