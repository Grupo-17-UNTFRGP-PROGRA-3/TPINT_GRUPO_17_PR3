using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;
using Entidades;

namespace Vistas.Administrador.Médicos
{
    public partial class CreacionLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            lblNombreMedico.Text = string.Empty;
        }
        public void LimpiarCampos()
        {
            txtUsuario.Text = string.Empty;
            txtPass1.Text = string.Empty;
            txtPass2.Text = string.Empty;
        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }
        protected void BtnBuscarLegajo_Click(object sender, EventArgs e)
        {
            NegocioMedico negocioMedico = new NegocioMedico();
            LoginUsuario loginUsuario = new LoginUsuario();

            if (txtLegajo.Text.ToString() != "0000" && negocioMedico.ExisteLegajo(txtLegajo.Text.ToString()) && !loginUsuario.ExisteCuenta(txtLegajo.Text.ToString()))
            {
                lblNombreMedico.Text = negocioMedico.ObtenerMedicoPorLegajo(txtLegajo.Text.ToString())._Nombre.ToString() + " " + negocioMedico.ObtenerMedicoPorLegajo(txtLegajo.Text.ToString())._Apellido.ToString();
                pnlUsuarioMedico.Visible = true;
                BtnBuscarLegajo.Visible = false;
                BtnVolver2.Visible = false;
                txtLegajo.Enabled = false;
                btnModificarLegajo.Visible = true;
            }
            else if (txtLegajo.Text.ToString() != "0000" && negocioMedico.ExisteLegajo(txtLegajo.Text.ToString()))
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

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }
        protected void btnModificarLegajo_Click(object sender, EventArgs e)
        {
            txtLegajo.Enabled = true;
            pnlLegajoUsuarioMedico.Visible = true;
            pnlUsuarioMedico.Visible = false;
            BtnBuscarLegajo.Visible = true;
            btnModificarLegajo.Visible = false;
        }
        protected void btnCrear_Click(object sender, EventArgs e)
        {
            LoginUsuario loginUsuario = new LoginUsuario();

            if (!loginUsuario.ExisteCuenta(txtLegajo.Text.ToString()))
            {
                Usuario usuario = new Usuario(txtUsuario.Text.ToString(), txtPass1.Text.ToString(), txtLegajo.Text.ToString());
                LoginUsuario log = new LoginUsuario(usuario);

                if (log.AgregarCuenta(usuario))
                {
                    lblMensaje.Text = "La cuenta se ha agregado con éxito";
                    lblMensaje.ForeColor = Color.Green;

                    LimpiarCampos();
                }
            }
            else
            {
                lblMensaje.Text = "Ya existe una cuenta para ese legajo";
                lblMensaje.ForeColor = Color.Red;
            }
        }
    }
}