using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using CMS.FormControls;
using CMS.GlobalHelper;
using CMS.SiteProvider;
using CMS.TreeEngine;
using CMS.CMSHelper;


using CMS.PortalControls;
using CMS.WebAnalytics;


using CMS.DatabaseHelper;
using CMS.DataEngine;
using CMS.SettingsProvider;

using CMS.FormEngine;

using AjaxControlToolkit;


public partial class CMSEjemplosFer_SelectorCultivoPlagaMes : FormEngineUserControl
{
    private object mFormControlParameter = null;

    private string MesAtaque;
    private Int32 mUserID;
    private Int32 mCultivoID;
    private Int32 mPlagaID; 
    private DataTable mtcultivoplagaestadofenologico;


 
    
    public override Object Value
    {
        get
        {
            MesAtaque = "";
            foreach (ListItem mes in this.cklistmes.Items)
            {
                if (mes.Selected)
                {
                    MesAtaque += "|" + mes.Value.ToString();
                }
            }          
             return MesAtaque;
        }
        set
        {            
            MesAtaque = System.Convert.ToString(value);
            string[] meses = MesAtaque.Split('|');
            foreach (string mes in meses)
            {
                if (mes != string.Empty)
                {
                    this.cklistmes.Items[int.Parse(mes)-1].Selected = true;
                }
            }
        }
    }

   
    /// <summary>
    /// Returns an array of values of any other fields returned by the control.
    /// </summary>
    /// <returns>It returns an array where the first dimension is the attribute name and the second is its value.</returns>
    public override object[,] GetOtherValues()
    {
        object[,] array = new object[1, 2];
        array[0, 0] = "ProductColor";
       // array[0, 1] = drpTerritorio.SelectedItem.Text;
        return array;
    }

    /// <summary>
    /// Returns true if a color is selected. Otherwise, it returns false and displays an error message.
    /// </summary>
    public override bool IsValid()
    {
             return true;
            
        }



    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.IsPostBack)
        {
           
        }

    }
      
}
