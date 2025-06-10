<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Alta.aspx.cs" Inherits="Vistas.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--ingreso de datos paciente-->
    <div>
        <!--Titulo de pagina-->
        <div>
            <h1>Alta de Paciente</h1>
        </div>

        <!--nombre-->
        <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <!--apellido-->
        <div class="form-group">
            <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <!--dni-->
        <div class="form-group">
            <asp:Label ID="lblDNI" runat="server" Text="D.N.I." CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtDNI" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <!--sexo-->
        <div class="form-group">
            <asp:Label ID="lblSexo" runat="server" Text="Sexo" CssClass="form-label"></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-input">
                <asp:ListItem Value="masculino">Masculino</asp:ListItem>
                <asp:ListItem Value="femenino">Femenino</asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <!--nacionalidad-->
        <div class="form-group">
            <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlNacionalidad" runat="server" CssClass="form-input">
                <asp:ListItem Selected="True">Seleccione nacionalidad</asp:ListItem>
                <asp:ListItem>Nacionalidad1</asp:ListItem>
                <asp:ListItem>Nacionalidad2</asp:ListItem>
                <asp:ListItem>etc</asp:ListItem>
            </asp:DropDownList>
        </div>

        <!--nacimiento-->
        <div class="form-group">
            <asp:Label ID="lblNacimiento" runat="server" Text="Nacimiento" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtNacimiento" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <!--direccion-->
        <div>
            <div class="form-group">
                <asp:Label ID="lblCalle" runat="server" Text="Calle" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtCalle" runat="server" CssClass="form-input"></asp:TextBox>

                <asp:Label ID="lblAltura" runat="server" Text="Altura" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtAltura" runat="server" CssClass="form-input"></asp:TextBox>
            </div>
        </div>

        <!--provincia-->
        <div class="form-group">
            <asp:Label ID="lblProvincia" runat="server" Text="Provincia" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-input">
                <asp:ListItem Selected="True">Seleccione provincia</asp:ListItem>
                <asp:ListItem>Provincia1</asp:ListItem>
                <asp:ListItem>Provincia2</asp:ListItem>
                <asp:ListItem>etc</asp:ListItem>
            </asp:DropDownList>
        </div>

        <!--localidad-->
        <div class="form-group">
            <asp:Label ID="lblLocalidad" runat="server" Text="Localidad" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="form-input">
                <asp:ListItem Selected="True">Seleccione localidad</asp:ListItem>
                <asp:ListItem>Localidad1</asp:ListItem>
                <asp:ListItem>Localidad2</asp:ListItem>
                <asp:ListItem>etc</asp:ListItem>
            </asp:DropDownList>
        </div>

        <!--correo electronico-->
        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Correo Electronico" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <!--telefono-->
        <div class="form-group">
            <asp:Label ID="lblTelefono" runat="server" Text="Telefono" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-input"></asp:TextBox>
        </div>

        <!--botones-->
        <div>
            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar paciente" CssClass="form-button"/>
            <asp:Button ID="btnLimpiarCampos" runat="server" Text="Limpiar campos" CssClass="form-button"/>
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="form-button" OnClick="btnVolver_Click"/>
        </div>
    </div>

</asp:Content>
