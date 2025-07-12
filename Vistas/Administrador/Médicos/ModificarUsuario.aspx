<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ModificarUsuario.aspx.cs" Inherits="Vistas.Administrador.Médicos.CreacionLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--creación de login-->
    <div>
        <h1>Gestión de Usuarios</h1>
    </div>



    <!--Usuario y Contraseña-->
    
        <div class="form-group">
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtUsuario" runat="server" Width="145px" CssClass="form-input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" Display="Dynamic" ErrorMessage="Debe ingresar un nombre de usuario" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revUsuario" runat="server" ControlToValidate="txtUsuario" Display="Dynamic" ErrorMessage="Usuario inválido (mínimo 5 caracteres alfanuméricos requeridos)" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9]{5,}$"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="LabelUsuario" runat="server"></asp:Label>
            <br />
            <asp:Button ID="BtnBuscarUsuario" runat="server" OnClick="BtnBuscarUsuario_Click" Text="Chequear disponibilidad" />
            <br />
        </div>
       <asp:Panel ID="pnlUsuarioMedico" runat="server">
        <div class="form-group">
            <asp:Label ID="lblPass1" runat="server" Text="Contraseña" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtPass1" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPass1" runat="server" ControlToValidate="txtPass1" Display="Dynamic" ErrorMessage="Debe ingresar una contraseña" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPass1" runat="server" ControlToValidate="txtPass1" Display="Dynamic" ErrorMessage="Contraseña invalida (mínimo 4 caracteres alfanuméricos requeridos)" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9]{4,}$"></asp:RegularExpressionValidator>
            <br />
        </div>
        <div class="form-group">
            <asp:Label ID="lblPass2" runat="server" Text="Repetir contraseña" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtPass2" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPass2" runat="server" ControlToValidate="txtPass2" Display="Dynamic" ErrorMessage="Debe reingresar la contraseña" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvPass2" runat="server" ControlToCompare="txtPass1" ControlToValidate="txtPass2" ErrorMessage="La contraseña no es la misma" ForeColor="Red"></asp:CompareValidator>
            <br />
        </div>
        <div class="form-group">
            <div>
                <asp:Button ID="btnModificar" runat="server"  Text="Modificar" OnClick="btnModificar_Click" />
                <asp:Button ID="btnVolver" runat="server" CausesValidation="false"  OnClick="btnVolver_Click" Text="Volver" />
                <br />
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>

            </div>
        </div>
    </asp:Panel>

</asp:Content>

