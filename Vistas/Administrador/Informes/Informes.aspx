<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="Vistas.Administrador.Informes.Informes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content style="align-items:baseline" ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Informes</h1>
    <div >
        <asp:Label CssClass="form-label" ID="lblRangoFechas" runat="server" Text="Rango de fechas"></asp:Label>
        <br />
        <asp:Label CssClass="form-label" ID="lblFechaInicio" runat="server" Text="Fecha inicial"></asp:Label>
        <asp:TextBox  CssClass="form-input" ID="txtFechaInicial" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFechaInicial" runat="server" ControlToValidate="txtFechaInicial" Display="Dynamic" ErrorMessage="No hay fechas seleccionadas" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label CssClass="form-label" ID="lblFechaFin" runat="server" Text="Fecha final"></asp:Label>
        <asp:TextBox CssClass="form-input" ID="txtFechaFinal" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFechaFinal" runat="server" ControlToValidate="txtFechaFinal" Display="Dynamic" ErrorMessage="No hay fechas seleccionadas" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button CssClass="linkbutton" ID="btnPacXMed" runat="server" Text="Pacientes / Medico" OnClick="btnPacXMed_Click" />
        <br />
        <br/>
        <asp:Button CssClass="linkbutton" ID="btnPacXEsp" runat="server"  Text="Pacientes / Especialidad" OnClick="btnPacXEsp_Click" />
        <br />
        <br/>
        <asp:Button CssClass="linkbutton" ID="btnHorasPico" runat="server" Text="Horas Pico" OnClick="btnHorasPico_Click" />
        <br />
        <br />
        <asp:Label ID="lblInforme" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium"></asp:Label>
        <br />
        <asp:GridView ID="gvResultados" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <RowStyle HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </div>
    <div>
        <asp:linkButton ID="btnVolver" runat="server" Text="Volver" PostBackUrl ="~/Administrador/Home.aspx"/>
    </div>


</asp:Content>
