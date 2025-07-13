<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VistaTurno.aspx.cs" Inherits="Vistas.Administrador.Turnos.VistaTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel" runat="server" Style="border: 2px solid lightblue; padding: 10px; border-radius: 5px;">
        <asp:Label ID="Label1" runat="server" CssClass="form-labelV" Text="Codigo:" Font-Size="Large" Font-Bold="True"></asp:Label>
        &nbsp;<asp:Label ID="lblCodigo" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" CssClass="form-labelV" Text="Fecha:" Font-Size="Large" Font-Bold="True"></asp:Label>
        &nbsp;<asp:Label ID="lblFecha" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" CssClass="form-labelV" Text="Hora:" Font-Size="Large" Font-Bold="True"></asp:Label>
        &nbsp;<asp:Label ID="lblHora" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" CssClass="form-labelV" Text="Paciente:" Font-Size="Large" Font-Bold="True"></asp:Label>
        &nbsp;<asp:Label ID="lblPaciente" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label5" runat="server" CssClass="form-labelV" Text="DNI:" Font-Size="Large" Font-Bold="True"></asp:Label>
        &nbsp;<asp:Label ID="lblDNI" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" CssClass="form-labelV" Text="Estado:" Font-Size="Large" Font-Bold="True"></asp:Label>
        &nbsp;<asp:DropDownList ID="ddlFiltroEstado" runat="server" CssClass="form-input">
            <asp:ListItem Text="Pendiente" Value=""></asp:ListItem>
            <asp:ListItem>Ausente</asp:ListItem>
            <asp:ListItem>Presente</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblMed" runat="server" CssClass="form-labelV" Font-Bold="True" Font-Size="Large" Text="Medico:" Visible="False"></asp:Label>
        &nbsp;<asp:Label ID="lblMedico" runat="server" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="lblEsp" runat="server" CssClass="form-labelV" Font-Bold="True" Font-Size="Large" Text="Especialidad:" Visible="False"></asp:Label>
        &nbsp;<asp:Label ID="lblEspecialidad" runat="server" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Label7" runat="server" CssClass="form-labelV" Text="Observaciones" Font-Size="Large" Font-Bold="True"></asp:Label>
        &nbsp;<br />
        <asp:TextBox Style="resize: none; overflow: auto" ID="txtOb" runat="server" BorderColor="Black" BorderStyle="Solid" Height="111px" TextMode="MultiLine" Width="392px" Font-Names="Calibri" Font-Size="Medium"></asp:TextBox>
        <br />
        <br />
    </asp:Panel>
    <div>
        <asp:Button ID="btnActualizar" CssClass="linkbutton" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnVolver" CssClass="linkbutton" runat="server" Text="Volver" OnClick="btnVolver_Click" />
    </div>
    <br />
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    <br />
</asp:Content>
