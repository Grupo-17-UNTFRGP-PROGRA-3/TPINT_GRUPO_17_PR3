<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListadoTurnos.aspx.cs" Inherits="Vistas.Medico.ListadoTurnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Listado de Turnos</h1>
    </div>
    <div>
        <div class="form-group">
            <label>Paciente: </label>
            <asp:TextBox runat="server" ID="txtFiltroPaciente"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Fecha: </label>
            <input type="date" id="txtFiltroFecha" runat="server"/>
        </div>
        <div class="form-group">
            <label>Estado: </label>
            <asp:DropDownList ID="ddlFiltroEstado" runat="server">
                <asp:ListItem Text="--Seleccione Estado--" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" style="margin-bottom: 10px;"/>
    <div>
        <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Hora" HeaderText="Hora" />
                <asp:BoundField DataField="Paciente" HeaderText="Paciente" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnSeleccionar" runat="server" Text="Ver Detalles" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
</asp:Content>
