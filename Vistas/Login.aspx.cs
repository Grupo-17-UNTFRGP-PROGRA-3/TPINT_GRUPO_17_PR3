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
			Session["Usuario"] = string.Empty;
            Session["Home"] = string.Empty;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
		{
			LoginUsuario log = new LoginUsuario(txtUsuario.Text, txtClave.Text);
			
			
			if (log.EsLoginValido() && log.EsAdmin())
			{
				
				Session["Usuario"] = txtUsuario.Text;
				Session["Home"] = "~/Home.aspx";
				Response.Redirect("~/Home.aspx");
			}
			else if (log.EsLoginValido())
			{
				Session["Usuario"] = txtUsuario.Text;
				Session["Home"] = "~/Medico/ListadoTurnos.aspx";
				Response.Redirect("~/Medico/ListadoTurnos.aspx");
			}
        }
    }
}