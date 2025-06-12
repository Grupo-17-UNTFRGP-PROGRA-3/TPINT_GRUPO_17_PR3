using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
	public partial class Home : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void lkbPaciente_Click(object sender, EventArgs e)
        {
            if (!lkbMP_AltaPaciente.Visible == true)
            {
                lkbMP_AltaPaciente.Visible = true;
                lkbMP_ListadoPaciente.Visible=true;
            }
            else
            {
                lkbMP_AltaPaciente.Visible = false;
                lkbMP_ListadoPaciente.Visible = false;
            }
        }

        protected void lkbMedico_Click(object sender, EventArgs e)
        {
            if (!lkbMP_AltaMedicos.Visible == true)
            {
                lkbMP_AltaMedicos.Visible = true;
                lkbMP_ListadoMedicos.Visible = true;
            }
            else
            {
                lkbMP_AltaMedicos.Visible = false;
                lkbMP_ListadoMedicos.Visible = false;
            }
        }
    }
}