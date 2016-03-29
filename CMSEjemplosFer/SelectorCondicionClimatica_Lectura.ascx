<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SelectorCondicionClimatica_Lectura.ascx.cs" Inherits="CMSEjemplosFer_SelectorCondicionClimaticaLectura" %>
<%--<ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</ajaxToolkit:ToolkitScriptManager>--%>
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<script type="text/javascript" language="javascript">
function Changed( mytxt,dcm)
{
   //alert( mytxt.value);
  // alert (mytxt.id);
  // mytxt.value= mytxt.value + '.00'
   var numval = Number( mytxt.value)
   if ( isNaN(numval))
   {
   mytxt.style.border = '1px solid red';;
   alert('revise el valor ingresado, se espera un numero');
   }
   else
   {
   if ( isNaN(dcm))
   {
    dcm=2;
   }
   mytxt.value=numval.toFixed(dcm);
   mytxt.style.border = '';
   };
  // alert ( numval.toString());
};
</script>
<asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" 
     DataKeyNames="ItemID,BaseConocimientoID,CondicionClimaticaID," Width="650px" >
    <Columns>
      <%-- <asp:BoundField DataField="ItemID" Visible="False" />
        <asp:BoundField DataField="BaseConocimientoID" Visible="False" />
        <asp:BoundField DataField="CondicionClimaticaID" Visible="False" />--%>
       <%-- <asp:BoundField DataField="CondicionClimatica" 
            HeaderText="Parametro (Condicion Climatica)">
            <ControlStyle Width="300px" />
        </asp:BoundField>--%>
       <%--<asp:TemplateField HeaderText="Valor Minimo">
            <ItemTemplate>
                <asp:TextBox ID="TxtValorMinimo" Text=<%#Eval("ValorMinimo")%> style="text-align:right;" runat="server" Width="70px"></asp:TextBox>
            </ItemTemplate>
            <ControlStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Valor Maximo">
            <ItemTemplate>
                <asp:TextBox ID="TxtValorMaximo" Text=<%#Eval("ValorMaximo")%> style="text-align:right;" runat="server" Width="70px"></asp:TextBox>
            </ItemTemplate>
            <ControlStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Valor Medio Acumulado">
            <ItemTemplate>
                <asp:TextBox ID="TxtValorMedioAcumulado" Text=<%#Eval("ValorMedioAcumulado")%> style="text-align:right;" runat="server" Width="70px"></asp:TextBox>
            </ItemTemplate>
            <ControlStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Periodo Tiempo Acumulado">
            <ItemTemplate>
                <asp:TextBox ID="TxtPeriodoTiempoAcumulado" Text=<%#Eval("PerioTiempoAcumulado")%> style="text-align:right;" runat="server" Width="70px"></asp:TextBox>
            </ItemTemplate>
            <ControlStyle Width="100px" />
        </asp:TemplateField>--%>
    </Columns>
    <EmptyDataTemplate>
        No Existen ESTADOS FENOLOGICOS definidos   para el CULTIVOS seleccionado. Contacte al 
        administrador de la Aplicacion para realizar el registro de ESTADOS FENOLOGICOS , la cual se 
        realiza en la seccion:<br />
        [TERRITORIO]\[CULTIVOS] en el Sitio Web de la Aplicacion SPATS : <a href="http://spats.pe.iica.int/Modulos-en-Implementacion.aspx" target="_blank"> Ir al Sitio Web</a>
    </EmptyDataTemplate>
</asp:GridView>



<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="ItemID,Checked,BaseHechoID,CondicionClimaticaID" 
    onrowdatabound="GridView1_RowDataBound"  >
<Columns>
      <asp:BoundField DataField="ItemID" Visible="False" />
        <asp:BoundField DataField="BaseHechoID" Visible="False" />
        <asp:BoundField DataField="CondicionClimaticaID" Visible="False" />
<%--       <asp:BoundField DataField="CondicionClimatica" 
            HeaderText="Parametro (Condicion Climatica)">
            <ControlStyle Width="300px" />
        </asp:BoundField>--%>
        <asp:TemplateField HeaderText="Parametro (Condicion Climatica)">
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" 
                    Checked= <%# inttobol( Eval("Checked"))%> Text = <%#Eval("CondicionClimatica")%> 
                    AutoPostBack="False"    />
            </ItemTemplate>
            <ControlStyle Width="300px" />
        </asp:TemplateField>
       <asp:TemplateField HeaderText="Valor Minimo">
            <ItemTemplate>
                <asp:TextBox ID="TxtValorMinimo" Text=<%#Eval("ValorMinimo")%> style="text-align:right;" runat="server" Width="70px"></asp:TextBox>
            </ItemTemplate>
            <ControlStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Valor Maximo">
            <ItemTemplate>
                <asp:TextBox ID="TxtValorMaximo" Text=<%#Eval("ValorMaximo")%> style="text-align:right;" runat="server" Width="70px"></asp:TextBox>
            </ItemTemplate>
            <ControlStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Valor Medio ">
            <ItemTemplate>
                <asp:TextBox ID="TxtValorMedio" Text=<%#Eval("ValorMedio")%> style="text-align:right;" runat="server" Width="70px"></asp:TextBox>
            </ItemTemplate>
            <ControlStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Valor Medicion Real">
            <ItemTemplate>
                <asp:TextBox ID="TxtValorMedicionReal" Text=<%#Eval("ValorMedicionReal")%> style="text-align:right;" runat="server" Width="70px"></asp:TextBox>
            </ItemTemplate>
            <ControlStyle Width="100px" />
        </asp:TemplateField>
    </Columns>
     <EmptyDataTemplate>
        No Existen Parametros Climatologicos definidos   para el Territorio seleccionado. Contacte al 
        administrador de la Aplicacion para realizar el registro de Parametros Climatologicos  , la cual se 
        realiza en la seccion:<br />
        [TERRITORIO]\[ADMINISTRAR PARAMETROS CLIMATOLOGICOS] en el Sitio Web de la Aplicacion SPATS : <a href="http://spats.pe.iica.int/Modulos-en-Implementacion.aspx" target="_blank"> Ir al Sitio Web</a>
    </EmptyDataTemplate>
</asp:GridView>




