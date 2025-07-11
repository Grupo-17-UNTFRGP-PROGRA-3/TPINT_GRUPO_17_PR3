<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VistaTurno.aspx.cs" Inherits="Vistas.Administrador.Turnos.VistaTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <asp:Label ID="Label1" runat="server" CssClass="form-labelV" Text="Codigo:" Font-Size="Large" Font-Bold="True"></asp:Label> 
    <asp:Label ID="lblCodigo" runat="server"></asp:Label>
    <br />
    Fecha:
    <asp:Label ID="lblFecha" runat="server"></asp:Label>
    <br />
    Hora:&nbsp;
    <asp:Label ID="lblHora" runat="server"></asp:Label>
    <br />
    Paciente:&nbsp;
    <asp:Label ID="lblPaciente" runat="server"></asp:Label>
    <br />
    DNI:&nbsp;
    <asp:Label ID="lblDNI" runat="server"></asp:Label>
    <br />
    Estado:
    <asp:DropDownList ID="ddlFiltroEstado" runat="server" CssClass="form-input">
        <asp:ListItem Text="--Seleccione Estado--" Value=""></asp:ListItem>
        <asp:ListItem>Ausente</asp:ListItem>
        <asp:ListItem>Presente</asp:ListItem>
    </asp:DropDownList>
    <br />
    Observaciones:<br />
    <asp:TextBox ID="txtOb" runat="server" BorderColor="Black" BorderStyle="Solid" Height="111px" TextMode="MultiLine" Width="392px"></asp:TextBox>
    <br />
    <div>
        <asp:Button ID="btnActualizar" CssClass="linkbutton" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" />
    </div>
    <br />
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    <br />
</asp:Content>
