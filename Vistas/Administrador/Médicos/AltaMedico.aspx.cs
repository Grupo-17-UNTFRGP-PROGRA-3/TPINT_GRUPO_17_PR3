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
        NegocioHorario negocioHorario = new NegocioHorario();
        private readonly NegocioHorarioMedico negocioHorarioMedico = new NegocioHorarioMedico();
        private readonly NegocioMedico negocioMedico = new NegocioMedico();

        protected void FiltrarYCargarHorariosFin()
        {
            int idHoraInicio = Convert.ToInt32(ddlHoraInicio.SelectedValue);

            if (idHoraInicio == 0)
            {
                ddlHoraFin.Items.Clear();
                ddlHoraFin.Items.Insert(0, new ListItem("-- Seleccione Horario --", "0"));
            }

            DataTable tablaHorariosCompletos = new DataTable();
            tablaHorariosCompletos = negocioHorario.ObtenerTabla();
            DataTable tablaHorarioFin = tablaHorariosCompletos.Clone();

            foreach (DataRow fila in tablaHorariosCompletos.Rows)
            {
                int idHoraFin = Convert.ToInt32(fila["Id"]);

                if (idHoraFin > idHoraInicio)
                    tablaHorarioFin.ImportRow(fila);
            }

            ddlHoraFin.DataSource = tablaHorarioFin;
            ddlHoraFin.DataTextField = "Horario";
            ddlHoraFin.DataValueField = "Id";
            ddlHoraFin.DataBind();
            ddlHoraFin.Items.Insert(0, new ListItem("-- Seleccione Horario --", "0"));
        }

        public void LimpiarCampos()
        {
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
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

                DataTable tablaHorariosInicio = negocioHorario.ObtenerTabla();
                DataTable tablaEditada = tablaHorariosInicio.Copy();
                tablaEditada.Rows[tablaEditada.Rows.Count - 1].Delete();
                ddlHoraInicio.DataSource = tablaEditada;
                ddlHoraInicio.DataTextField = "Horario";
                ddlHoraInicio.DataValueField = "Id";
                ddlHoraInicio.DataBind();
                ddlHoraInicio.Items.Insert(0, new ListItem("-- Seleccione Horario --", "0"));

                if (Request.QueryString["legajo"] != null)
                {
                    lblTitulo.Text = "Modificar Medico";

                    pnlDatosMedico.Visible = true;
                    pnlDatosMedico.Enabled = true;

                    BtnBuscarDNI.Visible = false;

                    BtnVolver2.Visible = false;

                    int legajo = Convert.ToInt32(Request.QueryString["legajo"]);

                    CargarDatosMedico(legajo);

                    txtDNI.Enabled = false;

                    btnIngresar.Text = "Modificar";

                    btnLimpiarCampos.Text = "Restaurar datos";
                }
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarLocalidades();
        }

        protected void ddlHoraInicio_SelectedIndexChanged(object sender, EventArgs e)
        {
            FiltrarYCargarHorariosFin();
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

                btnIngresar.Visible = true;
                btnIngresar.Enabled = true;

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
            if (Request.QueryString["legajo"] != null)
            {
                int legajo = Convert.ToInt32(Request.QueryString["legajo"]);

                CargarDatosMedico(legajo);
            }
            else
            { 
                LimpiarCampos(); 
            }
        }
        
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            NegocioMedico negocioMedico = new NegocioMedico();

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
                _Legajo = negocioMedico.ObtenerLegajoPorDNI(Convert.ToInt32(txtDNI.Text)),
            };

            if (Request.QueryString["legajo"] == null)
            {
                if (negocioMedico.AgregarMedico(medico))
                {
                    NegocioHorarioMedico negocioHorarioMedico = new NegocioHorarioMedico();

                    foreach (ListItem dia in cblDiasAtencion.Items)
                    {
                        HorarioMedico horarioMedico = new HorarioMedico();

                        NegocioHorario negocioHorario = new NegocioHorario();

                        DateTime horaInicio;
                        DateTime.TryParse(negocioHorario.ObtenerHorario(Convert.ToInt32(ddlHoraInicio.SelectedValue)), out horaInicio);

                        DateTime horaFin;
                        DateTime.TryParse(negocioHorario.ObtenerHorario(Convert.ToInt32(ddlHoraFin.SelectedValue)), out horaFin);

                        horarioMedico._IdDia = int.Parse(dia.Value);
                        horarioMedico._Legajo = negocioMedico.ObtenerLegajoPorDNI(Convert.ToInt32(txtDNI.Text));
                        horarioMedico._HoraInicio = horaInicio.ToString("HH:mm");
                        horarioMedico._HoraFin = horaFin.ToString("HH:mm");
                        horarioMedico._Eliminado = dia.Selected ? false : true; //SI ESTÁ SELECCIONADO, ELIMINADO = FALSE, SINO TRUE

                        negocioHorarioMedico.AgregarHorarioMedico(horarioMedico);
                    }

                    Usuario usuario = new Usuario(negocioMedico.ObtenerLegajoPorDNI(Convert.ToInt32(txtDNI.Text)).ToString() + txtApellido.Text, "1234", Convert.ToInt32(negocioMedico.ObtenerLegajoPorDNI(Convert.ToInt32(txtDNI.Text))));
                    
                    NegocioUsuario negocioUsuario = new NegocioUsuario();
                    negocioUsuario.AgregarCuenta(usuario);
                    lblMensaje.Text = "El médico y usuario se han agregado con éxito";
                    lblMensaje.ForeColor = Color.Green;

                    pnlDatosMedico.Visible = false;
                    pnlDatosMedico.Enabled = false;

                    btnModificarDNI.Visible = false;
                    btnModificarDNI.Enabled = false;

                    btnIngresar.Visible = false;
                    btnIngresar.Enabled = false;

                    txtDNI.Visible = true;
                    txtDNI.Enabled = true;
                    txtDNI.Text = string.Empty;

                    BtnBuscarDNI.Visible = true;
                    BtnBuscarDNI.Enabled = true;

                    btnVolver.Visible = true;
                    btnVolver.Enabled = true;

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
                        horarioMedico._Legajo = negocioMedico.ObtenerLegajoPorDNI(Convert.ToInt32(txtDNI.Text));
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
                cargarLocalidades();
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

                NegocioHorario negocioHorario = new NegocioHorario();

                ddlHoraInicio.SelectedValue = negocioHorario.ObtenerIdHorario(horario._HoraInicio.ToString()).ToString(); //HASTA MANEJAR DISTINTOS HORARIOS POR DÍA, SE ASIGNA EL HORARIO DEL ÚLTIMO DÍA

                FiltrarYCargarHorariosFin();
                
                ddlHoraFin.SelectedValue = negocioHorario.ObtenerIdHorario(horario._HoraFin.ToString()).ToString();
            }
        }

        protected void btnModificarDNI_Click(object sender, EventArgs e)
        {
            Session["dniPreModificacion"] = txtDNI.Text;

            txtDNI.Visible = true;
            txtDNI.Enabled = true;

            pnlDatosMedico.Visible = true;
            pnlDatosMedico.Enabled = false;

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

        protected void BuscarDNIDuranteModificacion()
        {
            NegocioMedico negocioMedico = new NegocioMedico();

            bool existe = negocioMedico.ExisteDNI(Convert.ToInt32(txtDNI.Text));

            if (existe)
            {
                lblInicio.Text = "El DNI ya se encuentra registrado.";

                pnlDatosMedico.Visible = true;
                pnlDatosMedico.Enabled = false;

            }
            else
            {
                lblInicio.Text = "";

                pnlDatosMedico.Visible = true;
                pnlDatosMedico.Enabled = true;
            }
        }

        protected void btnCancelarDNI_Click(object sender, EventArgs e)
        {
            if (Session["dniPreModificacion"] != null)
            {
                txtDNI.Text = Session["dniPreModificacion"].ToString();
            }

            txtDNI.Enabled = false;

            BtnBuscarDNI.Visible = false;
            BtnBuscarDNI.Enabled = false;

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
            NegocioMedico negocioMedico = new NegocioMedico();
            int dni = int.Parse(txtDNI.Text);

            bool resultado = negocioMedico.RestaurarMedicoEliminado(dni);

            lblInicio.Text = "Medico restaurado.";

            txtDNI.Visible = true;
            txtDNI.Enabled = false;

            pnlDatosMedico.Visible = false;
            pnlDatosMedico.Enabled = false;

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

            BtnBuscarDNI.Visible = true;
            BtnBuscarDNI.Enabled = true;

            BtnVolver2.Visible = true;
            BtnVolver2.Enabled = true;
        }
    }
}