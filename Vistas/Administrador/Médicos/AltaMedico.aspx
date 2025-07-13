<%@ Page Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AltaMedico.aspx.cs" Inherits="Vistas.AltaMedico" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />

    <!--ingreso de datos medico-->
    <div>

        <!--Titulo de pagina-->
        <div>
            <h1>
                <asp:Label ID="lblTitulo" runat="server" Text="Alta de Medico"></asp:Label>
            </h1>
        </div>

        <!--DNI-->
        <asp:Panel ID="pnlDNI" runat="server">
            <div class="form-group">
                <asp:Label ID="lblDNI" runat="server" Text="D.N.I." CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtDNI" runat="server" CssClass="form-input" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" Display="Dynamic" ErrorMessage="Debe ingresar un DNI" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" Display="Dynamic" ErrorMessage="DNI inválido (8 dígitos)" ForeColor="Red" ValidationExpression="^\d{8}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                <asp:Button ID="btnModificarDNI" runat="server" Text="Modificar DNI" Visible="false" Enabled="false"  CausesValidation="false" OnClick="btnModificarDNI_Click"/>
                <asp:Button ID="btnAceptarDNI" runat="server" CausesValidation="false"  Enabled="false" OnClick="btnAceptarDNI_Click" Text="Aceptar" Visible="false" />
                <asp:Button ID="btnCancelarDNI" runat="server" CausesValidation="false"  Enabled="false" OnClick="btnCancelarDNI_Click" Text="Cancelar" Visible="false" />
                <asp:Button ID="btnConfirmarRestaurar" runat="server" CausesValidation="false"  Enabled="false" OnClick="btnConfirmarRestaurar_Click" Text="Restaurar" Visible="false" />
                <asp:Button ID="btnCancelarRestaurar" runat="server" CausesValidation="false"  Enabled="false" OnClick="btnCancelarRestaurar_Click" Text="Cancelar" Visible="false" />
            </div>

            <asp:Button ID="BtnBuscarDNI" runat="server" Text="Buscar DNI"  CausesValidation="true" OnClick="BtnBuscarDNI_Click" />
            <asp:Button ID="BtnVolver2" runat="server" Text="Volver"  CausesValidation="false" OnClick="btnVolver_Click" />
            <br />
            <br />
            <asp:Label ID="lblInicio" runat="server" ForeColor="Red"></asp:Label>
        </asp:Panel>


        <asp:Panel ID="pnlDatosMedico" runat="server" Visible="false">

            <!--nombre-->
            <div class="form-group">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Debe ingresar un nombre" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
            </div>

            <!--apellido-->
            <div class="form-group">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" Display="Dynamic" ErrorMessage="Debe ingresar un apellido" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
            </div>

            <!--sexo-->
            <div class="form-group">
                <asp:Label ID="lblSexo" runat="server" Text="Sexo" CssClass="form-label"></asp:Label>
                <asp:RadioButtonList ID="rblSexo" runat="server" CssClass="form-input">
                    <asp:ListItem Value="masculino">Masculino</asp:ListItem>
                    <asp:ListItem Value="femenino">Femenino</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="rblSexo" Display="Dynamic" ErrorMessage="Debe seleccionar un sexo" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="ddlNacionalidad" Display="Dynamic" ErrorMessage="Debe seleccionar una nacionalidad" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
            </div>

            <!--nacimiento-->
            <div class="form-group">
                <asp:Label ID="lblNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="form-label"></asp:Label>
                <asp:TextBox TextMode="Date" ID="txtFechaNacimiento" runat="server" CssClass="form-input" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" Display="Dynamic" ErrorMessage="Seleccione una fecha" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator id="regExV"  ControlToValidate="txtFechaNacimiento" ValidationExpression="\d{4}[-]\d{2}[-]\d{2}"  
                    Display="Dynamic" ForeColor="Red"
                    ErrorMessage="Fecha inválida" runat="server" ValidationGroup="g1"/>
            </div>


            <!--direccion-->
            <div>
                <div class="form-group">
                     <asp:Label ID="lblDirecion" runat="server" Text="Dirección" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCalle" runat="server" ControlToValidate="txtDireccion" Display="Dynamic" ErrorMessage="Debe ingresar una direccion" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>

            <asp:UpdatePanel ID="updatePanelProvinciaLocalidad" runat="server">
                <ContentTemplate>
                    <!--provincia-->
                    <div class="form-group">
                        <asp:Label ID="lblProvincia" runat="server" Text="Provincia" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="true" CssClass="form-input" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" ErrorMessage="Seleccione una provincia" ForeColor="Red" Display="Dynamic" ValidationGroup="g1" />
                    </div>
                    <!--localidad-->
                    <div class="form-group">
                        <asp:Label ID="lblLocalidad" runat="server" Text="Localidad" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="form-input">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" ErrorMessage="Seleccione una localidad" ForeColor="Red" Display="Dynamic" ValidationGroup="g1" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>



            <!--correo electronico-->
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Correo Electrónico" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Debe ingresar un correo electronico" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Correo electronico invalido" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="g1"></asp:RegularExpressionValidator>
            </div>

            <!--telefono-->
            <div class="form-group">
                <asp:Label ID="lblTelefono" runat="server" Text="Teléfono" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" Display="Dynamic" ErrorMessage="Debe ingresar un telefono" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" Display="Dynamic" ErrorMessage="Telefono invalido" ForeColor="Red" ValidationExpression="^\d{6,15}$" ValidationGroup="g1"></asp:RegularExpressionValidator>
            </div>
            <!--Especialidad-->
            <div class="form-group">
                <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-input">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" Display="Dynamic" ErrorMessage="Seleccione una especialidad" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
            </div>

            <!--horarios de atencion-->
            <div class="form-group">
                <asp:Label ID="lblHorarios" runat="server" Text="Días de atención" CssClass="form-label"></asp:Label>
                <asp:CheckBoxList ID="cblDiasAtencion" runat="server" RepeatDirection="Horizontal" ControlToValidate="cblDiasAtencion">
                    <asp:ListItem Value="1">Lunes</asp:ListItem>
                    <asp:ListItem Value="2">Martes</asp:ListItem>
                    <asp:ListItem Value="3">Miercoles</asp:ListItem>
                    <asp:ListItem Value="4">Jueves</asp:ListItem>
                    <asp:ListItem Value="5">Viernes</asp:ListItem>
                    <asp:ListItem Value="6">Sábado</asp:ListItem>
                </asp:CheckBoxList>
                <asp:Label ID="lblErrorDiasSeleccionados" runat="server" ForeColor="Red"></asp:Label>
                <div class="form-group">
                    <asp:Label ID="lblRangoHorario" runat="server" Text="Rango de horarios" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblHorarioDesde" runat="server" Text="Desde: " CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlHoraInicio" runat="server" CssClass="form-input" AutoPostBack="true" OnSelectedIndexChanged="ddlHoraInicio_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvHoraInicio" runat="server" ControlToValidate="ddlHoraInicio" ErrorMessage="Debe ingresar una hora de inicio" ForeColor="Red" InitialValue="0" Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblHorarioHasta" runat="server" Text="Hasta: " CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlHoraFin" runat="server" CssClass="form-input">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvHoraFin" runat="server" ControlToValidate="ddlHoraFin" ErrorMessage="Debe ingresar una hora de fin" ForeColor="Red" InitialValue="0" Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>

            </div>

            <!--botones-->
            <div>
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar medico" CausesValidation="true"  OnClick="btnIngresar_Click" ValidationGroup="g1" />
                <asp:Button ID="btnLimpiarCampos" runat="server" Text="Limpiar campos"  CausesValidation="false" OnClick="btnLimpiarCampos_Click" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver"  CausesValidation="false" OnClick="btnVolver_Click" />
                <br />
                <br />
            </div>
        </asp:Panel>

        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </div>
</asp:Content>
