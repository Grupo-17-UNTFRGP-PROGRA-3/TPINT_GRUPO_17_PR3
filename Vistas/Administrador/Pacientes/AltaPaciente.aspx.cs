using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            lblMensaje.Text = string.Empty;

            if (!IsPostBack)
            {

                if (Request.QueryString["dni"] != null)
                {
                    BtnBuscarDni.Visible = false;
                    BtnVolver2.Visible = false;
                    pnlDatosPaciente.Visible = true;
                    int dni = int.Parse(Request.QueryString["dni"]);
                    CargarDatosPaciente(dni);
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
        protected void LimpiarCampos()
        {
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            rblSexo.ClearSelection();
            txtAnio.Text = string.Empty;
            txtMes.Text = string.Empty;
            txtDia.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            ddlNacionalidad.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
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
                string FechaNac = paciente._FechaNacimiento;
                DateTime fecha;
                DateTime.TryParse(FechaNac, out fecha);
                txtAnio.Text = fecha.Year.ToString();
                txtMes.Text = fecha.Month.ToString();
                txtDia.Text = fecha.Day.ToString();
                txtDireccion.Text = paciente._Direccion;
                txtEmail.Text = paciente._Email;
                txtTelefono.Text = paciente._Telefono;
                ddlNacionalidad.SelectedIndex = paciente._IdNacionalidad-1;
                ddlProvincia.SelectedValue = paciente._IdProvincia.ToString();
                ddlLocalidad.SelectedValue = paciente._IdLocalidad.ToString();

            }
        }


        protected void BtnBuscarDni_Click(object sender, EventArgs e)
        {
            int dni;

            if (!int.TryParse(txtDNI.Text, out dni))
            {
                lblInicio.Text = "Ingrese un DNI válido.";
                pnlDatosPaciente.Visible = false;
                return;
            }

            NegocioPaciente negocioPaciente = new NegocioPaciente();
            bool existe = negocioPaciente.ExisteDNI(dni);

            if (existe)
            {
                lblInicio.Text = "El DNI ya se encuentra registrado.";
                pnlDatosPaciente.Visible = false;
            }
            else
            {
                lblInicio.Text = "";
                pnlDatosPaciente.Visible = true;
                BtnBuscarDni.Visible = false;
                BtnVolver2.Visible = false;
                LimpiarCampos();
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }

        protected void btnLimpiarCampos_Click(object sender, EventArgs e)
        {
            txtDNI.Text = string.Empty;
            LimpiarCampos();
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
           
                bool sexo = false;
                if (rblSexo.SelectedValue == "femenino")
                {
                    sexo = true;
                }

                string fechanac = txtAnio.Text + "/" + txtMes.Text + "/" + txtDia.Text;
                string direccion = txtDireccion.Text;
                int idNac = int.Parse(ddlNacionalidad.SelectedValue);
                int idProv = int.Parse(ddlProvincia.SelectedValue);
                int idLoc = int.Parse(ddlLocalidad.SelectedValue);
                NegocioPaciente negocioPaciente = new NegocioPaciente();
            if ((Request.QueryString["dni"] == null))
            {
                if (negocioPaciente.AgregarPaciente(int.Parse(txtDNI.Text), txtNombre.Text, txtApellido.Text, sexo, idNac, fechanac, direccion, txtEmail.Text, txtTelefono.Text, idProv, idLoc, false))
                {
                    lblMensaje.Text = "El paciente se ha agregado con éxito";
                    lblMensaje.ForeColor = Color.Green;
                    LimpiarCampos();
                    Response.Redirect("~/Administrador/Pacientes/ListadoPaciente.aspx");
                }
            }
            else {
                int dni = int.Parse(Request.QueryString["dni"]);
                negocioPaciente.ModificarPaciente(dni, txtNombre.Text, txtApellido.Text, sexo, idNac, fechanac, direccion, txtEmail.Text, txtTelefono.Text, idProv, idLoc, false);
                lblMensaje.Text = "El paciente se ha Modificado con éxito";
                lblMensaje.ForeColor = Color.Green;
                LimpiarCampos();
                Response.Redirect("~/Administrador/Pacientes/ListadoPaciente.aspx");
            }

        } 

        protected void txtDNI_TextChanged(object sender, EventArgs e)
        {
            this.Page_Load(sender, e);
            pnlDatosPaciente.Visible = false;
            BtnBuscarDni.Visible = true;
            BtnVolver2.Visible = true;
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


    }
}