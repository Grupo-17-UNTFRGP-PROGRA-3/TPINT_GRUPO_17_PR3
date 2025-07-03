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

            int legajo = int.Parse(Request.QueryString["legajo"]);
            if (!IsPostBack)
            {
                cargarUsuario(legajo);
                pnlUsuarioMedico.Visible = false;
            }
            
        }

        public void cargarUsuario(int legajo)
        {

            NegocioUsuario negocioUsuario = new NegocioUsuario();
            Usuario Nuevousuario = negocioUsuario.ObtenerUsuarioPorLegajo(legajo);
            txtUsuario.Text = Nuevousuario.getUsuario();

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


        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }
        protected void BtnBuscarUsuario_Click(object sender, EventArgs e)
        {
            NegocioUsuario neg = new NegocioUsuario();
            if (neg.existeUsuario(txtUsuario.Text))
            {
                LabelUsuario.Text = "Usuario no disponible, elija otro";
            }
            else
            {
                pnlUsuarioMedico.Visible = true;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            int legajo = int.Parse(Request.QueryString["legajo"]);
          
            if (txtPass1.Text == txtPass2.Text)
            {               
               
                NegocioUsuario log = new NegocioUsuario();
                log.ModificarUsuario(txtUsuario.Text,txtPass1.Text,legajo);
                lblMensaje.Text = "EXITO";

            }


        }
    }
}
