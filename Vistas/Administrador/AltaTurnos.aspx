<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AltaTurnos.aspx.cs" Inherits="Vistas.Administrador.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h1>Asignacion de Turnos</h1>
        </div>
        <!-- Fecha del turno -->
        <div class="form-group">
            <asp:Label ID="lblFecha" runat="server" Text="Fecha del Turno" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtFecha" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
        </div>

        <div class="form-group">
        </div>

        <!-- Médico -->
        <div class="form-group">
            <asp:Label ID="lblMedico" runat="server" Text="Médico" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlMedico" runat="server" CssClass="form-input">
                <asp:ListItem Text="Seleccione médico" Value="" />
            </asp:DropDownList>
        </div>

        <!-- Horario -->
        <div class="form-group">
            <asp:Label ID="lblHorario" runat="server" Text="Horario" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlHorario" runat="server" CssClass="form-input">
                <asp:ListItem Text="Seleccione horario" Value="" />
            </asp:DropDownList>
        </div>

        <!-- Paciente -->
        <div class="form-group">
            <asp:Label ID="lblPaciente" runat="server" Text="Paciente" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlPaciente" runat="server" CssClass="form-input">
                <asp:ListItem Text="Seleccione paciente" Value="" />
            </asp:DropDownList>
        </div>

        <!-- Botones -->
        <div>
            <asp:Button ID="btnAsignarTurno" runat="server" Text="Asignar Turno" CssClass="form-button" OnClick="btnAsignarTurno_Click1" />
            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Campos" CssClass="form-button" />
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="form-button" />
        </div>
    </div>
</asp:Content>
