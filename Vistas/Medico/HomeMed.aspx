﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="HomeMed.aspx.cs" Inherits="Vistas.Medico.HomeMed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1>MENU MEDICOS</h1>
    <div class="form-group">
        <asp:LinkButton ID="lkbPerfil" runat="server" CssClass="linkbutton" PostBackUrl="~/Medico/PerfilMed.aspx">Perfil</asp:LinkButton>
        <br />
        <asp:LinkButton ID="lkbListaTurnos" runat="server" CssClass="linkbutton" PostBackUrl="~/Administrador/Turnos/ListaTurnos.aspx">Listado de Turnos</asp:LinkButton>
    </div>
</asp:Content>
