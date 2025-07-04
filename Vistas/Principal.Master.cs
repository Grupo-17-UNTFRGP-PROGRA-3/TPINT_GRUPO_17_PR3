﻿using System;
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
			if (Session["Usuario"] != null && Session["Home"] != null)
			{
				lblUsuario.Text = Session["Usuario"].ToString();
				HyperLink1.NavigateUrl = Session["Home"].ToString();
			}
			else
			{
				lblUsuario.Text = "Nadie esta logueado";
				HyperLink1.NavigateUrl = "";
			}
		}

        protected void btnLogout_Click(object sender, EventArgs e)
        {
			Session.Clear();
			Response.Redirect("~/Login.aspx");
        }
    }
}

