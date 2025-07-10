<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListadoTurnos.aspx.cs" Inherits="Vistas.Medico.ListadoTurnos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Listado de Turnos</h1>
    </div>
    <div>
        <div class="form-group">
            <label>Paciente: </label>
            <asp:TextBox runat="server" ID="txtFiltroPaciente"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Fecha: </label>
            &nbsp;<asp:TextBox ID="txtFechaFiltro" runat="server" TextMode="Date"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
        <div class="form-group">
            <label>Estado: </label>
            <asp:DropDownList ID="ddlFiltroEstado" runat="server">
                <asp:ListItem Text="--Seleccione Estado--" Value=""></asp:ListItem>
                <asp:ListItem>Ausente</asp:ListItem>
                <asp:ListItem>Presente</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" Style="margin-bottom: 10px;" OnClick="btnFiltrar_Click" />
    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar campos" Style="margin-bottom: 10px;" OnClick="btnLimpiar_Click" />
        <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Fecha">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Fecha") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFecha" runat="server" Text='<%# Eval ("Fecha","{0:dd/MM/yyyy}") %>' DataFormatString="{0:dd/MM/yyyy}"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hora">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Hora") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblHora" runat="server" Text='<%# DateTime.Today.Add((TimeSpan)Eval("Hora")).ToString("HH:mm") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Paciente">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Paciente") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombreApellido" runat="server" Text='<%# Eval("Paciente") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DNI">
                    <ItemTemplate>
                        <asp:Label ID="lblDni" runat="server" Text='<%# Eval("Dni") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Estado") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnSeleccionar" runat="server" Text="Ver Detalles" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#5D7B9D" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    <div>
    </div>
</asp:Content>
