<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListaTurnos.aspx.cs" Inherits="Vistas.Administrador.ListaTurnos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h1>Listado de Turnos</h1>
    </div>

    <div style="text-align: left; margin-bottom: 10px;">
        <div>
            <label class="form-label">Código: </label>
            <asp:TextBox ID="txtCodigo" TextMode="Number" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <label class="form-label">Médico: </label>
        <asp:TextBox runat="server" ID="txtMedico" CssClass="form-input"/>

        <label class="form-label">Paciente: </label>
        <asp:TextBox runat="server" ID="txtPaciente" CssClass="form-input"/>

        <label class="form-label">Especialidad: </label>
        <asp:DropDownList ID="ddlEspecialidad" runat="server" AppendDataBoundItems="true" CssClass="form-input">
            <asp:ListItem Text="-- Todas --" Value="" />
        </asp:DropDownList>

        <label class="form-label">Estado:: </label>
        <asp:DropDownList ID="ddlEstado" runat="server" AppendDataBoundItems="true" CssClass="form-input">
            <asp:ListItem Text="-- Todos --" Value="" />
            <asp:ListItem Text="Confirmado" Value="Confirmado" />
            <asp:ListItem Text="Pendiente" Value="Pendiente" />
            <asp:ListItem Text="Ausente" Value="Ausente" />
            <asp:ListItem Text="Cancelado" Value="Cancelado" />
        </asp:DropDownList>

        <asp:Label ID="lblFechaDesde" runat="server" Text="Desde: " CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtFechaDesde" runat="server" TextMode="Date" CssClass="form-input"></asp:TextBox>
        
        <asp:Label ID="lblFechaHasta" runat="server" Text="Hasta: " CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtFechaHasta" runat="server" TextMode="Date" CssClass="form-input"></asp:TextBox>

        <asp:Button ID="btnBuscar" runat="server" Text="Filtrar" OnClick="btnBuscar_Click" />
        <asp:Button ID="btnRestablecer" runat="server" Text="Eliminar filtro" OnClick="btnEliminarFiltro_Click" />
    </div>

    <div>
        <asp:Label ID="lblSinResultados" runat="server" Text="No se hallaron resultados." Visible="false"></asp:Label>

        <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="gvTurnos_PageIndexChanging" OnRowCommand="gvTurnos_RowCommand">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>

                <asp:TemplateField HeaderText="Codigo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Fecha") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFecha" runat="server" Text='<%# Eval("Fecha", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hora">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Hora") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblHora" runat="server" Text='<%# Eval("Hora") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Especialidad">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Especialidad") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEspecialidad" runat="server" Text='<%# Eval("Especialidad") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Médico">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Medico") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblMedico" runat="server" Text='<%# Eval("Medico") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Paciente">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Paciente") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPaciente" runat="server" Text='<%# Eval("Paciente") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Estado") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="btnVer" runat="server" CausesValidation="false" CommandArgument='<%# Eval("id") %>' CommandName="VerTurno" Text="Ver" />
                        <asp:Button ID="btnEliminar" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="EliminarTurno" Text="Eliminar" OnClientClick="return confirm('¿Está seguro de que desea eliminar este turno?');" />
                    </ItemTemplate>
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
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar Turno" OnClick="btnAgregar_Click1" />
        <asp:Button ID="btnVolver" runat="server" Text="Volver" PostBackUrl="~/Administrador/Home.aspx" />
    </div>

</asp:Content>
