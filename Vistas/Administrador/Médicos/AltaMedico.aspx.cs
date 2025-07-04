using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;
using Entidades;

namespace Vistas
{
    public partial class AltaMedico : System.Web.UI.Page
    {
        NegocioNacionalidad negocioNacionalidad = new NegocioNacionalidad();
        NegocioProvincia negocioProvincia = new NegocioProvincia();
        NegocioLocalidad negocioLocalidad = new NegocioLocalidad();
        NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
        private readonly NegocioHorarioMedico negocioHorarioMedico = new NegocioHorarioMedico();
        private readonly NegocioMedico negocioMedico = new NegocioMedico();

        public void LimpiarCampos()
        {
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtDNI.Text = string.Empty;
            rblSexo.ClearSelection();
            ddlNacionalidad.SelectedIndex = 0;
            txtFechaNacimiento.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            ddlProvincia.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            ddlEspecialidad.SelectedIndex = 0;
            cblDiasAtencion.ClearSelection();
            ddlHoraInicio.SelectedIndex = 0;
            ddlHoraFin.SelectedIndex = 0;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lblMensaje.Text = string.Empty;

            if (!IsPostBack)
            {
                if (Request.QueryString["legajo"] != null)
                {
                    lblTitulo.Text = "Modificar Medico";

                    pnlDatosMedico.Visible = true;
                    pnlDatosMedico.Enabled = true;

                    BtnBuscarDNI.Visible = false;
                    
                    BtnVolver2.Visible = false;
                    
                    int legajo = int.Parse(Request.QueryString["legajo"].ToString());
                                                            
                    CargarDatosMedico(legajo);

                    txtDNI.Enabled = false;
                    
                    btnIngresar.Text = "MODIFICAR";
                }

                DataTable tablaNacionalidades = negocioNacionalidad.GetTable();
                ddlNacionalidad.DataTextField = "Descripcion";
                ddlNacionalidad.DataValueField = "Id";
                ddlNacionalidad.DataSource = tablaNacionalidades;
                ddlNacionalidad.DataBind();
                ddlNacionalidad.Items.Insert(0, new ListItem("--Seleccionar--", ""));

                DataTable tablaProvincias = negocioProvincia.GetTable();
                ddlProvincia.DataTextField = "Descripcion";
                ddlProvincia.DataValueField = "Id";
                ddlProvincia.DataSource = tablaProvincias;
                ddlProvincia.DataBind();
                ddlProvincia.Items.Insert(0, new ListItem("--Seleccionar--", ""));

                DataTable tablaEspecialidades = negocioEspecialidad.GetTable();
                ddlEspecialidad.DataTextField = "Descripcion";
                ddlEspecialidad.DataValueField = "Id";
                ddlEspecialidad.DataSource = tablaEspecialidades;
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, new ListItem("--Seleccionar--", ""));

                cargarLocalidades();
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarLocalidades();
        }
        
        protected void BtnBuscarDNI_Click(object sender, EventArgs e)
        {
            NegocioMedico negocioMedico = new NegocioMedico();
            string dni = txtDNI.Text.ToString();
            int eliminado = negocioMedico.ChequearEliminado(dni);

            if (negocioMedico.ExisteDNIMedico(int.Parse(dni)))
            {
                if (eliminado == 1) // EXISTE Y ESTA ELIMINADO
                {
                    lblInicio.Text = "El médico se encuentra eliminado. ¿Desea restaurarlo?";

                    pnlDatosMedico.Visible = false;
                    pnlDatosMedico.Enabled = false;

                    BtnBuscarDNI.Visible = false;
                    BtnBuscarDNI.Enabled = false;

                    BtnVolver2.Visible = false;
                    BtnVolver2.Enabled = false;

                }
                else // EXISTE Y NO ESTA ELIMINADO
                {
                    lblInicio.Text = "El dni ya se encuentra registrado.";

                    pnlDatosMedico.Visible = false;
                    pnlDatosMedico.Enabled = false;

                }
            }
            else // NO EXISTE 
            {
                lblInicio.Text = string.Empty;

                BtnBuscarDNI.Visible = false;
                BtnBuscarDNI.Enabled = false;

                BtnVolver2.Visible = false;
                BtnVolver2.Enabled = false;

                pnlDatosMedico.Visible = true;
                pnlDatosMedico.Enabled = true;

                txtDNI.Enabled = false;

                btnModificarDNI.Visible = true;
                btnModificarDNI.Enabled = true;
            }
        }
        
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }
        
