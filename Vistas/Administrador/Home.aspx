<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vistas.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>MENU ADMINISTRADOR</h1>
    </div>
    <div class="form-group">
        <asp:LinkButton ID="lkbPaciente" runat="server" CssClass="linkbutton" OnClick="lkbPaciente_Click">Paciente</asp:LinkButton>
        <div id="menuPaciente" class="form-group">
            <asp:LinkButton ID="lkbMP_AltaPaciente" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_AltaPaciente_Click">Alta pacientes</asp:LinkButton>
            <asp:LinkButton ID="lkbMP_ListadoPaciente" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_ListadoPaciente_Click">Gestion pacientes</asp:LinkButton>
        </div>
        
        <asp:LinkButton ID="lkbMedico" runat="server" CssClass="linkbutton" OnClick="lkbMedico_Click">Medico</asp:LinkButton>
        <div id="menuMedico" class="form-group">
            <asp:LinkButton ID="lkbMP_AltaMedicos" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_AltaMedicos_Click">Alta medicos</asp:LinkButton>
            <asp:LinkButton ID="lkbMP_ListadoMedicos" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_ListadoMedicos_Click">Gestion medicos</asp:LinkButton>
        </div>

        <asp:LinkButton ID="lkbTurnos" runat="server" CssClass="linkbutton" OnClick="lkbTurnos_Click">Turnos</asp:LinkButton>
        <div id="menuTurnos" class="form-group">
            <asp:LinkButton ID="lkbMP_AltaTurnos" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_AltaTurnos_Click">Alta Turnos</asp:LinkButton>
            <asp:LinkButton ID="lkbMP_ListadoTurnos" runat="server" CssClass="linkbutton-submenu" Visible="False" OnClick="lkbMP_ListadoTurnos_Click">Gestion Turnos</asp:LinkButton>
        </div>

        <asp:LinkButton ID="lkbListaUsuarios" runat="server" CssClass="linkbutton" PostBackUrl="~/Administrador/Usuarios/ListadoUsuarios.aspx">Usuarios</asp:LinkButton>
        <div>
            <br />
        </div>
        <asp:LinkButton ID="lkbInformes" runat="server" CssClass="linkbutton" PostBackUrl="~/Administrador/Informes/Informes.aspx">Informes</asp:LinkButton>
    </div>
</asp:Content>
