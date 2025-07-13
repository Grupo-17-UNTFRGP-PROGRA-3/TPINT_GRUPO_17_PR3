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
            }
        }

        // Botones Alta y Gestion Paciente
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

        // Redireccion a Alta Paciente
        protected void lkbMP_AltaPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Pacientes/AltaPaciente.aspx");
        }

        // Redireccion a Listado Paciente
        protected void lkbMP_ListadoPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Pacientes/ListadoPaciente.aspx");
        }

        // Botones Alta y Gestion Medico
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

        // Redireccion a Alta Medicos
        protected void lkbMP_AltaMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Médicos/AltaMedico.aspx");

        }

        // Redireccion a Listado Medicos
        protected void lkbMP_ListadoMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Médicos/ListadoMedico.aspx");
        }

        // Botones Alta y Listado Turnos
        protected void lkbTurnos_Click(object sender, EventArgs e)
        {
            if (!lkbMP_AltaTurnos.Visible == true)
            {
                lkbMP_AltaTurnos.Visible = true;
                lkbMP_ListadoTurnos.Visible = true;
            }
            else
            {
                lkbMP_AltaTurnos.Visible = false;
                lkbMP_ListadoTurnos.Visible = false;
            }
        }

        // Redireccion a Alta Turnos
        protected void lkbMP_AltaTurnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Turnos/AltaTurnos.aspx");

        }

        // Redireccion a Listado Turnos
        protected void lkbMP_ListadoTurnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Turnos/ListaTurnos.aspx");
        }
    }
}