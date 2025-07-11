<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AltaTurnos.aspx.cs" Inherits="Vistas.Administrador.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h1>Asignacion de Turnos</h1>
        </div>
          <asp:Panel ID="pnlDNI" runat="server">
      <div class="form-group">
          <asp:Label ID="lblDNI" runat="server" Text="DNI Paciente" CssClass="form-label"></asp:Label>
          <asp:TextBox ID="txtDNI" runat="server" CssClass="form-input" Height="21px" Width="162px"></asp:TextBox>
          <asp:TextBox ID="txtNombrePaciente" runat="server" CssClass="form-input"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Debe ingresar un DNI" ForeColor="Red" Display="Dynamic" />
          <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ValidationExpression="^\d{8}$" ErrorMessage="DNI inválido (8 dígitos)" ForeColor="Red" Display="Dynamic" />
          <asp:Button ID="BtnBuscarDni" runat="server" Text="Buscar paciente" CssClass="form-button" OnClick="BtnBuscarDni_Click" />
       </div>
      <asp:Label ID="lblInicio" runat="server" ForeColor="Red"></asp:Label>
              &nbsp;<asp:Button ID="btnAgregarPaciente" runat="server" CssClass="form-button" OnClick="btnAgregarPaciente_Click" Text="Agregar Paciente" />
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
            <asp:Button ID="btnAsignarTurno" runat="server" Text="Asignar Turno" CssClass="form-button" OnClick="btnAsignarTurno_Click1" />
            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Campos" CssClass="form-button" OnClick="btnLimpiar_Click" />
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="form-button" CausesValidation="false" OnClick="btnVolver_Click" />
            <br />
        </div>
        <br />
        <div>
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
