<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Turno.aspx.cs" Inherits="Vistas.Medico.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <div>
        <h1>Detalles del Turno</h1>
    </div>
    <!-- Especialidad -->
    <div class="form-group">
        <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-input" Enabled="false">
            <asp:ListItem Text="Cardiología" Value="" />
        </asp:DropDownList>
    </div>
    <!-- Médico -->
    <div class="form-group">
        <asp:Label ID="lblMedico" runat="server" Text="Médico" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="ddlMedico" runat="server" CssClass="form-input" Enabled="false">
            <asp:ListItem Text="Juan Pérez" Value="" />
        </asp:DropDownList>
    </div>

    <!-- Día -->
    <div class="form-group">
        <asp:Label ID="lblDia" runat="server" Text="Día del Turno" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="ddlDia" runat="server" CssClass="form-input" Enabled="false">
            <asp:ListItem Text="Viernes" Value="" />
        </asp:DropDownList>
    </div>

    <!-- Horario -->
    <div class="form-group">
        <asp:Label ID="lblHorario" runat="server" Text="Horario" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="ddlHorario" runat="server" CssClass="form-input" Enabled="false">
            <asp:ListItem Text="10:00" Value="" />
        </asp:DropDownList>
    </div>

    <!-- Paciente -->
    <div class="form-group">
        <asp:Label ID="lblPaciente" runat="server" Text="Paciente" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="ddlPaciente" runat="server" CssClass="form-input" Enabled="false">
            <asp:ListItem Text="María López" Value="" />
        </asp:DropDownList>
    </div>
    <!-- Fecha -->
    <div class="form-group">
        <asp:Label ID="lblFecha" runat="server" Text="Fecha" CssClass="form-label"></asp:Label>
        <asp:Label ID="lblFechaTurno" runat="server" Text="13/06/2025"></asp:Label>
    </div>
    <!-- Estado -->
    <div class="form-group">
        <asp:Label ID="lblEstado" runat="server" Text="Estado" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-input">
            <asp:ListItem Text="Pendiente" Value="" />
            <asp:ListItem Text="Presente" Value="" />
            <asp:ListItem Text="Ausente" Value="" />
        </asp:DropDownList>
    </div>
    <!-- Observaciones -->
    <div class="form-group">
        <asp:Label ID="lblObservaciones" runat="server" Text="Observaciones" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="txtObservaciones" runat="server" CssClass="form-input" TextMode="MultiLine"></asp:TextBox>
    </div>

    <!-- Botones -->
    <div>
        <asp:Button ID="btnAsignarTurno" runat="server" Text="Guardar Turno"  />
        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Campos"  />
        <asp:Button ID="btnVolver" runat="server" Text="Volver"  />
    </div>
</div>
</asp:Content>
