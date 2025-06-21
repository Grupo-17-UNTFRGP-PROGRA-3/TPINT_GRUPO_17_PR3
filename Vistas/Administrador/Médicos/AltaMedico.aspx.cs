using Clinica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class AltaMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnBuscarLegajo_Click(object sender, EventArgs e)
        {
            NegocioMedico negocioMedico = new NegocioMedico();
            string legajo = txtLegajo.Text.ToString();

            if (negocioMedico.ExisteLegajo(legajo))
            {
                lblInicio.Text = "El Legajo ya se encuentra registrado.";
                pnlDatosMedico.Visible = false;
            }
            else
            {
                lblInicio.Text = "";
                pnlDatosMedico.Visible = true;
                BtnBuscarLegajo.Visible = false;
                BtnVolver2.Visible = false;
            }
        }

        public void LimpiarCampos()
        {
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtDNI.Text = string.Empty;
            rblSexo.ClearSelection();
            ddlNacionalidad.SelectedIndex = 0;
            txtAnio.Text = string.Empty;
            txtMes.Text = string.Empty;
            txtDia.Text = string.Empty;
            txtCalle.Text = string.Empty;
            txtAltura.Text = string.Empty;
            ddlProvincia.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            ddlEspecialidad.SelectedIndex = 0;
            cblDiasAtencion.ClearSelection();
            ddlHoraInicio.SelectedIndex = 0;
            ddlHoraFin.SelectedIndex = 0;
        }

        protected void btnLimpiarCampos_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }
    }
}