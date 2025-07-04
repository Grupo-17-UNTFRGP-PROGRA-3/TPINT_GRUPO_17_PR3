<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListadoUsuarios.aspx.cs" Inherits="Vistas.Administrador.Usuarios.ListadoUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table-striped {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Listado de Usuarios</h1>
        <div>
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>

            <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" CssClass="table table-striped"
                CellPadding="4" ForeColor="#333333" GridLines="None"
                AllowPaging="True" OnPageIndexChanging="gvUsuarios_PageIndexChanging" Width="436px" OnRowCommand="gvUsuarios_RowCommand">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Nombre de Usuario">
                        <ItemTemplate>
                            <%# Eval("Usuario") %>
                            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUsuario" runat="server" Text='<%# Bind("Usuario") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <%# Eval("Password") %>
                            <asp:Label ID="lblPassword" runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Legajo">
                        <ItemTemplate>
                            <%# Eval("Legajo") %>
                            <asp:Label ID="lblLegajo" runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLegajo" runat="server" Text='<%# Bind("Legajo") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnModificarUsuario" runat="server" Text="Modificar" CommandName="ModificarUsuario" CommandArgument='<%# Eval("Legajo") %>' />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    <asp:Button ID="btnModificarUsuario" runat="server" Text="Modificar Usuario" />
                </EmptyDataTemplate>
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
            <div>
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="form-button" OnClick="btnVolver_Click"/>
            </div>
        </div>
    </div>
</asp:Content>