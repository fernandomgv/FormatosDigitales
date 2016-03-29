using System;
using System.Web;

using CMS.CMSHelper;
using CMS.GlobalHelper;
using CMS.UIControls;

public partial class CMSTemplates_CorporateSiteASPX_WebParts_ListingsAndViewers : TemplatePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aliasPath = CMSContext.CurrentAliasPath.ToLower();

        if (aliasPath.EndsWith("/attachments"))
        {
            plcAttachments.Visible = true;
            attachments.Visible = true;
            attachments.ReloadData();
        }
        else if (aliasPath.EndsWith("/calendar"))
        {
            plcCalendar.Visible = true;
            cmscalendar.Visible = true;            
        }
        else if (aliasPath.EndsWith("/content-slider"))
        {
            plcContentSlider.Visible = true;
            ContentSlider.Visible = true;
            ContentSlider.ReloadData();
        }
        else if (aliasPath.EndsWith("/datalist"))
        {
            plcDatalist.Visible = true;
            cmsdatalist.Visible = true;
        }
        else if (aliasPath.EndsWith("/datalist-with-custom-query"))
        {
            plcDatalistWithCustomQuery.Visible = true;
            querydatalist.Visible = true;
        }
        else if (aliasPath.EndsWith("/document-pager"))
        {
            plcDocumentPager.Visible = true;
            DocumentPager.Visible = true;
            DocumentPager.ReloadData();
        }
        else if (aliasPath.EndsWith("/grid"))
        {
            plcGrid.Visible = true;
            CMSDataGrid1.Visible = true;
        }
        else if (aliasPath.EndsWith("/grid-with-custom-query"))
        {
            plcGridWithCustomQuery.Visible = true;
            querydatagrid.Visible = true;
        }
        else if (aliasPath.EndsWith("/image-gallery"))
        {
            plcImageGallery.Visible = true;
            ImageGallery.Visible = true;
        }
        else if (aliasPath.EndsWith("/lightbox"))
        {
            plcLightbox.Visible = true;
            lightbox.Visible = true;
            lightbox.ReloadData();
        }
        else if (aliasPath.EndsWith("/random-document"))
        {
            plcRandomDocument.Visible = true;
            randomDocument.Visible = true;
            randomDocument.ReloadData();
        }
        else if (aliasPath.EndsWith("/related-documents"))
        {
            plcRelatedDocuments.Visible = true;
            relateddocuments.Visible = true;
        }
        else if (aliasPath.EndsWith("/repeater"))
        {
            plcRepeater.Visible = true;
            repeater.Visible = true;
        }
        else if (aliasPath.EndsWith("/repeater-with-custom-query"))
        {
            plcRepeaterWithCustomQuery.Visible = true;
            queryrepeater.Visible = true;
        }
        else if (aliasPath.EndsWith("/scrolling-text"))
        {
            plcScrollingText.Visible = true;
            ScrollingText.Visible = true;
            ScrollingText.ReloadData();
        }
        else if (aliasPath.EndsWith("/xslt-viewer"))
        {
            plcXsltViewer.Visible = true;
            cmsxsltlist.Visible = true;
        }
        else if (aliasPath.EndsWith("/send-to-friend"))
        {
            plcSendToFriend.Visible = true;
            sendtofriend.Visible = true;
        }
        else if (aliasPath.EndsWith("/page-views"))
        {
            plcPageViews.Visible = true;
            pageviews.Visible = true;
        }
    }
}
