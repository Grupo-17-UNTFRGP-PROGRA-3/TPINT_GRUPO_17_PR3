using System;
using System.Collections.Generic;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPacientes();
            }
        }

        private void CargarPacientes()
        {
            gvPacientes.DataSource = _negocioPaciente.ListadoPacientesJoined();
            gvPacientes.DataBind();
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
            NegocioPaciente negocioPaciente = new NegocioPaciente();
            int dniABuscar = Convert.ToInt32(txtBuscar.Text);

            if (!negocioPaciente.ExisteDNI(dniABuscar))
            {
                lblMensaje.Text = "El DNI ingresado no existe.";
            }
            else if (txtBuscar.Text.ToString() == "")
            {
                lblMensaje.Text = "Debe ingresar un DNI para buscar.";
            }
            else
            {
                gvPacientes.DataSource = negocioPaciente.PacienteFiltradoPorDNI(dniABuscar);
                gvPacientes.DataBind();

                lblMensaje.Text = string.Empty;
                btnEliminarFiltro.Visible = true;
                btnEliminarFiltro.Enabled = true;
            }
        }

        protected void btnEliminarFiltro_Click(object sender, EventArgs e)
        {
            txtBuscar.Text = string.Empty;
            lblMensaje.Text = string.Empty;

            CargarPacientes();
        }
    }
}