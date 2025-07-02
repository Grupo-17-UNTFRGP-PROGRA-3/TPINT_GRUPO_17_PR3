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

                    BtnBuscarLegajo.Visible = false;
                    
                    BtnVolver2.Visible = false;
                    
                    string legajo = Request.QueryString["legajo"].ToString();
                    
                    txtLegajo.Text = legajo.ToString();
                    
                    CargarDatosMedico(legajo);
                    
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
        
        protected void BtnBuscarLegajo_Click(object sender, EventArgs e)
        {
            NegocioMedico negocioMedico = new NegocioMedico();
            string legajo = txtLegajo.Text.ToString();
            int eliminado = negocioMedico.ChequearEliminado(legajo);

            if (negocioMedico.ExisteLegajo(legajo))
            {
                if (eliminado == 1) // EXISTE Y ESTA ELIMINADO
                {
                    lblInicio.Text = "El médico se encuentra eliminado. ¿Desea restaurarlo?";

                    pnlDatosMedico.Visible = false;
                    pnlDatosMedico.Enabled = false;

                    BtnBuscarLegajo.Visible = false;
                    BtnBuscarLegajo.Enabled = false;

                    BtnVolver2.Visible = false;
                    BtnVolver2.Enabled = false;

                    btnConfirmarRestaurar.Visible = true;
                    btnConfirmarRestaurar.Enabled = true;

                    btnCancelarRestaurar.Visible = true;
                    btnCancelarRestaurar.Enabled = true;
                }
                else // EXISTE Y NO ESTA ELIMINADO
                {
                    lblInicio.Text = "El legajo ya se encuentra registrado.";

                    pnlDatosMedico.Visible = false;
                    pnlDatosMedico.Enabled = false;

                    btnConfirmarRestaurar.Visible = false;
                    btnConfirmarRestaurar.Enabled = false;

                    btnCancelarRestaurar.Visible = false;
                    btnCancelarRestaurar.Enabled = false;
                }
            }
            else // NO EXISTE 
            {
                lblInicio.Text = string.Empty;

                txtLegajo.Enabled = false;

                BtnBuscarLegajo.Visible = false;
                BtnBuscarLegajo.Enabled = false;

                BtnVolver2.Visible = false;
                BtnVolver2.Enabled = false;

                pnlDatosMedico.Visible = true;
                pnlDatosMedico.Enabled = true;

                btnModificarLegajo.Visible = true;
                btnModificarLegajo.Enabled = true;
            }
        }
        
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }
        
        protected void btnLimpiarCampos_Click(object sender, EventArgs e)
        {
            txtLegajo.Text = string.Empty;
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
                _Legajo = txtLegajo.Text,
                _IdEspecialidad = int.Parse(ddlEspecialidad.SelectedValue),
                _Horarios = new List<HorarioMedico>()
            };

            foreach (ListItem dia in cblDiasAtencion.Items)
            {
                //RECORRE TODOS LOS DÍAS DE LA SEMANA
                medico._Horarios.Add(new HorarioMedico
                {
                    _IdDia = int.Parse(dia.Value),
                    _Legajo = txtLegajo.Text,
                    _HoraInicio = ddlHoraInicio.SelectedValue,
                    _HoraFin = ddlHoraFin.SelectedValue,
                    _Eliminado = dia.Selected ? false : true //SI ESTÁ SELECCIONADO, ELIMINADO = FALSE, SINO TRUE
                });
            }

            if (Request.QueryString["legajo"] == null)
            {
                if (negocioMedico.AgregarMedico(medico))
                {
                    lblMensaje.Text = "El médico se ha agregado con éxito";
                    lblMensaje.ForeColor = Color.Green;

                    LimpiarCampos();
                    txtLegajo.Text = string.Empty;
                }
            }
            else
            {
                if (negocioMedico.ModificarMedico(medico))
                {
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

        protected void CargarDatosMedico(string legajo)
        {
            Entidades.Medico medico = negocioMedico.ObtenerMedicoPorLegajo(legajo);
            List<HorarioMedico> listaHorarios = negocioMedico.ObtenerHorariosMedicoPorLegajo(legajo);

            if (medico != null)
            {
                txtLegajo.Text = legajo.ToString();
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

                foreach (ListItem dia in cblDiasAtencion.Items)
                {
                    int idDia = int.Parse(dia.Value); //VALUE DEL CHECKBOX (1: Lunes, 2: Martes, etc.)

                    HorarioMedico horario = listaHorarios.FirstOrDefault(h => h._IdDia == idDia); //BUSCAR EL HORARIO DEL MEDICO PARA ESE DÍA

                    if (horario != null)
                    {
                        dia.Selected = horario._Eliminado == false; //SI EL HORARIO NO ESTÁ ELIMINADO, SELECCIONAR EL CHECKBOX
                    }
                }

                ddlHoraInicio.SelectedValue = listaHorarios[0]._HoraInicio; //HASTA MANEJAR DISTINTOS HORARIOS POR DÍA, SE ASIGNA EL HORARIO DEL PRIMER DÍA
                ddlHoraFin.SelectedValue = listaHorarios[0]._HoraFin;
            }
        }

        protected void txtDNI_TextChanged(object sender, EventArgs e)
        {
            NegocioMedico negocioMedico = new NegocioMedico();

            if (negocioMedico.ExisteDNI(Convert.ToInt32(txtDNI.Text)))
            {
                lblDNIMedico.Text = "El medico ya se encuentra registrado con otro legajo";
            }
            else
            {
                lblDNIMedico.Text = "";
            }
        }

        protected void btnModificarLegajo_Click(object sender, EventArgs e)
        {
            Session["legajoPreModificacion"] = txtLegajo.Text;

            txtLegajo.Enabled = true;

            pnlDatosMedico.Enabled = false;

            btnModificarLegajo.Visible = false;
            btnModificarLegajo.Enabled = false;

            btnAceptarLegajo.Visible = true;
            btnAceptarLegajo.Enabled = true;

            btnCancelarLegajo.Visible = true;
            btnCancelarLegajo.Enabled = true;
        }

        protected void btnAceptarLegajo_Click(object sender, EventArgs e)
        {
            txtLegajo.Enabled = false;

            btnAceptarLegajo.Visible = false;
            btnAceptarLegajo.Enabled = false;

            btnCancelarLegajo.Visible = false;
            btnCancelarLegajo.Enabled = false;

            /*
            tengo que armar otra funcion distinta
            
            BtnBuscarLegajo_Click(sender, e); 
            */

            NegocioMedico negocioMedico = new NegocioMedico();

            bool existe = negocioMedico.ExisteLegajo(txtLegajo.Text);

            if (existe)
            {
                lblInicio.Text = "El legajo ya se encuentra registrado.";

                txtLegajo.Visible = true;
                txtLegajo.Enabled = false;

                pnlDatosMedico.Visible = true;
                pnlDatosMedico.Enabled = false;

                btnAceptarLegajo.Visible = false;
                btnAceptarLegajo.Enabled = false;

                btnCancelarLegajo.Visible = false;
                btnCancelarLegajo.Enabled = false;

                btnModificarLegajo.Visible = true;
                btnModificarLegajo.Enabled = true;
            }
            else
            {
                lblInicio.Text = "";
                
                txtLegajo.Visible = true;
                txtLegajo.Enabled = false;

                pnlDatosMedico.Visible = true;
                pnlDatosMedico.Enabled = true;

                btnAceptarLegajo.Visible = false;
                btnAceptarLegajo.Enabled = false;

                btnCancelarLegajo.Visible = false;
                btnCancelarLegajo.Enabled = false;

                btnModificarLegajo.Visible = true;
                btnModificarLegajo.Enabled = true;
            }
        }

        protected void btnCancelarLegajo_Click(object sender, EventArgs e)
        {
            if (Session["legajoPreModificacion"] != null)
            {
                txtLegajo.Text = Session["legajoPreModificacion"].ToString();
            }

            txtLegajo.Enabled = false;

            BtnBuscarLegajo.Visible = false;
            BtnBuscarLegajo.Enabled = false;

            btnAceptarLegajo.Visible = false;
            btnAceptarLegajo.Enabled = false;

            btnCancelarLegajo.Visible = false;

            btnModificarLegajo.Visible = true;
            btnModificarLegajo.Enabled = true;

            pnlDatosMedico.Enabled = true;
        }

        protected void btnConfirmarRestaurar_Click(object sender, EventArgs e)
        {
            NegocioMedico negocioMedico = new NegocioMedico();

            string legajo = txtLegajo.Text;

            bool resultado = negocioMedico.RestaurarMedicoEliminado(legajo);

            lblInicio.Text = "Médico restaurado.";
            pnlDatosMedico.Visible = false;
            btnConfirmarRestaurar.Visible = false;
            btnConfirmarRestaurar.Enabled = false;
            btnCancelarRestaurar.Visible = false;
            btnCancelarRestaurar.Enabled = false;
        }

        protected void btnCancelarRestaurar_Click(object sender, EventArgs e)
        {
            txtDNI.Text = string.Empty;
            lblInicio.Text = string.Empty;

            BtnBuscarLegajo.Visible = true;
            BtnBuscarLegajo.Enabled = true;
            BtnVolver2.Visible = true;
            BtnVolver2.Enabled = true;
            btnConfirmarRestaurar.Visible = false;
            btnConfirmarRestaurar.Enabled = false;
            btnCancelarRestaurar.Visible = false;
            btnCancelarRestaurar.Enabled = false;
        }
    }
}