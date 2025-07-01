using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;
using Entidades;

namespace Vistas
{
	public partial class Login: System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["Usuario"] != null)
                Response.Redirect(Session["Home"].ToString());
        }

        protected void btnLogin_Click(object sender, EventArgs e)
		{
			Usuario usuario = new Usuario(txtUsuario.Text, txtClave.Text);
			LoginUsuario log = new LoginUsuario(usuario);

            int resultado = log.EsLoginValido();

			if(resultado == -1)
			{
				lblMensaje.Text = "El usuario no existe.";
				return;
            }

			if(resultado == 0)
			{
                lblMensaje.Text = "Usuario o contraseña incorrectos.";
                return;
            }

			Session["Usuario"] = txtUsuario.Text;
            
			if (log.EsAdmin())
			{
				Session["UsuarioRol"] = "Administrador";
                Session["Home"] = "Administrador/Home.aspx";
			}
			else
			{
				Session["UsuarioRol"] = "Medico";
                Session["Home"] = "Medico/ListadoTurnos.aspx";
			}

			Response.Redirect(Session["Home"].ToString());
        }
    }
}