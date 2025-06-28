using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;

namespace Vistas.Administrador.Médicos
{
    public partial class CreacionLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            lblNombreMedico.Text = string.Empty;
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtLegajo.Text = string.Empty;
            txtUsuario.Text = string.Empty;
            txtPass1.Text = string.Empty;
            txtPass2.Text = string.Empty;
        }
        protected void BtnBuscarLegajo_Click(object sender, EventArgs e)
        {
            NegocioMedico negocioMedico = new NegocioMedico();
            string legajo = txtLegajo.Text.ToString();
            LoginUsuario loginUsuario = new LoginUsuario(legajo);

            if (legajo != "0000" && negocioMedico.ExisteLegajo(legajo)&& !loginUsuario.ExisteCuenta())
            {
                lblNombreMedico.Text = negocioMedico.ObtenerMedicoPorLegajo(legajo)._Nombre.ToString() + " " + negocioMedico.ObtenerMedicoPorLegajo(legajo)._Apellido.ToString();
                pnlUsuarioMedico.Visible = true;
                BtnBuscarLegajo.Visible = false;
                BtnVolver2.Visible = false;
            }
            else if (legajo != "0000" && negocioMedico.ExisteLegajo(legajo))
            {
                lblNombreMedico.Text = "El médico ya tiene cuenta";
                pnlUsuarioMedico.Visible = false;
                BtnBuscarLegajo.Visible = true;
                BtnVolver2.Visible = true;
            }
            else
            {
                lblNombreMedico.Text = "No hay médico registrado con ese legajo";
                pnlUsuarioMedico.Visible = false;
                BtnBuscarLegajo.Visible = true;
                BtnVolver2.Visible = true;
            }
        }

        protected void txtLegajo_TextChanged(object sender, EventArgs e)
        {
            this.Page_Load(sender, e);
            pnlUsuarioMedico.Visible = false;
            BtnBuscarLegajo.Visible = true;
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }
    }
    
}