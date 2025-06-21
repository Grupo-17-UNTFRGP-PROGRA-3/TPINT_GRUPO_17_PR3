<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AltaPaciente.aspx.cs" Inherits="Vistas.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ValidationSummary ID="vsErrores" runat="server" HeaderText="Errores encontrados:" ForeColor="Red" />

    <!--ingreso de datos paciente-->
    <div>

        <!--Titulo de pagina-->
        <div>
            <h1>Alta de Paciente</h1>
        </div>

        <!--dni-->
        <asp:Panel ID="pnlDNI" runat="server">
            <div class="form-group">
                <asp:Label ID="lblDNI" runat="server" Text="D.N.I." CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtDNI" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Debe ingresar un DNI" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ValidationExpression="^\d{7,8}$" ErrorMessage="DNI inválido (7-8 dígitos)" ForeColor="Red" Display="Dynamic" />
                </div>

                 <asp:Button ID="BtnBuscarDni" runat="server" Text="Buscar paciente" CssClass="form-button" CausesValidation="true" OnClick="BtnBuscarDni_Click"/>
                 <asp:Button ID="BtnVolver2" runat="server" Text="Volver" CssClass="form-button" CausesValidation="false" OnClick="btnVolver_Click"/>
            <br />
            <asp:Label ID="lblInicio" runat="server"></asp:Label>
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
                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="ddlNacionalidad" InitialValue="Seleccione nacionalidad" ErrorMessage="Seleccione una nacionalidad" ForeColor="Red" Display="Dynamic" />
            </div>


            <!--nacimiento-->
            <div class="form-group">
                <asp:Label ID="lblNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="form-label"></asp:Label>

                <!--año-->
                <asp:Label ID="lblAnio" runat="server" Text="Año" CssClass="fecha-label"></asp:Label>
                <asp:TextBox ID="txtAnio" runat="server" CssClass="fecha-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAnio" runat="server" ControlToValidate="txtAnio" ErrorMessage="El año es obligatorio" ForeColor="Red" CssClass="text-danger" Display="Dynamic" />
                <asp:RangeValidator ID="rvAnio" runat="server" ControlToValidate="txtAnio" MinimumValue="1900" MaximumValue="2100" Type="Integer" ErrorMessage="Año inválido" ForeColor="Red" CssClass="text-danger" Display="Dynamic" />

                <!--mes-->
                <asp:Label ID="lblMes" runat="server" Text="Mes" CssClass="fecha-label"></asp:Label>
                <asp:TextBox ID="txtMes" runat="server" CssClass="fecha-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMes" runat="server" ControlToValidate="txtMes" ErrorMessage="El mes es obligatorio" ForeColor="Red" CssClass="text-danger" Display="Dynamic" />
                <asp:RangeValidator ID="rvMes" runat="server" ControlToValidate="txtMes" MinimumValue="1" MaximumValue="12" Type="Integer" ErrorMessage="Mes inválido" ForeColor="Red" CssClass="text-danger" Display="Dynamic" />

                <!--dia-->
                <asp:Label ID="lblDia" runat="server" Text="Día" CssClass="fecha-label"></asp:Label>
                <asp:TextBox ID="txtDia" runat="server" CssClass="fecha-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDia" runat="server" ControlToValidate="txtDia" ErrorMessage="El día es obligatorio" ForeColor="Red" CssClass="text-danger" Display="Dynamic" />
                <asp:RangeValidator ID="rvDia" runat="server" ControlToValidate="txtDia" MinimumValue="1" MaximumValue="31" Type="Integer" ErrorMessage="Día inválido" ForeColor="Red" CssClass="text-danger" Display="Dynamic" />
            </div>

            <!--direccion-->
            <div>
                <div class="form-group">
                    <asp:Label ID="lblCalle" runat="server" Text="Calle" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtCalle" runat="server" CssClass="form-input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCalle" runat="server" ControlToValidate="txtCalle" ErrorMessage="Debe ingresar una calle" ForeColor="Red" Display="Dynamic" />
                    <asp:Label ID="lblAltura" runat="server" Text="Altura" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtAltura" runat="server" CssClass="form-input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAltura" runat="server" ControlToValidate="txtAltura" ErrorMessage="Debe ingresar una altura" ForeColor="Red" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revAltura" runat="server" ControlToValidate="txtAltura" ValidationExpression="^\d+$" ErrorMessage="Altura inválida: solo digitos" ForeColor="Red" Display="Dynamic" />
                </div>
            </div>

            <!--provincia-->
            <div class="form-group">
                <asp:Label ID="lblProvincia" runat="server" Text="Provincia" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="true" CssClass="form-input" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" InitialValue="Seleccione provincia" ErrorMessage="Seleccione una provincia" ForeColor="Red" Display="Dynamic" />
            </div>

            <!--localidad-->
            <div class="form-group">
                <asp:Label ID="lblLocalidad" runat="server" Text="Localidad" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="form-input">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" InitialValue="Seleccione localidad" ErrorMessage="Seleccione una localidad" ForeColor="Red" Display="Dynamic" />
            </div>

            <!--correo electronico-->
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Correo Electronico" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese un correo electrónico" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ErrorMessage="Correo electronico inválido" ForeColor="Red" Display="Dynamic" />
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
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar paciente" CssClass="form-button" CausesValidation="true" OnClick="btnIngresar_Click" />
                <asp:Button ID="btnLimpiarCampos" runat="server" Text="Limpiar campos" CssClass="form-button" CausesValidation="false" OnClick="btnLimpiarCampos_Click" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="form-button" CausesValidation="false" OnClick="btnVolver_Click" />
                <br />
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                <br />
            </div>
        </div>
            </asp:Panel>
    </div>

</asp:Content>
