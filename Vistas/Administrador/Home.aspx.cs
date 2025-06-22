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
            if (Session["Usuario"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        /*revela botones alta/gestion paciente*/
        protected void lkbPaciente_Click(object sender, EventArgs e)
        {
            if (!lkbMP_AltaPaciente.Visible == true)
            {
                lkbMP_AltaPaciente.Visible = true;
                lkbMP_ListadoPaciente.Visible = true;
            }
            else
            {
                lkbMP_AltaPaciente.Visible = false;
                lkbMP_ListadoPaciente.Visible = false;
            }
        }

        /*redireccion a Alta Paciente*/
        protected void lkbMP_AltaPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Pacientes/AltaPaciente.aspx");
        }

        /*redireccion a Listado Paciente*/
        protected void lkbMP_ListadoPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Pacientes/ListadoPaciente.aspx");
        }

        /*revela botones alta/gestion medico*/
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

        /*redireccion a Alta Medicos*/
        protected void lkbMP_AltaMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Médicos/AltaMedico.aspx");

        }

        /*redireccion a Listado Medicos*/
        protected void lkbMP_ListadoMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Médicos/ListadoMedico.aspx");
        }
    }
}