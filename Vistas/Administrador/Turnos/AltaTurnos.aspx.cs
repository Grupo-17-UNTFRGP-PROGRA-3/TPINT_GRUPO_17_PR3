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
            txtFechaTurno.Text = string.Empty;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNombrePaciente.Visible = false;
                btnAgregarPaciente.Visible = false;
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                Page.MaintainScrollPositionOnPostBack = true;
                // CARGA ESPECIALIDADES
                NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
                DataTable tablaEspecialidades = new DataTable();

                tablaEspecialidades = negocioEspecialidad.GetTable();

                ddlEspecialidad.DataSource = tablaEspecialidades;
                ddlEspecialidad.DataTextField = "Descripcion";
                ddlEspecialidad.DataValueField = "Id";
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccione Especialidad --", "0"));
            }
        }



        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMedico.Items.Count != 0)
            {
                ddlMedico.Items.Clear();
                ddlDia.Items.Clear();
                ddlHorario.Items.Clear();
                txtFechaTurno.Text = string.Empty;
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
                txtFechaTurno.Text = string.Empty;
            }
            string legajo = ddlMedico.SelectedValue;

            CargarDias(legajo);
        }

        protected void ddlDia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlHorario.Items.Count != 0)
            {
                ddlHorario.Items.Clear();
                txtFechaTurno.Text = string.Empty;
            }
            int Legajo = int.Parse(ddlMedico.SelectedValue);
            int Dia = int.Parse(ddlDia.SelectedValue);

            CargarHoras(Legajo, Dia);
            // logica para cambiar los horarios en funcion del dia
        }

        protected void btnAsignarTurno_Click1(object sender, EventArgs e)
        {
          
            Turno nuevoTurno = new Turno
            {
                _LegajoMedico = int.Parse(ddlMedico.SelectedValue),
                _DniPaciente = txtDNI.Text,
                _Fecha = DateTime.Parse(txtFechaTurno.Text),
                _IdHorario = int.Parse(ddlHorario.SelectedValue),
                _Estado = "Pendiente",
                _Observacion = ""
            };

            NegocioTurno negocioTurno = new NegocioTurno();
            if (negocioTurno.agregarTurno(nuevoTurno))
            {
                Response.Redirect("ListaTurnos.aspx");
            }
            else
            {
                lblInicio.Text = "Error al asignar el turno.";
            }
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

        protected void BtnBuscarDni_Click(object sender, EventArgs e)
        {
            int dni = int.Parse(txtDNI.Text);
            NegocioPaciente negocioPaciente = new NegocioPaciente();
            Paciente paciente = negocioPaciente.traerPaciente(dni);

            if (negocioPaciente.ExisteDNI(dni))
            {
                lblDNI.Text = "PACIENTE:";
                txtDNI.Visible = false;
                txtNombrePaciente.Visible = true;
                txtNombrePaciente.Text = paciente._Nombre + " " + paciente._Apellido;
            }
            else
            {
                lblInicio.Text = "paciente no encontrado";
                btnAgregarPaciente.Visible = true;
            }
        }

        protected void btnAgregarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Administrador/Pacientes/AltaPaciente.aspx");
        }
    }
}
