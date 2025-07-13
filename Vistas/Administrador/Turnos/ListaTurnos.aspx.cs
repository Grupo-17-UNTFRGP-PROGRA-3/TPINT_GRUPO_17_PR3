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
        NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //VALIDAR USUARIO LOGEADO
                if (Session["UsuarioRol"] == null)
                {
                    Response.Redirect(ResolveUrl("~/Login.aspx"));
                    return;
                }

                //VALIDAR ROL
                if (Session["UsuarioRol"].ToString() == "Medico")
                {
                    Response.Redirect(ResolveUrl(Session["Home"].ToString()));
                    return;
                }

                CargarTurnos();
                CargarEspecialidades();
            }
        }

        private void CargarTurnos()
        {
            gvTurnos.DataSource = negocioTurno.listaTurnos();
            gvTurnos.DataBind();
        }

        private void CargarEspecialidades()
        {
            DataTable dtEspecialidades = negocioEspecialidad.GetTable();

            ddlEspecialidad.DataSource = dtEspecialidades;
            ddlEspecialidad.DataTextField = "Descripcion";
            ddlEspecialidad.DataValueField = "Descripcion";
            ddlEspecialidad.DataBind();
        }

        protected void btnAgregar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Turnos/AltaTurnos.aspx");
        }

        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;

            if (Session["TurnosFiltrados"] != null)
            {
                gvTurnos.DataSource = Session["TurnosFiltrados"];
            }
            else
            {
                CargarTurnos();
                return;
            }

            gvTurnos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string codigo = txtCodigo.Text.Trim();
            string medico = txtMedico.Text.Trim();
            string paciente = txtPaciente.Text.Trim();
            string especialidad = ddlEspecialidad.SelectedValue;
            string estado = ddlEstado.SelectedValue;
            string fechaDesde = txtFechaDesde.Text.Trim();
            string fechaHasta = txtFechaHasta.Text.Trim();

            DataTable dt = negocioTurno.listaTurnos();
            if (dt == null) return;

            DataView dv = dt.DefaultView;
            List<string> filtros = new List<string>();

            if (!string.IsNullOrEmpty(codigo))
                filtros.Add($"Id = {codigo}");

            if (!string.IsNullOrEmpty(medico))
                filtros.Add($"Medico LIKE '%{medico}%'");

            if (!string.IsNullOrEmpty(paciente))
                filtros.Add($"Paciente LIKE '%{paciente}%'");

            if (!string.IsNullOrEmpty(especialidad))
                filtros.Add($"Especialidad = '{especialidad}'");

            if (!string.IsNullOrEmpty(estado))
                filtros.Add($"Estado = '{estado}'");

            if (!string.IsNullOrEmpty(fechaDesde))
                filtros.Add($"Fecha >= '{fechaDesde}'");

            if (!string.IsNullOrEmpty(fechaHasta))
                filtros.Add($"Fecha <= '{fechaHasta}'");

            dv.RowFilter = string.Join(" AND ", filtros);
            Session["TurnosFiltrados"] = dv.ToTable();

            gvTurnos.DataSource = dv;
            gvTurnos.DataBind();
            lblSinResultados.Visible = gvTurnos.Rows.Count == 0;
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

        protected void btnEliminarFiltro_Click(object sender, EventArgs e)
        {
            txtCodigo.Text = string.Empty;
            txtMedico.Text = string.Empty;
            txtPaciente.Text = string.Empty;
            ddlEspecialidad.SelectedIndex = 0;
            ddlEstado.SelectedIndex = 0;
            txtFechaDesde.Text = string.Empty;
            txtFechaHasta.Text = string.Empty;

            Session["TurnosFiltrados"] = null;

            CargarTurnos();
        }
    }
}

