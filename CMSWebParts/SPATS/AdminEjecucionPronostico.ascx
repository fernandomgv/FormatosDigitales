<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminEjecucionPronostico.ascx.cs" Inherits="CMSWebParts_SPATS_AdminEjecucionPronostico" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ItemID" 
    DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound">
    <Columns>
        <asp:TemplateField HeaderText="Accion">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl='<%# Eval("ItemId", "../Details.aspx?ItemId={0}") %>'>Ver detalles</asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" 
            ReadOnly="True" SortExpression="ItemID" />
        <asp:BoundField DataField="TerritorioID" HeaderText="TerritorioID" 
            SortExpression="TerritorioID" Visible="False" />
        <asp:BoundField DataField="FechaEjecucion" HeaderText="FechaEjecucion" 
            SortExpression="FechaEjecucion" />
        <asp:BoundField DataField="IdEstado" HeaderText="IdEstado" 
            SortExpression="IdEstado" />
        <asp:BoundField DataField="Observacion" HeaderText="Observacion" 
            SortExpression="Observacion" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SPATSConnectionString %>" 
    onselecting="SqlDataSource1_Selecting" 
    ProviderName="<%$ ConnectionStrings:SPATSConnectionString.ProviderName %>" 
    SelectCommand="SELECT * FROM [customtable_SPATS_Ejecucion_Pronostico] WHERE ([TerritorioID] = @TerritorioID) ORDER BY [ItemID] DESC,[FechaEjecucion] DESC">
    <SelectParameters>
        <asp:Parameter Name="TerritorioID" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
