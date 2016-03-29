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

using CMS.GlobalHelper;
using CMS.SettingsProvider;
using CMS.FormEngine;
using CMS.UIControls;
using CMS.PortalEngine;

public partial class CMSModules_Widgets_Controls_WidgetPropertiesFieldEditor : CMSUserControl
{
    #region "Variables"

    private int mWidgetId = 0;
    private WebPartInfo webpartInfo;
    private WidgetInfo widgetInfo;

    #endregion


    #region "Public properties"

    /// <summary>
    /// Indicates if system fields (node and document fields) are enabled.
    /// </summary>
    public bool EnableSystemFields
    {
        get
        {
            return fieldEditor.EnableSystemFields;
        }
        set
        {
            fieldEditor.EnableSystemFields = value;
        }
    }


    /// <summary>
    /// Indicates if field visibility selector should be displayed.
    /// </summary>
    public bool ShowFieldVisibility
    {
        get
        {
            return fieldEditor.ShowFieldVisibility;
        }
        set
        {
            fieldEditor.ShowFieldVisibility = value;
        }
    }


    /// <summary>
    /// Widget ID. Widget contains altered form definition.
    /// </summary>
    public int WidgetID
    {
        get
        {
            return mWidgetId;
        }
        set
        {
            mWidgetId = value;
        }
    }

    #endregion


    #region "Public events"

    public delegate void OnAlternativeFieldEditorSaveEventHandler();

    public event OnAlternativeFieldEditorSaveEventHandler OnBeforeSave;

    #endregion


    #region "Methods"

    protected void Page_Load(object sender, EventArgs e)
    {
        widgetInfo = WidgetInfoProvider.GetWidgetInfo(this.WidgetID);
        if (widgetInfo != null)
        {
            webpartInfo = WebPartInfoProvider.GetWebPartInfo(widgetInfo.WidgetWebPartID);
            fieldEditor.DisplayIn = FormInfo.DISPLAY_CONTEXT_DASHBOARD;

            if (webpartInfo != null)
            {
                // Merge class and alternative form definitions
                string formDef = FormHelper.MergeFormDefinitions(webpartInfo.WebPartProperties, widgetInfo.WidgetProperties);

                // Use alternative form mode for field editor
                fieldEditor.Mode = FieldEditorModeEnum.General;
                fieldEditor.FormDefinition = formDef;
                fieldEditor.IsAlternativeForm = true;

                // Use same control for widgets as for webparts
                fieldEditor.DisplayedControls = FieldEditorControlsEnum.Controls;

                // Handle definition update (move up, move down, delete, OK button)
                fieldEditor.OnAfterDefinitionUpdate += fieldEditor_OnAfterDefinitionUpdate;
            }
        }
        else
        {
            fieldEditor.Visible = false;
            ShowErrorMessage();
        }
    }


    /// <summary>
    /// After form definition update event handler.
    /// </summary>
    protected void fieldEditor_OnAfterDefinitionUpdate(object sender, EventArgs e)
    {
        // Perform OnBeforeSave if defined
        if (OnBeforeSave != null)
        {
            OnBeforeSave();
        }

        // Stop processing if set from outside
        if (StopProcessing)
        {
            return;
        }

        if ((widgetInfo != null) && (webpartInfo != null))
        {
            // Compare original and alternative form definitions - store differences only
            widgetInfo.WidgetProperties = FormHelper.GetFormDefinitionDifference(webpartInfo.WebPartProperties, fieldEditor.FormDefinition);
            // Update alternative form info in database
            WidgetInfoProvider.SetWidgetInfo(widgetInfo);
        }
        else
        {
            ShowErrorMessage();
        }
    }


    /// <summary>
    /// Shows invalid id message.
    /// </summary>
    protected void ShowErrorMessage()
    {
        pnlError.Visible = true;
    }

    #endregion
}
