using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;
using Entidades;

namespace Vistas.Medico
{
	public partial class HomeMed : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
          
        }

        public void lkbPerfil_Click(object sender, EventArgs e)
        {            
            NegocioUsuario us = new NegocioUsuario();
            Usuario usuario = us.traerRegistro(Session["Usuario"].ToString());
            int legajo = usuario._legajo; 
            Response.Redirect($"~/Administrador/Médicos/ModificarUsuario.aspx?legajo={legajo}");
        }

    }
}