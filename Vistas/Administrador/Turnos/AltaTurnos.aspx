<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AltaTurnos.aspx.cs" Inherits="Vistas.Administrador.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h1>Asignacion de Turnos</h1>
        </div>
        <asp:Panel ID="pnlDNI" runat="server">
            <div >
                <asp:Label ID="lblDNI" runat="server" Text="DNI Paciente" ></asp:Label>
                <asp:TextBox ID="txtDNI" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Debe ingresar un DNI" ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ValidationExpression="^\d{8}$" ErrorMessage="DNI inválido (8 dígitos)" ForeColor="Red" Display="Dynamic" />
                <asp:Button ID="BtnBuscarDni" runat="server" Text="Buscar paciente"  OnClick="BtnBuscarDni_Click" />
            </div>
            <asp:Label ID="lblInicio" runat="server" ForeColor="Red"></asp:Label>
            <asp:Button ID="btnAgregarPaciente" runat="server"  OnClick="btnAgregarPaciente_Click" Text="Agregar Paciente" />
        </asp:Panel>

        <asp:Panel ID="pnlDatosPaciente" runat="server" >
            <div>
                <asp:Label ID="lblDatosPaciente" runat="server" Text="Datos"></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblNombrePaciente" runat="server" Text="Nombre: "></asp:Label>
                <asp:Label ID="lblNombrePacienteDato" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblApellidoPaciente" runat="server" Text="Apellido: "></asp:Label>
                <asp:Label ID="lblApellidoPacienteDato" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblDNIPaciente" runat="server" Text="DNI: "></asp:Label>
                <asp:Label ID="lblDNIPacienteDato" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblTelefonoPaciente" runat="server" Text="Teléfono"></asp:Label>
                <asp:Label ID="lblTelefonoPacienteDato" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblCorreoPaciente" runat="server" Text="Correo Electrónico: "></asp:Label>
                <asp:Label ID="lblCorreoPacienteDato" runat="server"></asp:Label>
                <br />
            </div>
        </div>
        </asp:Panel>

        <asp:Panel ID="pnlDatosMedico" runat="server">
            <!-- Especialidad -->
            <div class="form-group">
                <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-input" AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <!-- Médico -->
            <div class="form-group">
                <asp:Label ID="lblMedico" runat="server" Text="Médico" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlMedico" runat="server" CssClass="form-input" AutoPostBack="true" OnSelectedIndexChanged="ddlMedico_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <!-- Día -->
            <div class="form-group">
                <asp:Label ID="lblDia" runat="server" Text="Día" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlDia" runat="server" CssClass="form-input" OnSelectedIndexChanged="ddlDia_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <!-- Fecha -->
            <div class="form-group">
                <asp:Label ID="lblFecha" runat="server" Text="Fecha" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtFechaTurno" runat="server" TextMode="Date" CssClass="form-input" AutoPostBack="True" OnTextChanged="txtFechaTurno_TextChanged" Wrap="False"></asp:TextBox>
                <asp:Label ID="lblValidacionFecha" runat="server"></asp:Label>
            </div>

            <!-- Horario -->
            <div class="form-group">
                <asp:Label ID="lblHorario" runat="server" Text="Horario" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlHorario" runat="server" CssClass="form-input" AutoPostBack="true">
                </asp:DropDownList>
            </div>

            <!-- Paciente -->
        </asp:Panel>

    <!-- Botones -->
    <div>
        <asp:Button ID="btnAsignarTurno" runat="server" Text="Asignar Turno"  OnClick="btnAsignarTurno_Click1" />
        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Campos" CausesValidation="false"  OnClick="btnLimpiar_Click" />
        <asp:Button ID="btnVolver" runat="server" Text="Volver"  CausesValidation="false" OnClick="btnVolver_Click" />
        <br />
    </div>
    <br />
    <div>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </div>
    
</asp:Content>
