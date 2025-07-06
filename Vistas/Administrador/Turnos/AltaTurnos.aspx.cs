using Clinica;
using Entidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
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

        protected void CargarHoras(int legajo, int dia)
        {
            NegocioHorario horario = new NegocioHorario();

            DataTable TablaHoras = horario.ObtenerHorasHabilitadas(legajo, dia);

            ddlHorario.DataSource = TablaHoras;
            ddlHorario.DataTextField = "Horario";
            ddlHorario.DataValueField = "Id";
            ddlHorario.DataBind();
            ddlHorario.Items.Insert(0, new ListItem("-- Seleccione Hora --", "0"));
        }
        protected void LimpiarCampos()
        {
            ddlEspecialidad.SelectedIndex = 0;
            ddlMedico.Items.Clear();
            ddlDia.Items.Clear();
            ddlHorario.Items.Clear();
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
            if (ddlMedico.Items.Count != 0)
            {
                ddlMedico.Items.Clear();
                ddlDia.Items.Clear();
                ddlHorario.Items.Clear();
            }

            int idEspecialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);

            CargarMedicos(idEspecialidad);
        }

        protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDia.Items.Count != 0)
            {
                ddlDia.Items.Clear();
                ddlHorario.Items.Clear();
            }
            string legajo = ddlMedico.SelectedValue;

            CargarDias(legajo);
        }

        protected void ddlDia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlHorario.Items.Count != 0)
            {
                ddlHorario.Items.Clear();
            }
            int Legajo = int.Parse(ddlMedico.SelectedValue);
            int Dia = int.Parse(ddlDia.SelectedValue);

            CargarHoras(Legajo, Dia);
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

        protected void txtFechaTurno_TextChanged(object sender, EventArgs e)
        {
            lblValidacionFecha.Text = string.Empty;
            DateTime fecha = Convert.ToDateTime(txtFechaTurno.Text);

            if ((int)fecha.DayOfWeek != Convert.ToInt32(ddlDia.SelectedValue))
            {
                string[] DiaDeSemana = { "lunes", "martes", "miercoles", "jueves", "viernes", "sabado" };
                lblValidacionFecha.ForeColor = System.Drawing.Color.Red;
                lblValidacionFecha.Text = "Esta eligiendo dias de turno " + DiaDeSemana[Convert.ToInt32(ddlDia.SelectedValue) - 1];
            }
           
        }
    }
}