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
        }

        public void btnPacXMed_Click(object sender, EventArgs e)
        {
            btnVolver.Focus();
            gvResultados.Visible=true;
            gvResultados.DataSource = negInf.TraerInforme(txtFechaInicial.Text, txtFechaFinal.Text, 1);
            gvResultados.DataBind();
        }

        protected void btnPacXEsp_Click(object sender, EventArgs e)
        {
            btnVolver.Focus();
            gvResultados.Visible = true;
            gvResultados.DataSource = negInf.TraerInforme(txtFechaInicial.Text, txtFechaFinal.Text, 2);
            gvResultados.DataBind();
        }

        protected void btnHorasPico_Click(object sender, EventArgs e)
        {
            btnVolver.Focus();
            gvResultados.Visible = true;
            gvResultados.DataSource = negInf.TraerInforme(txtFechaInicial.Text, txtFechaFinal.Text, 3);
            gvResultados.DataBind();
        }
    }
}