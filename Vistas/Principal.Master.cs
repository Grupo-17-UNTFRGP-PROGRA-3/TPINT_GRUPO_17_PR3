using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                    lblUsuario.Text = Session["Usuario"].ToString();
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

