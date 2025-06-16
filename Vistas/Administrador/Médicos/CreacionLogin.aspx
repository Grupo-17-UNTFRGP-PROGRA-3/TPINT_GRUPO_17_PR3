<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CreacionLogin.aspx.cs" Inherits="Vistas.Administrador.Médicos.CreacionLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <h1>Creacion de Login</h1>
</div>
<div  class="form-group">
    
&nbsp;<asp:Label ID="lblLegajo" runat="server" Text="Legajo Medico" CssClass="form-label"></asp:Label>
    <asp:TextBox ID="txtLegajo" runat="server" Width="145px" CssClass="form-input"></asp:TextBox>
    <asp:Label ID="lblNombreMedico" runat="server" Text="-- Nombre Medico --"></asp:Label>
    <br />
    <asp:Label ID="lblUsuario" runat="server" Text="Usuario" CssClass="form-label"></asp:Label>
    <asp:TextBox ID="txtUsuario" runat="server" Width="145px" CssClass="form-input"></asp:TextBox>
    <br />
    <asp:Label ID="lblPass1" runat="server" Text="Contraseña" CssClass="form-label"></asp:Label>
    <asp:TextBox ID="txtPass1" runat="server" CssClass="form-input"></asp:TextBox>
    <br />
    <asp:Label ID="lblPass2" runat="server" Text="Repetir contraseña" CssClass="form-label"></asp:Label>
    <asp:TextBox ID="txtPass2" runat="server" CssClass="form-input"></asp:TextBox>
    
    <br />
    <div>
    <asp:Button ID="btnCrear" runat="server" CssClass="form-button" Text="Crear" />
    <asp:Button ID="btnLimpiar" runat="server" CssClass="form-button" Text="Limpiar campos" />
    <br />
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>

    </div>
    
</div>
</asp:Content>
