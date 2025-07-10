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
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" >
                <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Hora" HeaderText="Hora" >
                <ItemStyle HorizontalAlign="Left" Width="90px" />
                </asp:BoundField>
                <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" >
                <ItemStyle HorizontalAlign="Left" Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="Medico" HeaderText="Médico" >
                <ItemStyle HorizontalAlign="Left" Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="Paciente" HeaderText="Paciente" >
                <ItemStyle HorizontalAlign="Left" Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="Estado" HeaderText="Estado" >
                <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnVer" runat="server" Text="Ver" />
                        <asp:Button ID="btnAsistencia" runat="server" Text="Asistencia" />
                    </ItemTemplate>
               <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="White" BackColor="#5D7B9D" HorizontalAlign="Center" VerticalAlign="Middle" />
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
    <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="form-button" OnClick="btnAgregar_Click1" PostBackUrl="~/Administrador/Home.aspx"/>
    </div>

</asp:Content>
