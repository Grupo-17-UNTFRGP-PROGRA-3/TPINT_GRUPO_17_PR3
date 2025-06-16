using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Session["Usuario"] = string.Empty;
            Session["Home"] = string.Empty;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
			if (txtUsuario.Text == "admin")
			{
				Session["Usuario"] = "admin";
				Session["Home"] = "~/Home.aspx";
                Response.Redirect("~/Home.aspx");
			}
			else
			{
				Session["Usuario"] = txtUsuario.Text;
                Session["Home"] = "~/Medico/ListadoTurnos.aspx";
                Response.Redirect("~/Medico/ListadoTurnos.aspx");
			}
        }
    }
}