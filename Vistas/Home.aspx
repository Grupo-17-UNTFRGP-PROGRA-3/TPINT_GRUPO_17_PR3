﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vistas.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>MENU ADMINISTRADOR</h1>
    <div class="form-group">


        <asp:LinkButton ID ="lkbPaciente" runat="server" CssClass="linkbutton" OnClick="lkbPaciente_Click">Paciente</asp:LinkButton>
        <div ID="menuPaciente" class="form-group">
            <asp:LinkButton ID="lkbMP_AltaPaciente" runat="server" CssClass="linkbutton-submenu" Visible="False">Alta pacientes</asp:LinkButton>
            <asp:LinkButton ID="lkbMP_ListadoPaciente" runat="server" CssClass="linkbutton-submenu" Visible="False">Gestion pacientes</asp:LinkButton>
        </div>
        <asp:LinkButton ID="lkbMedico" runat="server" CssClass="linkbutton" OnClick="lkbMedico_Click">Medico</asp:LinkButton>
        <div ID="menuMedico" class="form-group">
            <asp:LinkButton ID="lkbMP_AltaMedicos" runat="server" CssClass="linkbutton-submenu" Visible="False">Alta medicos</asp:LinkButton>
            <asp:LinkButton ID="lkbMP_ListadoMedicos" runat="server" CssClass="linkbutton-submenu" Visible="False">Gestion medicos</asp:LinkButton>
        </div>
        <asp:LinkButton ID="lkbLoginMedico" runat="server" CssClass="linkbutton">Creacion Login Medico</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="lkbTurnos" runat="server" CssClass="linkbutton">Asignacion de turnos</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="lkbInformes" runat="server" CssClass="linkbutton">Informes</asp:LinkButton>


    </div>
</asp:Content>
