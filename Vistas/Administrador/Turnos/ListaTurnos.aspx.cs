using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;
using Vistas.Administrador.Turnos;

namespace Vistas.Administrador
{
	public partial class ListaTurnos : System.Web.UI.Page
	{
        NegocioTurno negocioTurno = new NegocioTurno();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTurnos();
            }
        }

        private void CargarTurnos()
        {
            gvTurnos.DataSource = negocioTurno.listaTurnos();
            gvTurnos.DataBind();
        }

        protected void btnAgregar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Turnos/AltaTurnos.aspx");
        }

        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            CargarTurnos();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string filtro = txtBuscar.Text.Trim();
            if (string.IsNullOrEmpty(filtro))
            {
                lblMensaje.Text = "Debe ingresar un dato para buscar.";
                return;
            }

            DataTable resultado = negocioTurno.filtrarTurnos(filtro);
            if (resultado.Rows.Count == 0)
            {
                lblMensaje.Text = "No se encontraron turnos con ese criterio.";
            }
            else
            {
                gvTurnos.DataSource = resultado;
                gvTurnos.DataBind();
                lblMensaje.Text = string.Empty;
            }
        }

        protected void gvTurnos_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            CargarTurnos();
        }

        protected void gvTurnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "VerTurno")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect($"~/Administrador/Turnos/VistaTurno.aspx?id={id}");
            }

            if (e.CommandName == "EliminarTurno")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                negocioTurno.EliminarTurno(id);

                if (negocioTurno.EliminarTurno(id) == 1)
                {
                    lblMensaje.ForeColor = Color.Red;
                    lblMensaje.Text = "El turno " + id + " ha sido eliminado con exito";
                    CargarTurnos();
                }

            }
        }
    }
}

