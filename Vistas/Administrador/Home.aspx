<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vistas.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>MENU ADMINISTRADOR</h1>
    <div class="form-group">

        <asp:LinkButton ID ="lkbPaciente" runat="server" CssClass="linkbutton" OnClick="lkbPaciente_Click">Paciente</asp:LinkButton>
        <div ID="menuPaciente" class="form-group">
            <asp:LinkButton ID="lkbMP_AltaPaciente" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_AltaPaciente_Click">Alta pacientes</asp:LinkButton>
            <asp:LinkButton ID="lkbMP_ListadoPaciente" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_ListadoPaciente_Click">Gestion pacientes</asp:LinkButton>
        </div>
        <asp:LinkButton ID="lkbMedico" runat="server" CssClass="linkbutton" OnClick="lkbMedico_Click">Medico</asp:LinkButton>
        <div ID="menuMedico" class="form-group">
            <asp:LinkButton ID="lkbMP_AltaMedicos" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_AltaMedicos_Click">Alta medicos</asp:LinkButton>
            <asp:LinkButton ID="lkbMP_ListadoMedicos" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_ListadoMedicos_Click">Gestion medicos</asp:LinkButton>
        </div>
        <asp:LinkButton ID="lkbListaUsuarios" runat="server" CssClass="linkbutton" PostBackUrl="~/Administrador/Usuarios/ListadoUsuarios.aspx">Usuarios</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="lkbTurnos" runat="server" CssClass="linkbutton" PostBackUrl="~/Administrador/Turnos/AltaTurnos.aspx">Asignacion de turnos</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="lkbInformes" runat="server" CssClass="linkbutton" PostBackUrl="~/Administrador/Informes/Informes.aspx">Informes</asp:LinkButton>


    </div>
</asp:Content>
