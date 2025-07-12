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
	public partial class Site1 : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
               if (Session["Usuario"] != null)
                {
                    NegocioUsuario negUsuario = new NegocioUsuario();
                    Usuario user = new Usuario();
                    NegocioMedico negMed = new NegocioMedico();
                    Entidades.Medico med = new Entidades.Medico();
                    user = negUsuario.traerRegistro(Session["Usuario"].ToString());
                    med = negMed.ObtenerMedicoPorLegajo(user.getLegajo());
                    if (Session["UsuarioRol"].ToString() != "Administrador")
                    {
                        lblUsuario.Text = med._Nombre + " " + med._Apellido;
                    }
                    else
                    {
                        string nombre = Session["Usuario"].ToString();
                        char c = nombre.Where(char.IsUpper).ToList()[1];
                        string[] nombreCompleto = nombre.Split(c );
                        lblUsuario.Text = nombreCompleto[0] + " " +c+ nombreCompleto[1];
                    }
                }
                else
                {
                    lblUsuario.Text = "Nadie esta logueado";
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
			Session.Clear();
			Response.Redirect(ResolveUrl("~/Login.aspx"));
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            if (Session["Home"] != null)
            {
                Response.Redirect(ResolveUrl(Session["Home"].ToString()));
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}