        protected void btnLimpiarCampos_Click(object sender, EventArgs e)
        {
            LimpiarCampos();
        }
        
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            
            Entidades.Medico medico = new Entidades.Medico()
            {
                _DNI = int.Parse(txtDNI.Text),
                _Nombre = txtNombre.Text,
                _Apellido = txtApellido.Text,
                _Sexo = rblSexo.SelectedValue == "femenino", //SI ESTÁ SELECCIONADO FEMENINO, TRUE, SINO FALSE
                _IdNacionalidad = int.Parse(ddlNacionalidad.SelectedValue),
                _FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text),
                _Direccion = txtDireccion.Text,
                _Email = txtEmail.Text,
                _Telefono = txtTelefono.Text,
                _IdProvincia = int.Parse(ddlProvincia.SelectedValue),
                _IdLocalidad = int.Parse(ddlLocalidad.SelectedValue),
                _Eliminado = false,
                _IdEspecialidad = int.Parse(ddlEspecialidad.SelectedValue),
                _Legajo = negocioMedico.ObtenerLegajoPorDNI(txtDNI.Text.ToString()),
            };

            if (Request.QueryString["legajo"] == null)
            {
                if (negocioMedico.AgregarMedico(medico))
                {
                    NegocioHorarioMedico negocioHorarioMedico = new NegocioHorarioMedico();

                    foreach (ListItem dia in cblDiasAtencion.Items)
                    {
                        HorarioMedico horarioMedico = new HorarioMedico();

                        horarioMedico._IdDia = int.Parse(dia.Value);
                        horarioMedico._Legajo = negocioMedico.ObtenerLegajoPorDNI(txtDNI.Text.ToString());
                        horarioMedico._HoraInicio = ddlHoraInicio.SelectedValue;
                        horarioMedico._HoraFin = ddlHoraFin.SelectedValue;
                        horarioMedico._Eliminado = dia.Selected ? false : true; //SI ESTÁ SELECCIONADO, ELIMINADO = FALSE, SINO TRUE

                        negocioHorarioMedico.AgregarHorarioMedico(horarioMedico);
                    }

                    Usuario usuario = new Usuario(negocioMedico.ObtenerLegajoPorDNI(txtDNI.Text.ToString()).ToString() + txtApellido.Text.ToString(), "1234", negocioMedico.ObtenerLegajoPorDNI(txtDNI.Text.ToString()));
                    
                    NegocioUsuario negocioUsuario = new NegocioUsuario();
                    negocioUsuario.AgregarCuenta(usuario);
                    lblMensaje.Text = "El médico y usuario se han agregado con éxito";
                    lblMensaje.ForeColor = Color.Green;

                    LimpiarCampos();
                }
            }
            else
            {
                if (negocioMedico.ModificarMedico(medico))
                {
                    NegocioHorarioMedico negocioHorarioMedico = new NegocioHorarioMedico();

                    foreach (ListItem dia in cblDiasAtencion.Items)
                    {
                        HorarioMedico horarioMedico = new HorarioMedico();

                        horarioMedico._IdDia = int.Parse(dia.Value);
                        horarioMedico._Legajo = negocioMedico.ObtenerLegajoPorDNI(txtDNI.Text.ToString());
                        horarioMedico._HoraInicio = ddlHoraInicio.SelectedValue;
                        horarioMedico._HoraFin = ddlHoraFin.SelectedValue;
                        horarioMedico._Eliminado = dia.Selected ? false : true; //SI ESTÁ SELECCIONADO, ELIMINADO = FALSE, SINO TRUE

                        negocioHorarioMedico.ModificarHorarioMedico(horarioMedico);
                    }

                    lblMensaje.Text = "Registro médico modificado con éxito";
                    lblMensaje.ForeColor = Color.Green;
                }
            }

            LimpiarCampos();
        }

        protected void cargarLocalidades()
        {
            string idProvincia = ddlProvincia.SelectedValue;

            if (!string.IsNullOrEmpty(idProvincia))
            {
                DataTable tablaLocalidades = negocioLocalidad.GetTable(Convert.ToInt32(idProvincia));
                ddlLocalidad.DataTextField = "Descripcion";
                ddlLocalidad.DataValueField = "Id";
                ddlLocalidad.DataSource = tablaLocalidades;
                ddlLocalidad.DataBind();
                ddlLocalidad.Items.Insert(0, new ListItem("--Seleccionar--", ""));
            }
            else
            {
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Insert(0, new ListItem("--Seleccionar--", ""));
            }
        }

        protected void CargarDatosMedico(int legajo)
        {
            Entidades.Medico medico = negocioMedico.ObtenerMedicoPorLegajo(legajo);
            
            if (medico != null)
            {
                txtNombre.Text = medico._Nombre;
                txtApellido.Text = medico._Apellido;
                if (medico._Sexo)
                {
                    rblSexo.SelectedValue = "femenino";
                }
                else
                {
                    rblSexo.SelectedValue = "masculino";
                }
                txtDNI.Text = medico._DNI.ToString();
                txtFechaNacimiento.Text = medico._FechaNacimiento.ToString("yyyy-MM-dd");
                txtDireccion.Text = medico._Direccion.ToString();
                txtEmail.Text = medico._Email;
                txtTelefono.Text = medico._Telefono;
                ddlNacionalidad.SelectedIndex = medico._IdNacionalidad - 1;
                ddlProvincia.SelectedValue = medico._IdProvincia.ToString();
                ddlLocalidad.SelectedValue = medico._IdLocalidad.ToString();
                ddlEspecialidad.SelectedValue = medico._IdEspecialidad.ToString();

                NegocioHorarioMedico negocioHorarioMedico = new NegocioHorarioMedico();
                HorarioMedico horario = new HorarioMedico();

                foreach (ListItem dia in cblDiasAtencion.Items)
                {
                    int idDia = int.Parse(dia.Value); //VALUE DEL CHECKBOX (1: Lunes, 2: Martes, etc.)

                    horario = negocioHorarioMedico.ObtenerHorarioMedicoPorLegajoDia(medico._Legajo, idDia);

                    if (!horario._Eliminado)
                    {
                        dia.Selected = true;
                    }
                }

                ddlHoraInicio.SelectedValue = horario._HoraInicio; //HASTA MANEJAR DISTINTOS HORARIOS POR DÍA, SE ASIGNA EL HORARIO DEL ÚLTIMO DÍA
                ddlHoraFin.SelectedValue = horario._HoraFin;
            }
        }
        protected void btnModificarDNI_Click(object sender, EventArgs e)
        {
            pnlDatosMedico.Visible = false;
            pnlDatosMedico.Enabled = false;

            txtDNI.Visible = true;
            txtDNI.Enabled = true;

            btnModificarDNI.Visible = false;
            btnModificarDNI.Enabled = false;

            BtnBuscarDNI.Visible = true;
            BtnBuscarDNI.Enabled = true;
        }
    }
}