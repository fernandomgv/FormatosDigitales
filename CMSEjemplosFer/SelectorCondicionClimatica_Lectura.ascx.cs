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


public partial class CMSEjemplosFer_SelectorCondicionClimaticaLectura : FormEngineUserControl
{
    private object mFormControlParameter = null;

    private string CultivoUser_IDS;
    private Int32 mUserID;
    private Int32 mTerritorioID;
    private Int32 mPlagaID;
    private Int32 mBaseHechoID;
    private DataTable mtCondicionesClimaticas;


    protected DataTable tbCondicionesClimaticas
    {
        get
        {
            if (CMS.GlobalHelper.SessionHelper.GetValue("CondicionesClimaticas") == null)
            {
                mtCondicionesClimaticas = this.NewtbBaseConocimiento();
            }
            else
            {
                mtCondicionesClimaticas = (DataTable)CMS.GlobalHelper.SessionHelper.GetValue("CondicionesClimaticas");
            }
            return mtCondicionesClimaticas;
        }
        set
        {
            mtCondicionesClimaticas = value;
            CMS.GlobalHelper.SessionHelper.SetValue("CondicionesClimaticas", this.mtCondicionesClimaticas);

        }
    }
    /// <summary>
    /// Gets or sets the value entered into the field, a hexadecimal color code in this case.
    /// </summary>
    /// 
    protected int TerritorioID
    {
        get
        {
            if (!(this.Form.FindControl("TerritorioID").FindControl("drpTerritorio") == null))
                    {
                        this.mTerritorioID = ValidationHelper.GetInteger(((DropDownList)(this.Form.FindControl("TerritorioID").FindControl("drpTerritorio"))).SelectedValue, 0);
                    }
                    else
                    {
                        this.mTerritorioID = 0;
                    }
            return this.mTerritorioID;
        }
        set
        {
            this.mTerritorioID = value;
        }
    }

   
    protected int BaseHechoID
    {
        get
        {
            if (string.IsNullOrEmpty(this.Form.GetDataValue("ItemID").ToString()))
            {
                this.mBaseHechoID = 0;
            }
            else
            {
                this.mBaseHechoID = System.Int32.Parse(this.Form.GetDataValue("ItemID").ToString());
            }
            return mBaseHechoID;
        }
        set
        {
            this.mBaseHechoID = value;
        }
    }
    protected int UserID
    {
        get 
        {
            if (string.IsNullOrEmpty(this.Form.GetDataValue("UserId").ToString()))
            {
                this.mUserID = 0;
            }
            else
            {
                this.mUserID = System.Int32.Parse(this.Form.GetDataValue("UserId").ToString());
            }
            return mUserID; 
        }
        set {
            this.mUserID = value;
        }
    }
    
    public override Object Value
    {
        get
        {
            CultivoUser_IDS = "1|2";
            return CultivoUser_IDS;// drpTerritorio.SelectedValue;
        }
        set
        {
            // Ensure drop down list options
            CultivoUser_IDS = System.Convert.ToString(value);
            //EnsureItems();
            
            //drpTerritorio.SelectedValue = System.Convert.ToString(value);
        }
    }

