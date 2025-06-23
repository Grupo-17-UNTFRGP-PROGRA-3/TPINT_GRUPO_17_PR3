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

namespace Vistas
{
    public partial class AltaMedico : System.Web.UI.Page
    {
        NegocioNacionalidad negocioNacionalidad = new NegocioNacionalidad();
        NegocioProvincia negocioProvincia = new NegocioProvincia();
        NegocioLocalidad negocioLocalidad = new NegocioLocalidad();
        NegocioHorarioMedico negocioHorarioMedico = new NegocioHorarioMedico();
        NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


            lblMensaje.Text = string.Empty;

            if (!IsPostBack)
            {
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
            txtAnio.Text = string.Empty;
            txtMes.Text = string.Empty;
            txtDia.Text = string.Empty;
            txtCalle.Text = string.Empty;
            txtAltura.Text = string.Empty;
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

            if (negocioMedico.ExisteLegajo(legajo))
            {
                lblInicio.Text = "El Legajo ya se encuentra registrado.";
                pnlDatosMedico.Visible = false;
            }
            else
            {
                lblInicio.Text = "";
                pnlDatosMedico.Visible = true;
                BtnBuscarLegajo.Visible = false;
                BtnVolver2.Visible = false;
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
            bool sexo = false;
            if (rblSexo.SelectedValue == "femenino")
            {
                sexo = true;
            }

            string fechanac = txtAnio.Text + "/" + txtMes.Text + "/" + txtDia.Text;
            string direccion = txtCalle.Text + " " + txtAltura.Text;
            int idNac = int.Parse(ddlNacionalidad.SelectedValue);
            int idProv = int.Parse(ddlProvincia.SelectedValue);
            int idLoc = int.Parse(ddlLocalidad.SelectedValue);
            int idEsp = int.Parse(ddlEspecialidad.SelectedValue);
            NegocioMedico negocioMedico = new NegocioMedico();
            NegocioHorarioMedico negocioHorarioMedico = new NegocioHorarioMedico();

            if (negocioMedico.AgregarMedico(int.Parse(txtDNI.Text), txtNombre.Text, txtApellido.Text, sexo, idNac, fechanac, direccion, txtEmail.Text, txtTelefono.Text, idProv, idLoc, false, int.Parse(txtLegajo.Text), idEsp))
            {
                lblMensaje.Text = "El médico se ha agregado con éxito";
                lblMensaje.ForeColor = Color.Green;
                

                foreach (ListItem item in cblDiasAtencion.Items)
                {               
                    if (item.Selected)
                    {
                        int idDia = int.Parse(item.Value);
                        int Legajo = int.Parse(txtLegajo.Text);
                        string HoraInicio = ddlHoraInicio.SelectedValue.ToString();
                        string HoraFin = ddlHoraFin.SelectedValue.ToString();
                        
                        negocioHorarioMedico.AgregarHorarioMedico(idDia, Legajo, HoraInicio, HoraFin);
                    }
                }

                LimpiarCampos();
            }
        }
        protected void txtLegajo_TextChanged(object sender, EventArgs e)
        {
            this.Page_Load(sender, e);
            pnlDatosMedico.Visible = false;
            BtnBuscarLegajo.Visible = true;
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