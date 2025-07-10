<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListadoMedico.aspx.cs" Inherits="Vistas.ListadoMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Listado de Médicos</h1>
    </div>
    <div style="text-align: left; margin-bottom: 10px;">
        <label>Nombre: </label>
        <asp:TextBox runat="server" ID="txtNombre" />

        <label style="margin-left: 10px;">Especialidad: </label>
        <asp:DropDownList ID="ddlEspecialidad" runat="server" AppendDataBoundItems="true">
            <asp:ListItem Text="-- Todas --" Value="" />
        </asp:DropDownList>

        <label style="margin-left: 10px;">Sexo: </label>
        <asp:DropDownList ID="ddlSexo" runat="server">
            <asp:ListItem Text="-- Todos --" Value="" />
            <asp:ListItem Text="Masculino" Value="Masculino" />
            <asp:ListItem Text="Femenino" Value="Femenino" />
        </asp:DropDownList>

        <label style="margin-left: 10px;">Provincia: </label>
        <asp:DropDownList ID="ddlProvincia" runat="server" AppendDataBoundItems="true">
            <asp:ListItem Text="-- Todas --" Value="" />
        </asp:DropDownList>

        <asp:Button ID="btnBuscar" runat="server" Text="Filtrar" OnClick="btnBuscar_Click" />
    </div>
    <div>
    <asp:GridView ID="gvMedicos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" CellPadding="4" ForeColor="#333333" GridLines="None"
        OnRowCommand="gvMedicos_RowCommand"
        AllowPaging="true" PageSize="10" OnPageIndexChanging="gvMedicos_PageIndexChanging">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Legajo">
                <ItemTemplate>
                    <%# Eval("Legajo") %>
                    <asp:Label ID="lblLegajo" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DNI">
                <ItemTemplate>
                    <%# Eval("DNI") %>
                    <asp:Label ID="lblDNI" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">
                <ItemTemplate>
                    <%# Eval("Nombre") %>
                    <asp:Label ID="lblNombre" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Apellido">
                <ItemTemplate>
                    <%# Eval("Apellido") %>
                    <asp:Label ID="lblApellido" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Especialidad">
                <ItemTemplate>
                    <%# Eval("Especialidad") %>
                    <asp:Label ID="lblEspecialidad" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha de Nacimiento">
                <ItemTemplate>
                    <%# Eval("FechaNacimiento", "{0:dd/MM/yyyy}") %>
                    <asp:Label ID="lblFechaNacimiento" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sexo">
                <ItemTemplate>
                    <%# Eval("Sexo") %>
                    <asp:Label ID="lblSexo" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" CommandName="ModificarMedico" CommandArgument='<%# Eval("Legajo") %>' />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="EliminarMedico" CommandArgument='<%# Eval("Legajo") %>'
                        OnClientClick="return confirm('¿Está seguro de que desea eliminar este médico?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    </div>
    <div>
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />
    </div>
</asp:Content>
