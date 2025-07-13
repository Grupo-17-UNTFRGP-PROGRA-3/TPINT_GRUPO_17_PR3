using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;
using Entidades;
using Vistas.Medico;

namespace Vistas.Administrador.Médicos
{
    public partial class CreacionLogin : System.Web.UI.Page
    {
        public void cargarUsuario(int legajo)
        {
            NegocioUsuario negocioUsuario = new NegocioUsuario();

            Usuario Nuevousuario = negocioUsuario.ObtenerUsuarioPorLegajo(legajo);

            txtUsuario.Text = Nuevousuario.getUsuario();
            txtPass1.Text = Nuevousuario.getPass();
            txtPass2.Text = Nuevousuario.getPass();
        }

        public void cargarUsuario(string nombre)
        {
            NegocioUsuario negocioUsuario = new NegocioUsuario();

            Usuario Nuevousuario = negocioUsuario.ObtenerUsuarioPorNombre(nombre);

            txtUsuario.Text = Nuevousuario.getUsuario();
            txtPass1.Text = Nuevousuario.getPass();
            txtPass2.Text = Nuevousuario.getPass();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

                //VALIDAR USUARIO LOGEADO
                if (Session["UsuarioRol"] == null)
                {
                    Response.Redirect(ResolveUrl("~/Login.aspx"));
                    return;
                }

                int legajo = int.Parse(Request.QueryString["legajo"]);
                string usuario = Request.QueryString["usuario"];

                //VALIDAR ROL
                if (Session["UsuarioRol"].ToString() == "Medico")
                {
                    if (legajo.ToString() != Session["Legajo"].ToString())
                    {
                        Response.Redirect(ResolveUrl(Session["Home"].ToString()));
                        return;
                    }
                }

                if (usuario == null)
                {
                    cargarUsuario(legajo);
                }
                else
                {
                    cargarUsuario(usuario);
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            if (Session["UsuarioRol"].ToString() == "Administrador")
            {
                Response.Redirect("~/Administrador/Usuarios/ListadoUsuarios.aspx");
            }
            else
            {
                Response.Redirect("~/Medico/HomeMED.aspx");
            }
        }

        protected void BtnBuscarUsuario_Click(object sender, EventArgs e)
        {
            NegocioUsuario neg = new NegocioUsuario();
            LabelUsuario.Text = string.Empty;
            Usuario usuario = neg.ObtenerUsuarioPorLegajo(int.Parse(Request.QueryString["legajo"]));

            if (neg.existeUsuario(txtUsuario.Text) && txtUsuario.Text != usuario._usuario)
            {
                LabelUsuario.Text = "Usuario no disponible, elija otro";
            }
            else
            {
                pnlUsuarioMedico.Visible = true;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            int legajo = int.Parse(Request.QueryString["legajo"]);

            if (txtPass1.Text == txtPass2.Text)
            {
                NegocioUsuario log = new NegocioUsuario();

                if (log.ModificarUsuario(txtUsuario.Text, txtPass1.Text, legajo))
                {
                    lblMensaje.ForeColor = Color.Green;
                    lblMensaje.Text = "El usuario ha sido modificado exitosamente";
                }
                else
                {
                    lblMensaje.ForeColor = Color.Red;
                    lblMensaje.Text = "Error el usuario no se pudo modificar";
                }
            }
        }
    }
}
