using Clinica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ListadoMedico : System.Web.UI.Page
    {
        private NegocioMedico _negocioMedico = new NegocioMedico();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMedicos();
            }
        }

        private void CargarMedicos()
        {
            gvMedicos.DataSource = _negocioMedico.ListadoMedicosJoined();
            gvMedicos.DataBind();
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
                string legajo = e.CommandArgument.ToString();
                if (_negocioMedico.ExisteLegajo(legajo))
                {
                    _negocioMedico.EliminarMedico(legajo);
                }

                CargarMedicos();
            }
        }

        protected void gvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicos.PageIndex = e.NewPageIndex;
            CargarMedicos();
        }
    }
}