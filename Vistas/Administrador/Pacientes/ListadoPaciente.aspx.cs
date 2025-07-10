using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;

namespace Vistas.Pacientes
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private NegocioPaciente _negocioPaciente = new NegocioPaciente();
        private NegocioProvincia _negocioProvincia = new NegocioProvincia();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPacientes();
                CargarProvincias();
            }
        }

        private void CargarPacientes()
        {
            gvPacientes.DataSource = _negocioPaciente.ListadoPacientesJoined();
            gvPacientes.DataBind();
        }

        private void CargarProvincias()
        {
            DataTable dtProvincias = _negocioProvincia.GetTable();

            ddlProvincia.DataSource = dtProvincias;
            ddlProvincia.DataTextField = "Descripcion";
            ddlProvincia.DataValueField = "Descripcion";
            ddlProvincia.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Pacientes/AltaPaciente.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }

        protected void gvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EliminarPaciente")
            {
                string dni = e.CommandArgument.ToString();
                if (_negocioPaciente.ExisteDNI(int.Parse(dni)))
                {
                    _negocioPaciente.EliminarPaciente(int.Parse(dni));
                }

                CargarPacientes();
            }

            if (e.CommandName == "ModificarPaciente")
            {
                string dni = e.CommandArgument.ToString();
                Response.Redirect($"~/Administrador/Pacientes/AltaPaciente.aspx?dni={dni}");
            }
        }

        protected void gvPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPacientes.PageIndex = e.NewPageIndex;
            CargarPacientes();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();
            string dni = txtDni.Text;
            string sexo = ddlSexo.SelectedValue;
            string provincia = ddlProvincia.SelectedValue;

            DataTable dt = _negocioPaciente.ListadoPacientesJoined();
            if (dt == null) return;

            DataView dv = dt.DefaultView;
            List<string> filtros = new List<string>();

            if (!string.IsNullOrEmpty(nombre))
                filtros.Add($"Nombre LIKE '%{nombre}%'");

            if (!string.IsNullOrEmpty(dni))
                filtros.Add($"DNI LIKE '%{dni}%'");

            if (!string.IsNullOrEmpty(sexo))
                filtros.Add($"Sexo = '{sexo}'");

            if (!string.IsNullOrEmpty(provincia))
                filtros.Add($"Provincia = '{provincia}'");

            dv.RowFilter = string.Join(" AND ", filtros);

            gvPacientes.DataSource = dv;
            gvPacientes.DataBind();
        }

        protected void btnEliminarFiltro_Click(object sender, EventArgs e)
        {
            txtNombre.Text = string.Empty;
            txtDni.Text = string.Empty;
            ddlSexo.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;

            CargarPacientes();
        }
    }
}