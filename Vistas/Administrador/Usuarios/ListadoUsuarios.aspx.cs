using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;

namespace Vistas.Administrador.Usuarios
{
	public partial class ListadoUsuarios : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				cargarUsuarios();
			}
		}

		public void cargarUsuarios()
		{
            NegocioUsuario us = new NegocioUsuario();
            gvUsuarios.DataSource = us.ListadoUsuarios();
			gvUsuarios.DataBind();
        }

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
			gvUsuarios.PageIndex = e.NewPageIndex;
			cargarUsuarios();
        }

        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ModificarUsuario")
            {
                int legajo = int.Parse( e.CommandArgument.ToString());
                Response.Redirect($"~/Administrador/Médicos/ModificarUsuario.aspx?legajo={legajo}");
            }
        }
    }
}