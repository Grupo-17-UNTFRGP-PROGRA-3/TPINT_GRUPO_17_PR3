using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Clinica;
using System.Data;

namespace Vistas.Administrador.Informes
{
    public partial class Informes : System.Web.UI.Page
    {
        public NegocioInformes negInf = new NegocioInformes();
        public Informe inf = new Informe();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            gvResultados.Visible = false;

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
            }
        }

        public void btnPacXMed_Click(object sender, EventArgs e)
        {
            lblInforme.Text = string.Empty;
            btnVolver.Focus();
            gvResultados.Visible=true;
            inf._dt = negInf.TraerInforme(txtFechaInicial.Text, txtFechaFinal.Text, 1);
            gvResultados.DataSource = inf._dt;
            inf.CargarDatosDescripcion("Apellido", "medicos mas solicitados");
            lblInforme.Text = inf._descripcion[3].ToString();
            gvResultados.DataBind();
        }

        protected void btnPacXEsp_Click(object sender, EventArgs e)
        {
            lblInforme.Text = string.Empty;
            btnVolver.Focus();
            gvResultados.Visible = true;
            inf._dt = negInf.TraerInforme(txtFechaInicial.Text, txtFechaFinal.Text, 2);
            gvResultados.DataSource = inf._dt;
            inf.CargarDatosDescripcion("Descripcion", "especialidades mas necesitadas");
            lblInforme.Text = inf._descripcion[3].ToString();
            gvResultados.DataBind();
        }

        protected void btnHorasPico_Click(object sender, EventArgs e)
        {
            lblInforme.Text = string.Empty;
            btnVolver.Focus();
            gvResultados.Visible = true;
            inf._dt = negInf.TraerInforme(txtFechaInicial.Text, txtFechaFinal.Text, 3);
            gvResultados.DataSource = inf._dt;
            lblInforme.Text = "En la tabla se muestra la concurrencia por hora";
            gvResultados.DataBind();
        }
    }
}