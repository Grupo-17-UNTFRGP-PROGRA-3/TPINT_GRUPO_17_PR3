<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AltaPaciente.aspx.cs" Inherits="Vistas.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--ingreso de datos paciente-->
    <div>

        <!--Titulo de pagina-->
        <div>
            <h1>
                <asp:Label ID="lblTitulo" runat="server" Text="Alta de Paciente"></asp:Label>
            </h1>
        </div>

        <!--dni-->
        <asp:Panel ID="pnlDNI" runat="server">
            <div class="form-group">
                <asp:Label ID="lblDNI" runat="server" Text="D.N.I." CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtDNI" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Debe ingresar un DNI" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ValidationExpression="^\d{8}$" ErrorMessage="DNI inválido (8 dígitos)" ForeColor="Red" Display="Dynamic" />
                <asp:Button ID="btnModificarDNI" runat="server" Text="Modificar DNI" Visible = "false" Enabled = "false"  CausesValidation="false" OnClick="btnModificarDNI_Click"/>
                <asp:Button ID="btnAceptarDNI" runat="server" Text="Aceptar" Visible = "false" Enabled = "false"  CausesValidation="false" OnClick="btnAceptarDNI_Click"/>
                <asp:Button ID="btnCancelarDNI" runat="server" Text="Cancelar" Visible = "false" Enabled = "false"  CausesValidation="false" OnClick="btnCancelarDNI_Click"/>
                <asp:Button ID="btnConfirmarRestaurar" runat="server" Text="Restaurar" Visible = "false" Enabled = "false"  CausesValidation="false" OnClick="btnConfirmarRestaurar_Click"/>
                <asp:Button ID="btnCancelarRestaurar" runat="server" Text="Cancelar" Visible = "false" Enabled = "false"  CausesValidation="false" OnClick="btnCancelarRestaurar_Click"/>
    
            </div>

                 <asp:Button ID="BtnBuscarDni" runat="server" Text="Buscar paciente"  CausesValidation="true" OnClick="BtnBuscarDni_Click"/>
                 <asp:Button ID="BtnVolver2" runat="server" Text="Volver"  CausesValidation="false" OnClick="btnVolver_Click"/>
            <br />
            <asp:Label ID="lblInicio" runat="server" ForeColor="Red"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlDatosPaciente" runat="server" Visible="false">
        
        <!--nombre-->
        <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtApellido" ErrorMessage="Debe ingresar un nombre" ForeColor="Red" Display="Dynamic" />

            <!--apellido-->
            <div class="form-group">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Debe ingresar un apellido" ForeColor="Red" Display="Dynamic" />
            </div>

            <!--sexo-->
            <div class="form-group">
                <asp:Label ID="lblSexo" runat="server" Text="Sexo" CssClass="form-label"></asp:Label>
                <asp:RadioButtonList ID="rblSexo" runat="server" CssClass="form-input">
                    <asp:ListItem Value="masculino">Masculino</asp:ListItem>
                    <asp:ListItem Value="femenino">Femenino</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="rblSexo" InitialValue="" ErrorMessage="Debe seleccionar un sexo" ForeColor="Red" Display="Dynamic" />
            </div>

            <!--nacionalidad-->
            <div class="form-group">
                <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlNacionalidad" runat="server" CssClass="form-input">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="ddlNacionalidad" ErrorMessage="Seleccione una nacionalidad" ForeColor="Red" Display="Dynamic" />
            </div>


            <!--nacimiento-->
            <div class="form-group">
                <asp:Label ID="lblNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="form-label"></asp:Label>
                <asp:TextBox TextMode="Date" ID="txtFechaNacimiento" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" Display="Dynamic" ErrorMessage="Seleccione una fecha" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regExV" ControlToValidate="txtFechaNacimiento" ValidationExpression="\d{4}[-]\d{2}[-]\d{2}"
                    Display="Dynamic" ForeColor="Red"
                    ErrorMessage="Fecha inválida" runat="server" />
            </div>

            <!--direccion-->
            <div>
                <div class="form-group">
                    <asp:Label ID="lblDireccion" runat="server" Text="Direccion" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCalle" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Debe ingresar una Direccion" ForeColor="Red" Display="Dynamic" />
                    </div>

            </div>

            <!--provincia-->
            <div class="form-group">
                <asp:Label ID="lblProvincia" runat="server" Text="Provincia" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="true" CssClass="form-input" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" ErrorMessage="Seleccione una provincia" ForeColor="Red" Display="Dynamic" />
            </div>

            <!--localidad-->
            <div class="form-group">
                <asp:Label ID="lblLocalidad" runat="server" Text="Localidad" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="form-input">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" ErrorMessage="Seleccione una localidad" ForeColor="Red" Display="Dynamic" />
            </div>

            <!--correo electronico-->
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Correo Electronico" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese un correo electrónico" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Correo electronico inválido" ForeColor="Red" Display="Dynamic" />
            </div>

            <!--telefono-->
            <div class="form-group">
                <asp:Label ID="lblTelefono" runat="server" Text="Telefono" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-input"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese un teléfono" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ValidationExpression="^\d{6,15}$" ErrorMessage="Teléfono inválido" ForeColor="Red" Display="Dynamic" />
            </div>

            <!--botones-->
            <div>
                <asp:Button ID="btnIngresar" runat="server" Text="Aceptar"  CausesValidation="true" OnClick="btnIngresar_Click" />
                <asp:Button ID="btnLimpiarCampos" runat="server" Text="Limpiar campos"  CausesValidation="false" OnClick="btnLimpiarCampos_Click" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver"  CausesValidation="false" OnClick="btnVolver_Click" />
                <br />
                <br />
            </div>
        </div>
            </asp:Panel>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </div>

</asp:Content>
