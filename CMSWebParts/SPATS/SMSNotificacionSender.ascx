<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SMSNotificacionSender.ascx.cs" Inherits="CMSWebParts_SPATS_SMSNotificacionSender" %>


<style type="text/css">
    .style2
    {
        height: 23px;
        text-align: center;
    }
</style>
<asp:Panel ID="PnlNuevo" runat="server" CssClass="SMSSenderpnlnuevo">
<div class="PnlNuevo">
    <div class="TituloFiltro">Generar Notificacion por Territorio</div>
    <div class="pnlcamposfiltro">
        <div class="pnlcampo">Territorio</div>
        <div class="pnlcampovalor"><asp:DropDownList ID="ddlTerritorio" runat="server" AutoPostBack="True" 
                    Enabled="False" Width="160px">
                </asp:DropDownList></div>
        <div class="pnlcampo derecha">Fecha y hora para envio</div>
        <div class="pnlcampovalor derecha"><asp:TextBox CssClass="txtcalendario" ID="TxtProgramado" runat="server"></asp:TextBox></div>
        <div class="pnlcampo">Mensaje</div>
        <div class="pnlcampovalor"><asp:TextBox  CssClass="TxtSMSMensaje" ID="TxtMensaje" runat="server"></asp:TextBox></div>

    </div>
    <div class="PnlBtn">
     <asp:Button ID="BtnEnviar" CssClass="BtnFiltro" runat="server" onclick="BtnEnviar_Click" Text="Enviar" />
     <asp:Button ID="BtnCancelar" runat="server" onclick="BtnCancelar_Click" Text="Cancelar" />   
     <asp:Label ID="LblNotificaciones" runat="server" Text="[lblNotificaciones]" Visible="False"></asp:Label>
    </div>
</div>    
</asp:Panel>
<asp:Panel ID="PnlGrid" runat="server" CssClass="SMSSenderpnlnuevo">
<div class="PnlFiltro">
    <div class="TituloFiltro">Busqueda</div>
    <div class="pnlcamposfiltro">
        <div class="pnlcampo">Filtro</div>
        <div class="pnlcampovalor"><asp:TextBox CssClass="txtfiltro" ID="TextBox1" runat="server" ></asp:TextBox></div>
        <div class="pnlcampo">Desde</div>
        <div class="pnlcampovalor"><asp:TextBox CssClass="txtcalendario" ID="TextBox2" runat="server" ></asp:TextBox></div>
        <div class="pnlcampo derecha">Hasta</div>
        <div class="pnlcampovalor derecha"><asp:TextBox CssClass="txtcalendario" ID="TextBox3" runat="server"></asp:TextBox></div>
    </div>
    <div class="PnlBtn">
        <asp:Button ID="BtnNuevo" CssClass="BtnFiltro" runat="server" onclick="BtnNuevo_Click" Text="Nuevo" />
        <asp:Button ID="BtnBuscar" CssClass="BtnFiltro" runat="server" Text="Buscar" />
    </div>
</div>
    
    <br />
    <asp:GridView ID="GrdNotificaciones" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ItemID" ForeColor="#333333" GridLines="None" PageSize="50" 
        Width="100%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ItemID" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="True" 
                SortExpression="Usuario" />
            <asp:BoundField DataField="mensaje" HeaderText="Mensaje" 
                SortExpression="mensaje" />
            <asp:BoundField DataField="Estado" HeaderText="Estado de Envio" ReadOnly="True" 
                SortExpression="Estado" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" 
                Visible="False" />
            <asp:BoundField DataField="Celldestino" HeaderText="Numero de Envio" 
                SortExpression="Celldestino" />
            <asp:BoundField DataField="FechaHoraparaEnviar" HeaderText="Programado" 
                SortExpression="FechaHoraparaEnviar" />
            <asp:BoundField DataField="FechaHoraEnvio" HeaderText="Enviado" 
                SortExpression="FechaHoraEnvio" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>

</asp:Panel>