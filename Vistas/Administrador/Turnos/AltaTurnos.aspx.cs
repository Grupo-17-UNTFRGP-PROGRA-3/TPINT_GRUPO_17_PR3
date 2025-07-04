using Clinica;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Administrador
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void CargarMedicos(int idEspecialidad)
        {
            NegocioMedico negocioMedico = new NegocioMedico();

            DataTable TablaMedicosPorEspecialidad = negocioMedico.ListadoMedicosPorEspecialidad(idEspecialidad);

            ddlMedico.DataSource = TablaMedicosPorEspecialidad;
            ddlMedico.DataTextField = "Descripcion";
            ddlMedico.DataValueField = "Legajo";
            ddlMedico.DataBind();
            ddlMedico.Items.Insert(0, new ListItem("-- Seleccione Médico --", "0"));
        }

        protected void CargarDias(string legajo) 
        {
            NegocioMedico negocioMedico = new NegocioMedico();

            DataTable TablaDiasDeAtencionPorLegajo = negocioMedico.ListadoDiasDeAtencionPorLegajo(legajo);

            ddlDia.DataSource = TablaDiasDeAtencionPorLegajo;
            ddlDia.DataTextField = "Descripcion";
            ddlDia.DataValueField = "IdDia";
            ddlDia.DataBind();
            ddlDia.Items.Insert(0, new ListItem("-- Seleccione Dia --", "0"));
        }

        protected void LimpiarCampos()
        {
            ddlEspecialidad.SelectedIndex = 0;
            ddlMedico.SelectedIndex = 0;
            ddlDia.SelectedIndex = 0;
            ddlHorario.SelectedIndex = 0;
            ddlPaciente.SelectedIndex = 0;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // CARGA ESPECIALIDADES
                NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
                DataTable tablaEspecialidades = new DataTable();

                tablaEspecialidades = negocioEspecialidad.GetTable();

                ddlEspecialidad.DataSource = tablaEspecialidades;
                ddlEspecialidad.DataTextField = "Descripcion";
                ddlEspecialidad.DataValueField = "Id";
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccione Especialidad --", "0"));

                // CARGA PACIENTES
                NegocioPaciente negocioPaciente = new NegocioPaciente();
                DataTable tablaPacientes = new DataTable();

                tablaPacientes = negocioPaciente.ListadoPacientesNombreConDNI();

                ddlPaciente.DataSource = tablaPacientes;
                ddlPaciente.DataTextField = "Descripcion";
                ddlPaciente.DataValueField = "Dni";
                ddlPaciente.DataBind();
                ddlPaciente.Items.Insert(0, new ListItem("-- Seleccione Paciente --", "0"));
            }
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idEspecialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);

            CargarMedicos(idEspecialidad);
        }

        protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            string legajo = ddlMedico.SelectedValue;

            CargarDias(legajo);
        }

        protected void ddlDia_SelectedIndexChanged(object sender, EventArgs e)
        {
            // logica para cambiar los horarios en funcion del dia
        }

        protected void btnAsignarTurno_Click1(object sender, EventArgs e)
        {
            Response.Redirect("ListaTurnos.aspx");
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }
    }
}