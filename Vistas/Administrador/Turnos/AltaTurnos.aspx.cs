using Clinica;
using Entidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Administrador
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //CARGA PRINCIPAL
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
                txtFechaTurno.Enabled = false;  
                pnlDatosPaciente.Visible = false;
                pnlDatosPaciente.Enabled = false;
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

                if (Session["MensajeExito"] != null)
                {
                    lblMensaje.ForeColor = Color.Green;
                    lblMensaje.Text = Session["MensajeExito"].ToString();
                }
            }
        }

        //CARGAS DATOS =======================
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

        protected void CargarHoras(int legajo, int dia, string fecha)
        {
            NegocioHorario horario = new NegocioHorario();

            DataTable TablaHoras = horario.ObtenerHorasHabilitadas(legajo, dia, fecha);

            ddlHorario.DataSource = TablaHoras;
            ddlHorario.DataTextField = "Horario";
            ddlHorario.DataValueField = "Id";
            ddlHorario.DataBind();
            ddlHorario.Items.Insert(0, new ListItem("-- Seleccione Hora --", "0"));
        }

        protected void LimpiarCampos()
        {
            pnlDatosPaciente.Visible = false;
            pnlDatosPaciente.Enabled = false;
            lblNombrePacienteDato.Text = string.Empty;
            lblApellidoPacienteDato.Text = string.Empty;
            lblDNIPacienteDato.Text = string.Empty;
            lblTelefonoPacienteDato.Text = string.Empty;
            lblCorreoPacienteDato.Text = string.Empty;
            ddlEspecialidad.SelectedIndex = 0;
            ddlMedico.Items.Clear();
            ddlDia.Items.Clear();
            txtFechaTurno.Enabled = false;
            ddlHorario.Items.Clear();
            txtFechaTurno.Text = string.Empty;
            lblMensaje.Text = string.Empty;
            lblValidacionFecha.Text = string.Empty;
        }
        
        protected bool ValidarFechaConDia()
        {
            if (ddlDia.SelectedValue != null && ddlDia.SelectedValue != "0" )
            {
                lblValidacionFecha.Text = string.Empty;
                DateTime fecha = Convert.ToDateTime(txtFechaTurno.Text);

                if ((int)fecha.DayOfWeek != Convert.ToInt32(ddlDia.SelectedValue))
                {
                    string[] DiaDeSemana = { "lunes", "martes", "miercoles", "jueves", "viernes", "sabado" };
                    lblValidacionFecha.ForeColor = System.Drawing.Color.Red;
                    lblValidacionFecha.Text = "Esta eligiendo dias de turno " + DiaDeSemana[Convert.ToInt32(ddlDia.SelectedValue) - 1];
                    return false;
                }
                else { return true; }
            }
            else
            {
                lblValidacionFecha.Text = "Debe seleccionar un dia primero";
                return false;
            }
        }

        //REACCIONES A LOS CAMBIOS ======================
        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMedico.Items.Count != 0)
            {
                ddlMedico.Items.Clear();
                ddlDia.Items.Clear();
                txtFechaTurno.Enabled = false;
                lblValidacionFecha.Text = string.Empty;
                ddlHorario.Items.Clear();
                txtFechaTurno.Text = string.Empty;
                lblMensaje.Text = string.Empty;
            }

            int idEspecialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);

            CargarMedicos(idEspecialidad);
        }

        protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDia.Items.Count != 0)
            {
                ddlDia.Items.Clear();
                txtFechaTurno.Enabled = false;
                ddlHorario.Items.Clear();
                lblValidacionFecha.Text = string.Empty;
                txtFechaTurno.Text = string.Empty;
                lblMensaje.Text = string.Empty;

            }
            string legajo = ddlMedico.SelectedValue;

            CargarDias(legajo);
        }

        protected void ddlDia_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtFechaTurno.Text = string.Empty;
            lblMensaje.Text = string.Empty;
            txtFechaTurno.Enabled = true;
            lblValidacionFecha.Text = string.Empty;
        }

        protected void btnAsignarTurno_Click1(object sender, EventArgs e)
        {
            Turno nuevoTurno = new Turno
            {
                _LegajoMedico = int.Parse(ddlMedico.SelectedValue),
                _DniPaciente = lblDNIPacienteDato.Text,
                _Fecha = DateTime.Parse(txtFechaTurno.Text),
                _IdHorario = int.Parse(ddlHorario.SelectedValue),
                _Estado = "Pendiente",
                _Observacion = ""
            };

            NegocioTurno negocioTurno = new NegocioTurno();

            bool turnoExiste = negocioTurno.existeTurno(nuevoTurno);

            if (turnoExiste)
            {
                lblMensaje.Text = "Error: ya hay un turno para ese medico en esa fecha y horario";
            }
            else
            {
                if (negocioTurno.agregarTurno(nuevoTurno))
                {
                    Session["MensajeExito"] = "Turno agregado con éxito.";
                    Response.Redirect("~/Administrador/Turnos/AltaTurnos.aspx");
                }
                else
                {
                    lblMensaje.Text = "Error al asignar el turno. Contacte a su programador más cercano.";
                }
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
            if (txtFechaTurno.Text != string.Empty) { ValidarFechaConDia();}

            int Legajo = int.Parse(ddlMedico.SelectedValue);
            int Dia = int.Parse(ddlDia.SelectedValue);
            string Fecha = txtFechaTurno.Text;

            if (ValidarFechaConDia()){ CargarHoras(Legajo, Dia, Fecha); }
            else { ddlHorario.Items.Clear();  }
        }

        protected void BtnBuscarDni_Click(object sender, EventArgs e)
        { 
            lblMensaje.Text = string.Empty;
            LimpiarCampos();
            int dni = int.Parse(txtDNI.Text);

            NegocioPaciente negocioPaciente = new NegocioPaciente();
            Paciente paciente = negocioPaciente.traerPaciente(dni);

            if (negocioPaciente.ExisteDNI(dni))
            {
                txtDNI.Text = string.Empty;
                lblInicio.Text = string.Empty;
                btnAgregarPaciente.Visible = false;
                pnlDatosPaciente.Visible = true;
                pnlDatosPaciente.Enabled = true;
                lblNombrePacienteDato.Text = paciente._Nombre;
                lblApellidoPacienteDato.Text = paciente._Apellido;
                lblDNIPacienteDato.Text = paciente._DNI.ToString();
                lblTelefonoPacienteDato.Text = paciente._Telefono;
                lblCorreoPacienteDato.Text = paciente._Email;
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
