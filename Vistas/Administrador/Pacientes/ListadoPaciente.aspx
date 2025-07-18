﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListadoPaciente.aspx.cs" Inherits="Vistas.Pacientes.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Listado de Pacientes</h1>
    </div>
    <div style="text-align: left; margin-bottom: 10px;">
        <label>Nombre: </label>
        <asp:TextBox runat="server" ID="txtNombre" />

        <label>DNI: </label>
        <asp:TextBox runat="server" ID="txtDni"></asp:TextBox>

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
        <asp:Button ID="btnRestablecer" runat="server" Text="Eliminar filtro" OnClick="btnEliminarFiltro_Click" />
    </div>

    <div>
        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
        <asp:Label ID="lblSinResultados" runat="server" Text="No se hallaron resultados." Visible="false"></asp:Label>
        <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="False" CssClass="table table-striped"
            CellPadding="4" ForeColor="#333333" GridLines="None"
            OnRowCommand="gvPacientes_RowCommand"
            AllowPaging="True" OnPageIndexChanging="gvPacientes_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="D.N.I.">
                    <ItemTemplate>
                        <%# Eval("DNI") %>
                        <asp:Label ID="lblDNI" runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDNI" runat="server" Text='<%# Bind("DNI") %>' />
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate>
                        <%# Eval("Nombre") %>
                        <asp:Label ID="lblNombre" runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' />
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellido">
                    <ItemTemplate>
                        <%# Eval("Apellido") %>
                        <asp:Label ID="lblApellido" runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtApellido" runat="server" Text='<%# Bind("Apellido") %>' />
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sexo">
                    <ItemTemplate>
                        <%# Eval("Sexo") %>
                        <asp:Label ID="lblSexo" runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSexo" runat="server" Text='<%# Bind("Sexo") %>' />
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nacionalidad">
                    <ItemTemplate>
                        <%# Eval("Nacionalidad") %>
                        <asp:Label ID="lblNacionalidad" runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNacionalidad" runat="server" Text='<%# Bind("Nacionalidad") %>' />
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha de Nacimiento">
                    <ItemTemplate>
                        <%# Eval("FechaNacimiento", "{0:dd/MM/yyyy}") %>
                        <asp:Label ID="lblFDN" runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" Text='<%# Bind("FechaNacimiento", "{0:yyyy-MM-dd}") %>' />
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="180px" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnModificar" runat="server" Text="Modificar" CommandName="ModificarPaciente" CommandArgument='<%# Eval("DNI") %>' />
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="EliminarPaciente" CommandArgument='<%# Eval("DNI") %>'
                            OnClientClick="return confirm('¿Está seguro de que desea eliminar este paciente?');" />
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
        <br />
    </div>

    <div>
    </div>

    <div>
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />

        <br />
        <br />
    </div>
</asp:Content>
