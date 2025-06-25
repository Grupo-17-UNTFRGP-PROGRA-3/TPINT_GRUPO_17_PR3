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

        <!--Legajo-->
        <asp:Panel ID="pnlLegajo" runat="server">
            <div class="form-group">
                <asp:Label ID="lblLegajo" runat="server" Text="Legajo" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtLegajo" runat="server" CssClass="form-input" OnTextChanged="txtLegajo_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo" Display="Dynamic" ErrorMessage="Debe ingresar un numero de legajo" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revLegajo" runat="server" ControlToValidate="txtLegajo" Display="Dynamic" ErrorMessage="Legajo invalido (4 digitos requeridos)" ForeColor="Red" ValidationExpression="^\d{4}$"></asp:RegularExpressionValidator>
            </div>

            <asp:Button ID="BtnBuscarLegajo" runat="server" Text="Buscar medico" CssClass="form-button" CausesValidation="true" OnClick="BtnBuscarLegajo_Click" />
            <asp:Button ID="BtnVolver2" runat="server" Text="Volver" CssClass="form-button" CausesValidation="false" OnClick="btnVolver_Click" />
            <br />
            <asp:Label ID="lblInicio" runat="server"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlDatosMedico" runat="server" Visible="false">
            <!--dni-->
            <div class="form-group">
                <asp:Label ID="lblDNI" runat="server" Text="D.N.I." CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtDNI" runat="server" CssClass="form-input" AutoPostBack="True" OnTextChanged="txtDNI_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" Display="Dynamic" ErrorMessage="Debe ingresar un DNI" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" Display="Dynamic" ErrorMessage="DNI inválido (7-8 dígitos)" ForeColor="Red" ValidationExpression="^\d{7,8}$"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="lblDNIMedico" runat="server"></asp:Label>
            </div>
            <!--nombre-->
            <div class="form-group">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Debe ingresar un nombre" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <!--apellido-->
            <div class="form-group">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" Display="Dynamic" ErrorMessage="Debe ingresar un apellido" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <!--sexo-->
            <div class="form-group">
                <asp:Label ID="lblSexo" runat="server" Text="Sexo" CssClass="form-label"></asp:Label>
                <asp:RadioButtonList ID="rblSexo" runat="server" CssClass="form-input">
                    <asp:ListItem Value="masculino">Masculino</asp:ListItem>
                    <asp:ListItem Value="femenino">Femenino</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="rblSexo" Display="Dynamic" ErrorMessage="Debe seleccionar un sexo" ForeColor="Red"></asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="ddlNacionalidad" Display="Dynamic" ErrorMessage="Debe seleccionar una nacionalidad" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <!--nacimiento-->
            <div class="form-group">
                <asp:Label ID="lblNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="form-label"></asp:Label>
                <asp:TextBox TextMode="Date" ID="txtFechaNacimiento" runat="server" CssClass="form-input" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" Display="Dynamic" ErrorMessage="Seleccione una fecha" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator id="regExV"  ControlToValidate="txtFechaNacimiento" ValidationExpression="\d{4}[-]\d{2}[-]\d{2}"  
                    Display="Dynamic" ForeColor="Red"
                    ErrorMessage="Fecha inválida" runat="server"/>
                <%--<!--año-->
                <asp:Label ID="lblAnio" runat="server" Text="Año"></asp:Label>
                <asp:TextBox ID="txtAnio" runat="server" CssClass="form-input"></asp:TextBox>

                <!--mes-->
                <asp:RequiredFieldValidator ID="rfvAnio" runat="server" ControlToValidate="txtAnio" Display="Dynamic" ErrorMessage="El año es obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvAnio" runat="server" ControlToValidate="txtAnio" Display="Dynamic" ErrorMessage="Año invalido" ForeColor="Red" MaximumValue="2100" MinimumValue="1900" Type="Integer"></asp:RangeValidator>
                <asp:Label ID="lblMes" runat="server" Text="Mes"></asp:Label>
                <asp:TextBox ID="txtMes" runat="server" CssClass="form-input"></asp:TextBox>

                <!--dia-->
                <asp:RequiredFieldValidator ID="rfvMes" runat="server" ControlToValidate="txtMes" Display="Dynamic" ErrorMessage="El mes es obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvMes" runat="server" ControlToValidate="txtMes" Display="Dynamic" ErrorMessage="Mes invalido" ForeColor="Red" MaximumValue="12" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                <asp:Label ID="lblDia" runat="server" Text="Dia"></asp:Label>
                <asp:TextBox ID="txtDia" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDia" runat="server" ControlToValidate="txtDia" Display="Dynamic" ErrorMessage="El dia es obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvDia" runat="server" ControlToValidate="txtDia" Display="Dynamic" ErrorMessage="El dia es invalido" ForeColor="Red" MaximumValue="31" MinimumValue="1" Type="Integer"></asp:RangeValidator>--%>
            </div>


            <!--direccion-->
            <div>
                <div class="form-group">
                    Direccion<asp:TextBox ID="txtDireccion" runat="server" CssClass="form-input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCalle" runat="server" ControlToValidate="txtDireccion" Display="Dynamic" ErrorMessage="Debe ingresar una direccion" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <asp:UpdatePanel ID="updatePanelProvinciaLocalidad" runat="server">
                <ContentTemplate>
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
                </ContentTemplate>
            </asp:UpdatePanel>



            <!--correo electronico-->
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Correo Electronico" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Debe ingresar un correo electronico" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Correo electronico invalido" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
            </div>

            <!--telefono-->
            <div class="form-group">
                <asp:Label ID="lblTelefono" runat="server" Text="Telefono" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" Display="Dynamic" ErrorMessage="Debe ingresar un telefono" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" Display="Dynamic" ErrorMessage="Telefono invalido" ForeColor="Red" ValidationExpression="^\d{6,15}$"></asp:RegularExpressionValidator>
            </div>
            <!--Especialidad-->
            <div class="form-group">
                <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-input">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" Display="Dynamic" ErrorMessage="Seleccione una especialidad" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <!--horarios de atencion-->
            <div class="form-group">
                <asp:Label ID="lblHorarios" runat="server" Text="Dias de atencion" CssClass="form-label"></asp:Label>
                <asp:CheckBoxList ID="cblDiasAtencion" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">Lunes</asp:ListItem>
                    <asp:ListItem Value="2">Martes</asp:ListItem>
                    <asp:ListItem Value="3">Miercoles</asp:ListItem>
                    <asp:ListItem Value="4">Jueves</asp:ListItem>
                    <asp:ListItem Value="5">Viernes</asp:ListItem>
                    <asp:ListItem Value="6">Sábado</asp:ListItem>
                </asp:CheckBoxList>

                <div class="form-group">
                    <asp:Label ID="lblRangoHorario" runat="server" Text="Rango de horarios" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlHoraInicio" runat="server" CssClass="form-input">
                        <asp:ListItem Selected="True">--Seleccione hora--</asp:ListItem>
                        <asp:ListItem Value="07:00:00">07:00</asp:ListItem>
                        <asp:ListItem Value="08:00:00">08:00</asp:ListItem>
                        <asp:ListItem Value="09:00:00">09:00</asp:ListItem>
                        <asp:ListItem Value="10:00:00">10:00</asp:ListItem>
                        <asp:ListItem Value="11:00:00">11:00</asp:ListItem>
                        <asp:ListItem Value="12:00:00">12:00</asp:ListItem>
                        <asp:ListItem Value="13:00:00">13:00</asp:ListItem>
                        <asp:ListItem Value="14:00:00">14:00</asp:ListItem>
                        <asp:ListItem Value="15:00:00">15:00</asp:ListItem>
                        <asp:ListItem Value="16:00:00">16:00</asp:ListItem>
                        <asp:ListItem Value="17:00:00">17:00</asp:ListItem>
                        <asp:ListItem Value="18:00:00">18:00</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlHoraFin" runat="server" CssClass="form-input">
                        <asp:ListItem Selected="True">--Seleccione hora--</asp:ListItem>
                        <asp:ListItem Value="8:00:00">8:00</asp:ListItem>
                        <asp:ListItem Value="9:00:00">9:00</asp:ListItem>
                        <asp:ListItem Value="10:00:00">10:00</asp:ListItem>
                        <asp:ListItem Value="11:00:00">11:00</asp:ListItem>
                        <asp:ListItem Value="12:00:00">12:00</asp:ListItem>
                        <asp:ListItem Value="13:00:00">13:00</asp:ListItem>
                        <asp:ListItem Value="14:00:00">14:00</asp:ListItem>
                        <asp:ListItem Value="15:00:00">15:00</asp:ListItem>
                        <asp:ListItem Value="16:00:00">16:00</asp:ListItem>
                        <asp:ListItem Value="17:00:00">17:00</asp:ListItem>
                        <asp:ListItem Value="18:00:00">18:00</asp:ListItem>
                        <asp:ListItem Value="19:00:00">19:00</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </div>

            <!--botones-->
            <div>
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar medico" CausesValidation="true" CssClass="form-button" OnClick="btnIngresar_Click" />
                <asp:Button ID="btnLimpiarCampos" runat="server" Text="Limpiar campos" CssClass="form-button" CausesValidation="false" OnClick="btnLimpiarCampos_Click" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="form-button" CausesValidation="false" OnClick="btnVolver_Click" />
                <br />
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <br />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
