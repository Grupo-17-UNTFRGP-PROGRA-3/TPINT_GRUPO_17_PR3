using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;
using Entidades;

namespace Vistas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        NegocioNacionalidad negocioNacionalidad = new NegocioNacionalidad();
        NegocioProvincia negocioProvincia = new NegocioProvincia();
        NegocioLocalidad negocioLocalidad = new NegocioLocalidad();

        protected void BuscarDNIDuranteModificacion()
        {
            NegocioPaciente negocioPaciente = new NegocioPaciente();

            bool existe = negocioPaciente.ExisteDNI(Convert.ToInt32(txtDNI.Text));

            if (existe)
            {
                lblInicio.Text = "El DNI ya se encuentra registrado.";

                pnlDatosPaciente.Visible = true;
                pnlDatosPaciente.Enabled = false;

            }
            else
            {
                lblInicio.Text = "";

                pnlDatosPaciente.Visible = true;
                pnlDatosPaciente.Enabled = true;
            }
        }

        protected void LimpiarCampos()
        {
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            rblSexo.ClearSelection();
            txtFechaNacimiento.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            ddlNacionalidad.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            Page.MaintainScrollPositionOnPostBack = true;

            lblMensaje.Text = string.Empty;

            if (!IsPostBack)
            {

                if (Request.QueryString["dni"] != null)
                {
                    lblTitulo.Text = "Modificar Paciente";

                    BtnBuscarDni.Visible = false;

                    BtnVolver2.Visible = false;

                    pnlDatosPaciente.Visible = true;

                    int dni = int.Parse(Request.QueryString["dni"]);
                    CargarDatosPaciente(dni);

                    txtDNI.Enabled = false;

                    btnIngresar.Text = "Modificar";
                    btnLimpiarCampos.Text = "Restaurar datos";
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

                cargarLocalidades();
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarLocalidades();
        }

        private void CargarDatosPaciente(int dni)
        {
            NegocioPaciente negocio = new NegocioPaciente();
            Paciente paciente = negocio.ObtenerPacientePorDNI(dni);

            if (paciente != null)
            {
                txtDNI.Text = dni.ToString();
                txtNombre.Text = paciente._Nombre;
                txtApellido.Text = paciente._Apellido;

                if (paciente._Sexo)
                {
                    rblSexo.SelectedValue = "femenino";
                }
                else
                {
                    rblSexo.SelectedValue = "masculino";
                }

                txtFechaNacimiento.Text = paciente._FechaNacimiento.ToString("yyyy-MM-dd");
                //txtFechaNacimiento.Text = "YYYY-MM-DD";
                txtDireccion.Text = paciente._Direccion.ToString();
                txtEmail.Text = paciente._Email;
                txtTelefono.Text = paciente._Telefono;
                ddlNacionalidad.SelectedIndex = paciente._IdNacionalidad - 1;
                ddlProvincia.SelectedValue = paciente._IdProvincia.ToString();
                ddlLocalidad.SelectedValue = paciente._IdLocalidad.ToString();

            }
        }

        protected void BtnBuscarDni_Click(object sender, EventArgs e)
        {

            NegocioPaciente negocioPaciente = new NegocioPaciente();
            bool existe = negocioPaciente.ExisteDNI(Convert.ToInt32(txtDNI.Text));
            int eliminado = negocioPaciente.ChequearEliminado(Convert.ToInt32(txtDNI.Text));

            if (existe)
            {
                if (eliminado == 1) // EXISTE Y ESTA ELIMINADO
                {
                    lblInicio.Text = "El paciente se encuentra eliminado. ¿Desea restaurarlo?";

                    txtDNI.Visible = true;
                    txtDNI.Enabled = false;

                    pnlDatosPaciente.Visible = false;
                    pnlDatosPaciente.Enabled = false;

                    BtnBuscarDni.Visible = false;
                    BtnBuscarDni.Enabled = false;

                    BtnVolver2.Visible = false;
                    BtnVolver2.Enabled = false;

                    btnConfirmarRestaurar.Visible = true;
                    btnConfirmarRestaurar.Enabled = true;

                    btnCancelarRestaurar.Visible = true;
                    btnCancelarRestaurar.Enabled = true;
                }
                else // EXISTE Y NO ESTA ELIMINADO
                {
                    lblInicio.Text = "El DNI ya se encuentra registrado.";
                    pnlDatosPaciente.Visible = false;

                    btnConfirmarRestaurar.Visible = false;
                    btnConfirmarRestaurar.Enabled = false;

                    btnCancelarRestaurar.Visible = false;
                    btnCancelarRestaurar.Enabled = false;
                }
            }
            else // NO EXISTE
            {
                lblInicio.Text = "";

                pnlDatosPaciente.Visible = true;
                pnlDatosPaciente.Enabled = true;

                BtnBuscarDni.Visible = false;
                BtnBuscarDni.Enabled = false;

                BtnVolver2.Visible = false;
                BtnVolver2.Enabled = false;

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
            if (Request.QueryString["dni"] != null)
            {
                int dni = Convert.ToInt32(Request.QueryString["dni"]);

                CargarDatosPaciente(dni);
            }
            else
            {
                LimpiarCampos();
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            NegocioPaciente negocioPaciente = new NegocioPaciente();

            Paciente paciente = new Paciente()
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
            };

            if (Request.QueryString["dni"] == null)
            {
                if (negocioPaciente.AgregarPaciente(paciente))
                {
                    lblMensaje.Text = "El paciente se ha agregado con éxito";
                    lblMensaje.ForeColor = Color.Green;
                }
            }
            else
            {
                int dni = int.Parse(Request.QueryString["dni"]);
                paciente._DNI = dni;
                negocioPaciente.ModificarPaciente(paciente);
                lblMensaje.Text = "El paciente se ha Modificado con éxito";
                lblMensaje.ForeColor = Color.Green;
            }

            pnlDatosPaciente.Visible = false;
            pnlDatosPaciente.Enabled = false;

            btnModificarDNI.Visible = false;
            btnModificarDNI.Enabled = false;

            btnIngresar.Visible = false;
            btnIngresar.Enabled = false;

            txtDNI.Visible = true;
            txtDNI.Enabled = true;
            txtDNI.Text = string.Empty;

            BtnBuscarDni.Visible = true;
            BtnBuscarDni.Enabled = true;

            BtnVolver2.Visible = true;
            BtnVolver2.Enabled = true;

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

        protected void btnModificarDNI_Click(object sender, EventArgs e)
        {
            Session["dniPreModificacion"] = txtDNI.Text;

            txtDNI.Visible = true;
            txtDNI.Enabled = true;

            pnlDatosPaciente.Visible = true;
            pnlDatosPaciente.Enabled = false;

            btnModificarDNI.Visible = false;
            btnModificarDNI.Enabled = false;

            btnAceptarDNI.Visible = true;
            btnAceptarDNI.Enabled = true;

            btnCancelarDNI.Visible = true;
            btnCancelarDNI.Enabled = true;
        }

        protected void btnAceptarDNI_Click(object sender, EventArgs e)
        {
            txtDNI.Visible = true;
            txtDNI.Enabled = false;

            btnAceptarDNI.Visible = false;
            btnAceptarDNI.Enabled = false;

            btnCancelarDNI.Visible = false;
            btnCancelarDNI.Enabled = false;

            btnModificarDNI.Visible = true;
            btnModificarDNI.Enabled = true;

            BuscarDNIDuranteModificacion();
        }

        protected void btnCancelarDNI_Click(object sender, EventArgs e)
        {
            if (Session["dniPreModificacion"] != null)
            {
                txtDNI.Text = Session["dniPreModificacion"].ToString();
            }

            txtDNI.Enabled = false;

            BtnBuscarDni.Visible = false;
            BtnBuscarDni.Enabled = false;

            btnAceptarDNI.Visible = false;
            btnAceptarDNI.Enabled = false;

            btnCancelarDNI.Visible = false;
            btnCancelarDNI.Enabled = false;

            btnModificarDNI.Visible = true;
            btnModificarDNI.Enabled = true;

            BuscarDNIDuranteModificacion();
        }

        protected void btnConfirmarRestaurar_Click(object sender, EventArgs e)
        {
            NegocioPaciente negocioPaciente = new NegocioPaciente();
            int dni = int.Parse(txtDNI.Text);

            bool resultado = negocioPaciente.RestaurarPacienteEliminado(dni);

            lblInicio.Text = "Paciente restaurado.";

            txtDNI.Visible = true;
            txtDNI.Enabled = false;

            pnlDatosPaciente.Visible = false;
            pnlDatosPaciente.Enabled = false;

            btnConfirmarRestaurar.Visible = false;
            btnConfirmarRestaurar.Enabled = false;

            btnCancelarRestaurar.Visible = false;
            btnCancelarRestaurar.Enabled = false;

            BtnVolver2.Visible = true;
            BtnVolver2.Enabled = true;
        }

        protected void btnCancelarRestaurar_Click(object sender, EventArgs e)
        {
            txtDNI.Text = string.Empty;
            lblInicio.Text = string.Empty;

            txtDNI.Visible = true;
            txtDNI.Enabled = true;

            btnConfirmarRestaurar.Visible = false;
            btnConfirmarRestaurar.Enabled = false;

            btnCancelarRestaurar.Visible = false;
            btnCancelarRestaurar.Enabled = false;

            BtnBuscarDni.Visible = true;
            BtnBuscarDni.Enabled = true;

            BtnVolver2.Visible = true;
            BtnVolver2.Enabled = true;
        }
    }
}