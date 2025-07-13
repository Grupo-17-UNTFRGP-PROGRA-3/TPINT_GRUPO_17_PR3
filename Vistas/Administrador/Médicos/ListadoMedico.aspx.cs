using Clinica;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ListadoMedico : System.Web.UI.Page
    {
        private NegocioMedico _negocioMedico = new NegocioMedico();
        private NegocioEspecialidad _negocioEspecialidad = new NegocioEspecialidad();
        private NegocioProvincia _negocioProvincia = new NegocioProvincia();
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

                CargarMedicos();
                CargarEspecialidades();
                CargarProvincias();
            }
        }

        private void CargarMedicos()
        {
            gvMedicos.DataSource = _negocioMedico.ListadoMedicosJoined();
            gvMedicos.DataBind();
            lblSinResultados.Visible = gvMedicos.Rows.Count == 0;
        }

        private void CargarEspecialidades()
        {
            DataTable dtEspecialidades = _negocioEspecialidad.GetTable();

            ddlEspecialidad.DataSource = dtEspecialidades;
            ddlEspecialidad.DataTextField = "Descripcion";
            ddlEspecialidad.DataValueField = "Descripcion";
            ddlEspecialidad.DataBind();
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
            Response.Redirect("AltaMedico.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }

        protected void gvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "EliminarMedico")
            {
                Usuario usuario = new Usuario();
                NegocioUsuario negocioUsuario = new NegocioUsuario();
                int legajo = Convert.ToInt32(e.CommandArgument);
                usuario = negocioUsuario.ObtenerUsuarioPorLegajo(legajo);
                if (_negocioMedico.ExisteLegajo(legajo))
                {
                    negocioUsuario.EliminarUsuario(usuario);
                    _negocioMedico.EliminarMedico(legajo);
                }

                CargarMedicos();
            }

            if (e.CommandName == "ModificarMedico")
            {
                string legajo = e.CommandArgument.ToString();
                Response.Redirect($"~/Administrador/Médicos/AltaMedico.aspx?legajo={legajo}");
            }
        }

        protected void gvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicos.PageIndex = e.NewPageIndex;

            if (Session["MedicosFiltrados"] != null)
            {
                gvMedicos.DataSource = Session["MedicosFiltrados"];
            }
            else
            {
                CargarMedicos();
                return;
            }

            gvMedicos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();
            string especialidad = ddlEspecialidad.SelectedValue;
            string sexo = ddlSexo.SelectedValue;
            string provincia = ddlProvincia.SelectedValue;

            DataTable dt = _negocioMedico.ListadoMedicosJoined();
            if (dt == null) return;

            DataView dv = dt.DefaultView;
            List<string> filtros = new List<string>();

            if (!string.IsNullOrEmpty(nombre))
                filtros.Add($"Nombre LIKE '%{nombre}%'");

            if (!string.IsNullOrEmpty(especialidad))
                filtros.Add($"Especialidad = '{especialidad}'");

            if (!string.IsNullOrEmpty(sexo))
                filtros.Add($"Sexo = '{sexo}'");

            if (!string.IsNullOrEmpty(provincia))
                filtros.Add($"Provincia = '{provincia}'");

            dv.RowFilter = string.Join(" AND ", filtros);
            Session["MedicosFiltrados"] = dv.ToTable();

            gvMedicos.DataSource = dv;
            gvMedicos.DataBind();
            lblSinResultados.Visible = gvMedicos.Rows.Count == 0;
        }

        protected void btnEliminarFiltro_Click(object sender, EventArgs e)
        {
            txtNombre.Text = string.Empty;
            ddlEspecialidad.SelectedIndex = 0;
            ddlSexo.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;

            Session["MedicosFiltrados"] = null;

            CargarMedicos();
        }
    }
}