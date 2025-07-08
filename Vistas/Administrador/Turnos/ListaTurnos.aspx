<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListaTurnos.aspx.cs" Inherits="Vistas.Administrador.ListaTurnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div>
        <h1>Listado de Turnos</h1>
    </div>

    <div style="text-align: left;">
        <asp:Label ID="lblBuscar" runat="server" Text="Buscar turnos:" CssClass="form-label"></asp:Label>
         <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-input"></asp:TextBox>
         <asp:Button ID="btnBuscar" runat="server" Text="Filtrar" CssClass="form-button" OnClick="btnBuscar_Click" />
    </div>

    <div>
        <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="gvTurnos_PageIndexChanging1">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Hora" HeaderText="Hora" />
                <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
                <asp:BoundField DataField="Medico" HeaderText="Médico" />
                <asp:BoundField DataField="Paciente" HeaderText="Paciente" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnVer" runat="server" Text="Ver" />
                        <asp:Button ID="btnAsistencia" runat="server" Text="Asistencia" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>

    <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>

    <div>
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar Turno" CssClass="form-button" OnClick="btnAgregar_Click1"/>
    </div>

</asp:Content>
