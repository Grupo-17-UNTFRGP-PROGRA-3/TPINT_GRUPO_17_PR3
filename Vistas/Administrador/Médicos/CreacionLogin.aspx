<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CreacionLogin.aspx.cs" Inherits="Vistas.Administrador.Médicos.CreacionLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!--creación de login-->
    <div>
        <h1>Creacion de Login</h1>
    </div>

    <!--Legajo-->
    <asp:Panel ID="pnlLegajoUsuarioMedico" runat="server">
        <div  class="form-group">
            <asp:Label ID="lblLegajo" runat="server" Text="Legajo Medico" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtLegajo" runat="server" Width="145px" CssClass="form-input" OnTextChanged="txtLegajo_TextChanged" AutoPostBack="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo" Display="Dynamic" ErrorMessage="Debe ingresar un numero de legajo" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revLegajo" runat="server" ControlToValidate="txtLegajo" Display="Dynamic" ErrorMessage="Legajo inválido (4 digitos requeridos)" ForeColor="Red" ValidationExpression="^\d{4}$"></asp:RegularExpressionValidator>
            
            <asp:Label ID="lblNombreMedico" runat="server"></asp:Label>
            <br />   
        </div>
        <asp:Button ID="BtnBuscarLegajo" runat="server" CausesValidation="true" CssClass="form-button" OnClick="BtnBuscarLegajo_Click" Text="Buscar medico" />
        <asp:Button ID="BtnVolver2" runat="server" CausesValidation="false" CssClass="form-button" OnClick="btnVolver_Click" Text="Volver" />
    </asp:Panel>

    <!--Usuario y Contraseña-->
    <asp:Panel ID="pnlUsuarioMedico" runat="server" Visible="false">
        <div  class="form-group">
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtUsuario" runat="server" Width="145px" CssClass="form-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" Display="Dynamic" ErrorMessage="Debe ingresar un nombre de usuario" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revUsuario" runat="server" ControlToValidate="txtUsuario" Display="Dynamic" ErrorMessage="Usuario inválido (mínimo 5 caracteres alfanuméricos requeridos)" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9]{5}$"></asp:RegularExpressionValidator>
            <br />
        </div>
        <div class="form-group">    
            <asp:Label ID="lblPass1" runat="server" Text="Contraseña" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtPass1" runat="server" CssClass="form-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPass1" runat="server" ControlToValidate="txtPass1" Display="Dynamic" ErrorMessage="Debe ingresar una contraseña" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPass1" runat="server" ControlToValidate="txtPass1" Display="Dynamic" ErrorMessage="Contraseña invalida (mínimo 4 caracteres alfanuméricos requeridos)" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9]{4}$"></asp:RegularExpressionValidator>
            <br />
        </div>
        <div class="form-group">    
            <asp:Label ID="lblPass2" runat="server" Text="Repetir contraseña" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtPass2" runat="server" CssClass="form-input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPass2" runat="server" ControlToValidate="txtPass2" Display="Dynamic" ErrorMessage="Debe reingresar la contraseña" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvPass2" runat="server" ControlToCompare="txtPass1" ControlToValidate="txtPass2" ErrorMessage="La contraseña no es la misma" ForeColor="Red"></asp:CompareValidator>
            <br />
        </div>
        <div class="form-group">     
            <div>
            <asp:Button ID="btnCrear" runat="server" CssClass="form-button" Text="Crear" />
            <asp:Button ID="btnLimpiar" runat="server" CssClass="form-button" CausesValidation="false" Text="Limpiar campos" OnClick="btnLimpiar_Click" />
                <asp:Button ID="btnVolver" runat="server" CausesValidation="false" CssClass="form-button" OnClick="btnVolver_Click" Text="Volver" />
            <br />
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>

            </div>
        </div>
    </asp:Panel>
    
    </asp:Content>

