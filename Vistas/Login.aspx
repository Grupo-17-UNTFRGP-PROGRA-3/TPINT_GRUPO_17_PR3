<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="estilos.css" />
</head> 
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Iniciar Sesión</h2>
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" CssClass="login-label" />
            <asp:TextBox ID="txtUsuario" runat="server" CssClass="login-input" />
            <asp:Label ID="lblClave" runat="server" Text="Contraseña:" CssClass="login-label" />
            <asp:TextBox ID="txtClave" runat="server" TextMode="Password" CssClass="login-input" />
            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="login-button" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMensaje" runat="server" CssClass="mensajeError" />
        </div>
    </form>
</body>
</html>
