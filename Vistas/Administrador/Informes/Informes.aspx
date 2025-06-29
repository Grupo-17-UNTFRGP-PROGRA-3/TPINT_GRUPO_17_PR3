<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="Vistas.Administrador.Informes.Informes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Informes</h1>
    <div >
        <asp:Label CssClass="form-label" ID="lblRangoFechas" runat="server" Text="Rango de fechas"></asp:Label>
        <br />
        <asp:Label CssClass="form-label" ID="lblFechaInicio" runat="server" Text="Fecha inicial"></asp:Label>
        <asp:TextBox  CssClass="form-input" ID="txtFechaInicial" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <br />
        <asp:Label CssClass="form-label" ID="lblFechaFin" runat="server" Text="Fecha final"></asp:Label>
        <asp:TextBox CssClass="form-input" ID="txtFechaFinal" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <br />
        <asp:Button CssClass="linkbutton" ID="btnPacXMed" runat="server" Text="Pacientes / Medico" />
        <br />
        <br />
        <asp:Button CssClass="linkbutton" ID="btnPacXEsp" runat="server" OnClick="Button2_Click" Text="Pacientes / Especialidad" />
        <br />
        <br />
        <asp:Button CssClass="linkbutton" ID="btnHorasPico" runat="server" Text="Horas Pico" />
        <br />
        <br />
        <asp:Button CssClass="linkbutton" ID="btnPorcentajeAusencias" runat="server" Text="Porcentaje de ausencias" />
    </div>


</asp:Content>
