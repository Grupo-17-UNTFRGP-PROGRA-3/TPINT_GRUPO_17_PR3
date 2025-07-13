using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Administrador.Médicos
{
	public partial class PerfilMed : System.Web.UI.Page
	{
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
                if (Session["UsuarioRol"].ToString() != "Medico")
                {
                    Response.Redirect(ResolveUrl(Session["Home"].ToString()));
                    return;
                }
            }
		}
	}
}