<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminEjecucionPronosticoDetalle.ascx.cs" Inherits="CMSWebParts_SPATS_AdminEjecucionPronosticoDetalle" %>
<%@ Register assembly="CMS.CKEditor" namespace="CMS.CKEditor" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        text-align: center;
    }
</style>


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="ItemID" DataSourceID="SqlDataSource1" 
    onrowdatabound="GridView1_RowDataBound" 
    onrowcommand="GridView1_RowCommand" AllowPaging="True" PageSize="1">
    <Columns>
        <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" 
            ReadOnly="True" SortExpression="ItemID" Visible="False" />
        <asp:BoundField DataField="EjecucionPronosticoID" 
            HeaderText="EjecucionPronosticoID" SortExpression="EjecucionPronosticoID" 
            Visible="False" />
        <asp:BoundField DataField="BaseConocimientoID" HeaderText="BaseConocimientoID" 
            SortExpression="BaseConocimientoID" Visible="False" />
        <asp:TemplateField HeaderText="Informacion de Ejecucion de Pronosticos" 
            SortExpression="ReglasCumplidas">
            <ItemTemplate>
            <div class="pnlcampog">Fecha de Ejecucion</div>
                <div class="pnlcampovalorg">
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("FechaEjecucion") %>'></asp:Label>
                </div>
                <div class="pnlcampog">Fecha inicial de Pronostico</div>
                <div class="pnlcampovalorg">
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("FechaHoraInicialLectura") %>'></asp:Label>
                </div>
                <div class="pnlcampog">Fecha final de Pronostico</div>
                <div class="pnlcampovalorg">
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("FechaHoraFinalLectura") %>'></asp:Label>
                </div>
                <div class="pnlcampog">Territorio</div>
                <div class="pnlcampovalorg">
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Territorio") %>'></asp:Label>
                </div>
                <div class="pnlcampog">Cultivo</div>
                <div class="pnlcampovalorg">
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cultivo") %>'></asp:Label>
                </div>
                <div class="pnlcampog">Plaga & Enfermedad</div>
                <div class="pnlcampovalorg">
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Plaga") %>'></asp:Label>
                </div>
                <div class="pnlcampog">Estados Fenologicos Afectados</div>
                <div class="pnlcampovalorg">
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("EstadoFenologico") %>'></asp:Label>
                </div>
                <div class="pnlcampog">Meses comunes de ataque</div>
                <div class="pnlcampovalorg">
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("MesesAtaque") %>'></asp:Label>
                </div>
                <div class="pnlcampog">Reglas Cumplidas</div>
                <div class="pnlcampovalorg">
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("ReglasCumplidas") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Reglas y Lecturas">
            <ItemTemplate>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    EmptyDataText="NO SE ENCONTRARON PRONOSTICIOS CLIMATICOS">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table style="width:100%;">
                                    <tr>
                                        <td colspan="3">
                                            <div class="style1"> <asp:Label ID="LabelTituloCC" runat="server" Text='<%# Bind("tituloCC") %>'></asp:Label></div></td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                            Valor</td>
                                        <td class="style1">
                                            Regla</td>
                                        <td class="style1">
                                            Lecturas</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;Minimo</td>
                                        <td>
                                            <asp:TextBox ID="ValorMinimoR" Text=<%#Eval("ValorMinimoR")%> 
                                                style="text-align:right;" runat="server" Width="40px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ValorMinimoH" Text=<%#Eval("ValorMinimoH")%> 
                                                style="text-align:right;" Width="100px" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;Maximo</td>
                                        <td>
                                            <asp:TextBox ID="ValorMaximoR" Text=<%#Eval("ValorMaximoR")%> 
                                                style="text-align:right;" Width="40px"  runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ValorMaximoH" Text=<%#Eval("ValorMaximoH")%> 
                                                style="text-align:right;" Width="100px"  runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;Medio</td>
                                        <td>
                                            <asp:TextBox ID="ValorMedioAcumuladoR" Text=<%#Eval("ValorMedioAcumuladoR")%> 
                                                style="text-align:right;" Width="40px"  runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ValorMedioAcumuladoH" Text=<%#Eval("ValorMedioAcumuladoH")%> 
                                                style="text-align:right;" Width="100px"  runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Periodo Acumulado</td>
                                        <td>
                                            <asp:TextBox ID="PerioTiempoAcumuladoR" Text=<%#Eval("PerioTiempoAcumuladoR")%> 
                                                style="text-align:right;" Width="40px"  runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="PerioTiempoAcumuladoH" Text=<%#Eval("PerioTiempoAcumuladoH")%> 
                                                style="text-align:right;" Width="100px"  runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1" colspan="3">
                                            <asp:Label ID="lblresultadoregla" runat="server" ForeColor="#990000" 
                                                Text='<%# Bind("ReglasCumplida") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderTemplate>
                                
                            </HeaderTemplate>
                        </asp:TemplateField>                          
                        
                    </Columns>
                </asp:GridView>
            </ItemTemplate>
            <HeaderTemplate>
            
               
            </HeaderTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Analisis Especialistas">
            <ItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td>
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                                onrowcommand="GridView3_RowCommand" 
                                onrowdatabound="GridView3_RowDataBound" DataKeyNames="ItemID,Analisis">
                                <Columns>
                                    <asp:BoundField DataField="ItemID" Visible="False" />
                                    <asp:TemplateField ShowHeader="False">                                        
                                        <ItemTemplate>
                                            <asp:ImageButton ID="BtnEditar" runat="server" CausesValidation="False" 
                                                CommandName="Editar" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" UseSubmitBehavior="False"  ImageUrl="~/App_Themes/REC/REC_imagenes/Edit.png" 
                                                Text="Editar" />
                                            &nbsp;<asp:ImageButton ID="BtnEliminar" runat="server" CausesValidation="False" 
                                                CommandName="Eliminar" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" UseSubmitBehavior="False" ImageUrl="~/App_Themes/REC/REC_imagenes/Delete.png" 
                                                Text="Eliminar" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UserID" Visible="False" />
                                    <asp:TemplateField>                                        
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("usuario") %>' 
                                                ToolTip='<%# Bind("usertooltip") %>' Font-Bold="True" ForeColor="#003366"></asp:Label>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Analisis") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Button ID="Button1" runat="server"  
                                Text="Registrar Analisis" CommandName="Registrar" 
                                UseSubmitBehavior="False" 
                                CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" 
                                style="text-align: center"  />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Alerta SMS" SortExpression="PreAlertaSMS">
            
            <ItemTemplate>
                <textarea ID="TxtAlerta" cols="20" name="S1" runat="server" rows="2" 
                value='<%# Bind("PreAlertaSMS") %>' style="margin: 2px;height: 205px;" > </textarea><br />
                <asp:Label ID="lblprealertaerror" runat="server" ForeColor="#990000" 
                    Visible="False"></asp:Label>
                <br />
