using Clinica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Administrador.Usuarios
{
	public partial class ListadoUsuarios : System.Web.UI.Page
	{
        public void cargarUsuarios()
        {
            NegocioUsuario us = new NegocioUsuario();
            gvUsuarios.DataSource = us.ListadoUsuarios();
            gvUsuarios.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
		{
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

                cargarUsuarios();
			}
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
                int legajo = int.Parse(e.CommandArgument.ToString());

                if (legajo != 0000) // si es medico, envia el legajo
                {
                    Response.Redirect($"~/Administrador/Médicos/ModificarUsuario.aspx?legajo={legajo}");
                }
                else // si es admin, envia legajo y nombre de usuario
                {
                    int gvIndice = ((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex;
                    string usuario = gvUsuarios.DataKeys[gvIndice].Value.ToString();

                    Response.Redirect($"~/Administrador/Médicos/ModificarUsuario.aspx?legajo={legajo}&usuario={usuario}");
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }
    }
}