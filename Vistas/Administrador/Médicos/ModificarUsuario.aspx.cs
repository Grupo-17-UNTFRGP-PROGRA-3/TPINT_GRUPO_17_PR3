﻿using System;
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
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            int legajo = int.Parse(Request.QueryString["legajo"]);
            string usuario = Request.QueryString["usuario"];

            if (!IsPostBack)
            {
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

            if (neg.existeUsuario(txtUsuario.Text))
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

                log.ModificarUsuario(txtUsuario.Text, txtPass1.Text, legajo);

                lblMensaje.Text = "EXITO";
            }
        }
    }
}