&nbsp;&nbsp;<asp:Button ID="BtnEnviarAlerta" runat="server"  
                                Text="Enviar Alerta" CommandName="EnviarAlerta" 
                                UseSubmitBehavior="False" 
                                CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" 
                                style="text-align: center" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="TerritorioID" HeaderText="TerritorioID" 
            SortExpression="TerritorioID" Visible="False" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SPATSConnectionString %>" 
    SelectCommand="SELECT ep.FechaEjecucion,li.FechaHoraInicialLectura, lf.FechaHoraFinalLectura,
pd.[ItemID], [EjecucionPronosticoID], [BaseConocimientoID], [ReglasCumplidas], [PreAlertaSMS], 
t.DocumentName as Territorio, pd.[TerritorioID],
c.[NombreComun] as [Cultivo],
p.NombreComun as [Plaga],dbo.[Func_SPATS_BaseConocimientoEstadosFenologicos](bc.[ItemID]) as [EstadoFenologico],
dbo.Func_SPATS_MESES(bc.[MesesAtaque]) as MesesAtaque
FROM 
dbo.customtable_SPATS_Ejecucion_Pronostico ep
inner join [customtable_SPATS_Ejecucion_Pronostico_Detalle]  pd
on pd.[EjecucionPronosticoID] = ep.ItemID
Left outer join dbo.customtable_Base_Conocimiento  bc
	on bc.ItemID=pd.[BaseConocimientoID]
Left outer join dbo.customtable_SPATS_Cultivo c
	on bc.CultivoID = c.ItemID
Left outer join dbo.customtable_SPATS_Plaga  p
	on p.ItemID = bc.PlagaID
Left outer join CMS_Document t
	on t.DocumentID = pd.[TerritorioID]
left outer join dbo.customtable_Base_Conocimiento_Lecturas li
	on li.ItemID = ep.BaseHechoIdInicial
left outer join dbo.customtable_Base_Conocimiento_Lecturas lf
	on lf.ItemID = ep.BaseHechoIdFinal

WHERE (ep.ItemID = @EjecucionPronosticoID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="EjecucionPronosticoID" 
            QueryStringField="ItemID" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Panel ID="fondo" runat="server">
</asp:Panel>
<asp:Panel ID="PnlAnalisis" runat="server" Visible="False">
<div class="TituloFiltro">Registre su analisis o comentario</div>
<textarea id="TxtAnalisis" cols="20" runat="server" rows="2" class="TxtAnalisis"></textarea>
<div class="PnlBtng">

    <asp:Button ID="Button2" runat="server" Text="Registrar" 
        onclick="Button2_Click" CssClass="BtnFiltro" />
        <asp:Button ID="Button3" runat="server" Text="Cancelar" 
         CssClass="BtnFiltro" onclick="Button3_Click" />
</div>        
</asp:Panel>
