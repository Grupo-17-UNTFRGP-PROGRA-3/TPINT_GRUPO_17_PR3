using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            if (!IsPostBack)
            {
                ddlNacionalidad.Items.Clear();

                ddlNacionalidad.Items.Add(new ListItem("Seleccione una nacionalidad...", "") { Enabled = false, Selected = true });
                ddlNacionalidad.Items.Add(new ListItem("Nacionalidad1"));
                ddlNacionalidad.Items.Add(new ListItem("Nacionalidad2"));
                ddlNacionalidad.Items.Add(new ListItem("Nacionalidad3"));
                ddlNacionalidad.Items.Add(new ListItem("etc"));
            }
            */
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Listado.aspx");
        }
    }
}