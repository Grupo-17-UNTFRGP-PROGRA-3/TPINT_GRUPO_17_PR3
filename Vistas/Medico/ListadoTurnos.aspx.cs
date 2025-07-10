using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;

namespace Vistas.Medico
{
    public partial class ListadoTurnos : System.Web.UI.Page
    {
        NegocioTurno negocioTurno = new NegocioTurno();
        int legajo;
        protected void Page_Load(object sender, EventArgs e)
        {
           legajo = Convert.ToInt32(Session["Legajo"]);

            if (!IsPostBack)
            {
                CargarListado();
            }
        }

        protected void CargarListado()
        {
            gvTurnos.DataSource = negocioTurno.listaTurnos(legajo);
            gvTurnos.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        { 
            gvTurnos.DataSource = negocioTurno.filtrarTurnos(legajo, txtFiltroPaciente.Text, txtFechaFiltro.Text, ddlFiltroEstado.Text);
            gvTurnos.DataBind();
        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtFiltroPaciente.Text = string.Empty;
            txtFechaFiltro.Text = string.Empty;
            ddlFiltroEstado.SelectedIndex = 0;
            CargarListado();
        }
    }
}