    /// <summary>
    /// Property used to access the Width parameter of the form control.
    /// </summary>
    public int SelectorWidth
    {
        get
        {
            return ValidationHelper.GetInteger(GetValue("SelectorWidth"), 0);
        }
        set
        {
            SetValue("SelectorWidth", value);
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
        this.saveBaseConocimiento();
        bool valid = true;
        bool validall = true;
        this.ValidationError = "";
        string csCrLf = "\r\n";
        string csKeyTab = "\t";
        //ejecutamos la logica para la persistencia de los datos
        foreach (DataRow dr in this.mtCondicionesClimaticas.Rows)
        {
            int ItemID = ValidationHelper.GetInteger(dr[0], 0);
            int chk = ValidationHelper.GetInteger(dr[1], 0);
            int BaseConocimientoID = ValidationHelper.GetInteger(dr[2], 0);
            int CondicionClimaticaID = ValidationHelper.GetInteger(dr[3], 0);
            double ValorMinimo = ValidationHelper.GetDouble(dr[4], 0);
            double ValorMaximo = ValidationHelper.GetDouble(dr[5], 0);
            double ValorMedioAcumulado = ValidationHelper.GetDouble(dr[6], 0);
            double PerioTiempoAcumulado = ValidationHelper.GetDouble(dr[7], 0);
            String CondicionClimatica = ValidationHelper.GetString(dr[8], "");
            //revisamos unicamente los valores de los cultivos seleccionados y de aquellos campos considerados mandatorios

            if (chk == 1)
            {
                if (ValorMaximo < ValorMinimo)
                {
                    valid = false;
                    this.ValidationError += csKeyTab + "El Valor Minimo, no puede ser mayor que el Valor Maximo" + csCrLf;
                }
                if ((ValorMedioAcumulado < ValorMinimo) | (ValorMedioAcumulado > ValorMaximo))
                {
                    valid = false;
                    this.ValidationError += csKeyTab + "El Valor Medio Acumulado, no puede ser mayor que el Valor Maximo, ni menor que el Valor Minimo" + csCrLf;
                }
            }
            if (!valid)
            {
                validall = false;
                this.ValidationError = "[" + CondicionClimatica + "] : " + csCrLf + this.ValidationError;
            }
            valid = true;
        }

        if (validall)
        {
            return true;
        }
        else
        {
            // Set form control validation error message.
            //this.ValidationError = "Pasamos por la verificacion";
            return false;

        }
            
        }
    

    /// <summary>
    /// Sets up the internal DropDownList control.
    /// </summary>
    protected void EnsureItems(int TerriterioID, int BaseHechoID)
    {
        GeneralConnection cn = ConnectionHelper.GetConnection();
        //dataset con los usuarios a notificar
        DataSet CultivoByUser = new DataSet();
        QueryDataParameters parameters = new QueryDataParameters();

        parameters.Add("@TerritorioID", this.TerritorioID);       
        parameters.Add("@BaseHechoID", this.BaseHechoID);

        CultivoByUser = ConnectionHelper.ExecuteQuery("customtable.Base_Hechos_Lecturas_CondicionClimatica.Condicion_ClimaticabyBaseHechoID", parameters);

        this.GridView1.DataSource = CultivoByUser;
        this.GridView1.DataBind();
    }
    protected void EnsureItems()
    {
        EnsureItems(this.TerritorioID, this.BaseHechoID);
        
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        
       // this.Form.OnAfterSave += new EventHandler(Form_OnAfterSave);
        ((CMS.FormControls.CustomTableForm)this.Form.Parent).OnAfterSave += new EventHandler(Form_OnAfterSave);

       
    }

    private DataTable  NewtbBaseConocimiento()
    {
        var tb = new DataTable();
        tb.Columns.Add("ItemID", Type.GetType("System.Int32"));
        tb.Columns.Add("Checked", Type.GetType("System.Int32"));
        tb.Columns.Add("BaseHechoID", Type.GetType("System.Int32"));
        tb.Columns.Add("CondicionClimaticaID", Type.GetType("System.Int32"));
        tb.Columns.Add("ValorMinimo", Type.GetType("System.Double"));
        tb.Columns.Add("ValorMaximo", Type.GetType("System.Double"));
        tb.Columns.Add("ValorMedio", Type.GetType("System.Double"));
        tb.Columns.Add("ValorMedicionReal", Type.GetType("System.Double"));
        tb.Columns.Add("CondicionClimatica", Type.GetType("System.String"));    
        return tb;
    }
 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.IsPostBack)
        {
            EnsureItems();
            CMS.GlobalHelper.SessionHelper.SetValue("mterritoriosuscripcion", this.TerritorioID);
           // this.tbcultivoplagaestadofenologico = this.NewtbcultivosplagaestadoF();
        }

    }
    private void saveBaseConocimiento()
    {                //recuperamos el estado actual de la grilla y la guardamos
        this.tbCondicionesClimaticas.Rows.Clear();
        foreach (GridViewRow dr in GridView1.Rows)
        {
            if (!(((System.Web.UI.WebControls.WebControl)(((System.Web.UI.WebControls.TableRow)(dr)).Cells[3])).Controls[1] == null))
            {
                var datar = this.tbCondicionesClimaticas.NewRow();
                datar[0] = this.GridView1.DataKeys[dr.RowIndex].Values[0];
                CheckBox chkb = (CheckBox)dr.FindControl("CheckBox1");
                if (chkb.Checked)
                {
                    datar[1] = 1;
                }
                else
                {
                    datar[1] = 0;
                }
                datar[8] = chkb.Text;
                datar[2] = this.GridView1.DataKeys[dr.RowIndex].Values[2];
                datar[3] = this.GridView1.DataKeys[dr.RowIndex].Values[3];
                                
                TextBox TxtValorMinimo = (TextBox)dr.FindControl("TxtValorMinimo");
                TxtValorMinimo.Text=TxtValorMinimo.Text.Replace('.', ',');
                datar[4] = ValidationHelper.GetDouble(TxtValorMinimo.Text, 0);

                TextBox TxtValorMaximo = (TextBox)dr.FindControl("TxtValorMaximo");
                TxtValorMaximo.Text=TxtValorMaximo.Text.Replace('.', ',');
                datar[5] = ValidationHelper.GetDouble(TxtValorMaximo.Text, 0);

                TextBox TxtValorMedio = (TextBox)dr.FindControl("TxtValorMedio");
                TxtValorMedio.Text = TxtValorMedio.Text.Replace('.', ',');
                datar[6] = ValidationHelper.GetDouble(TxtValorMedio.Text, 0);

                TextBox TxtValorMedicionReal = (TextBox)dr.FindControl("TxtValorMedicionReal");
                TxtValorMedicionReal.Text = TxtValorMedicionReal.Text.Replace('.', ',');
                datar[7] = ValidationHelper.GetDouble(TxtValorMedicionReal.Text, 0);

                this.mtCondicionesClimaticas.Rows.Add(datar);
            }
        }
        CMS.GlobalHelper.SessionHelper.SetValue("CondicionesClimaticas", this.mtCondicionesClimaticas);
   }   

    void Form_OnAfterSave(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
        //intentariamos guardar la relacion detalle
        //Se comprueba que el evento es llamado desde el formulario
        //padre tras realizar la insersion de un usuario
        if (this.BaseHechoID>0) 
        {
            //Poblamos a una tabla temporal los datos contenidos en la interface
            this.saveBaseConocimiento();
            //ejecutamos la logica para la persistencia de los datos
            foreach (DataRow dr in this.mtCondicionesClimaticas.Rows)
            {
                //tenmos un ItemID                            
                int ItemID = ValidationHelper.GetInteger(dr[0], 0);
                int chk = ValidationHelper.GetInteger(dr[1], 0);
                int BaseHechoID = ValidationHelper.GetInteger(dr[2], 0);
                int CondicionClimaticaID = ValidationHelper.GetInteger(dr[3], 0);
                double ValorMinimo = ValidationHelper.GetDouble(dr[4], 0);
                double ValorMaximo = ValidationHelper.GetDouble(dr[5], 0);
                double ValorMedio = ValidationHelper.GetDouble(dr[6], 0);
                double ValorMedicionReal = ValidationHelper.GetDouble(dr[7], 0);
                String CondicionClimatica = ValidationHelper.GetString(dr[8], "");       
        
                if (ItemID > 0)
                {
                    SimpleDataClass BaseHecho = new SimpleDataClass("customtable.Base_Hechos_Lecturas_CondicionClimatica", ItemID);
                    if (chk == 0)
                    {
                        //Este parametro, ha sido descarmado
                        //Se procede a eliminar
                        if (!BaseHecho.IsEmpty())
                        {
                            BaseHecho.Delete();
                        }
                    }
                    else
                    { //debemos actualizar el registro seleccionado
                        if (!BaseHecho.IsEmpty())
                        {
                            //BaseConocimiento.SetValue("BaseConocimientoID", BaseConocimientoID);
                            BaseHecho.SetValue("BaseHechoID", this.BaseHechoID);
                            BaseHecho.SetValue("CondicionClimaticaID", CondicionClimaticaID);
                            BaseHecho.SetValue("ValorMinimo", ValorMinimo);
                            BaseHecho.SetValue("ValorMaximo", ValorMaximo);
                            BaseHecho.SetValue("ValorMedio", ValorMedio);
                            BaseHecho.SetValue("ValorMedicionReal", ValorMedicionReal);
                            BaseHecho.Update();
                        }

                    }
                  }
                else
                {//procedemos a insertar una nueva fila
                    if (chk == 1)
                    {

                        string className = "customtable.Base_Hechos_Lecturas_CondicionClimatica"; // cultivouser.ClassName;
                        CustomTableItem BaseHechoIT = null;
                        CustomTableItemProvider provider = new CustomTableItemProvider(CMSContext.CurrentUser);
                        BaseHechoIT = new CustomTableItem(className, provider);

                        BaseHechoIT.SetValue("BaseHechoID", this.BaseHechoID);
                        BaseHechoIT.SetValue("CondicionClimaticaID", CondicionClimaticaID);
                        BaseHechoIT.SetValue("ValorMinimo", ValorMinimo);
                        BaseHechoIT.SetValue("ValorMaximo", ValorMaximo);
                        BaseHechoIT.SetValue("ValorMedio", ValorMedio);
                        BaseHechoIT.SetValue("ValorMedicionReal", ValorMedicionReal);

                        if (BaseHechoIT.OrderEnabled)
                        {
                            BaseHechoIT.ItemOrder = provider.GetLastItemOrder(className) + 1;
                        }
                        BaseHechoIT.Insert();

                    }
                }
            }
            
        }
    }

    protected bool inttobol(object value)
    {
        if (value.ToString() == "0")
        { return false; }
        else { return true; }
    }

   
    /// <summary>
    /// Helper parameter - ID of selected item of parent control 
    /// </summary>
    public override object FormControlParameter
    {
        get
        {
            return mFormControlParameter;
        }
        set
        {
            mFormControlParameter = value;

            if (mFormControlParameter != null)
            {
                string cad ="";
                cad=ValidationHelper.GetString(mFormControlParameter, "");

                if (ValidationHelper.GetInteger(CMS.GlobalHelper.SessionHelper.GetValue("mterritoriosuscripcion"), 0) != ValidationHelper.GetInteger(cad, 0))
                {
                    CMS.GlobalHelper.SessionHelper.SetValue("mterritoriosuscripcion", ValidationHelper.GetInteger(cad, 0));
                    //EnsureItems(this.UserID, ValidationHelper.GetInteger(cad, 0));
                    EnsureItems(this.TerritorioID, this.BaseHechoID);
                }

                

                }
                else
                {
                    // Hide current form control
                 //   this.Visible = false;
                 //   Label lblField = (Label)this.Form.FieldLabels[this.FieldInfo.Name];
                 //   lblField.Visible = false;
                  //  this.drpRelated.Items.Clear();
                ;
                }
            }
        }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox TxtValorMinimo = (TextBox)e.Row.FindControl("TxtValorMinimo");
            TxtValorMinimo.Attributes["onchange"] = "javascript: Changed( this,2 );";

            TextBox TxtValorMaximo = (TextBox)e.Row.FindControl("TxtValorMaximo");
            TxtValorMaximo.Attributes["onchange"] = "javascript: Changed( this,2 );";

            TextBox TxtValorMedio = (TextBox)e.Row.FindControl("TxtValorMedio");
            TxtValorMedio.Attributes["onchange"] = "javascript: Changed( this,2 );";

            TextBox TxtValorMedicionReal = (TextBox)e.Row.FindControl("TxtValorMedicionReal");
            TxtValorMedicionReal.Attributes["onchange"] = "javascript: Changed( this,2 );";
        }
    }
}
