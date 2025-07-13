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
                //VALIDAR USUARIO LOGEADO
                if (Session["UsuarioRol"] == null)
                {
                    Response.Redirect(ResolveUrl("~/Login.aspx"));
                    return;
                }

                //VALIDAR ROL
                if (Session["UsuarioRol"].ToString() != "Medico")
                {
                    Response.Redirect(ResolveUrl(Session["Home"].ToString()));
                    return;
                }

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
            lblMensajeFecha.Text = string.Empty;   
            gvTurnos.DataSource = negocioTurno.filtrarTurnos(legajo, txtFiltroPaciente.Text, txtFechaFiltro.Text, ddlFiltroEstado.Text);
            gvTurnos.DataBind();
            if (gvTurnos.Rows.Count == 0)
            {
                lblMensajeFecha.Text = "No hay turnos para esa fecha";
            }
        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtFiltroPaciente.Text = string.Empty;
            txtFechaFiltro.Text = string.Empty;
            ddlFiltroEstado.SelectedIndex = 0;
            CargarListado();
        }

        protected void gvTurnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "verTurno") {
                int fila = Convert.ToInt32(e.CommandArgument);
                string id =((Label) gvTurnos.Rows[fila].FindControl("lblID")).Text;
                Response.Redirect(ResolveUrl($"~/Medico/VistaTurno.aspx?id={id}"));
            }
        }
    }
}