﻿using Clinica;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ListadoMedico : System.Web.UI.Page
    {
        private NegocioMedico _negocioMedico = new NegocioMedico();
        private NegocioEspecialidad _negocioEspecialidad = new NegocioEspecialidad();
        private NegocioProvincia _negocioProvincia = new NegocioProvincia();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMedicos();
                CargarEspecialidades();
                CargarProvincias();
            }
        }

        private void CargarMedicos()
        {
            gvMedicos.DataSource = _negocioMedico.ListadoMedicosJoined();
            gvMedicos.DataBind();
        }

        private void CargarEspecialidades()
        {
            DataTable dtEspecialidades = _negocioEspecialidad.GetTable(); // Este método lo debés tener o crear

            ddlEspecialidad.DataSource = dtEspecialidades;
            ddlEspecialidad.DataTextField = "Descripcion";
            ddlEspecialidad.DataValueField = "Descripcion";
            ddlEspecialidad.DataBind();
        }

        private void CargarProvincias()
        {
            DataTable dtProvincias = _negocioProvincia.GetTable();

            ddlProvincia.DataSource = dtProvincias;
            ddlProvincia.DataTextField = "Descripcion";
            ddlProvincia.DataValueField = "Descripcion";
            ddlProvincia.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaMedico.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }

        protected void gvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "EliminarMedico")
            {
                int legajo = Convert.ToInt32(e.CommandArgument);
                if (_negocioMedico.ExisteLegajo(legajo))
                {
                    _negocioMedico.EliminarMedico(legajo);
                }

                CargarMedicos();
            }

            if (e.CommandName == "ModificarMedico")
            {
                string legajo = e.CommandArgument.ToString();
                Response.Redirect($"~/Administrador/Médicos/AltaMedico.aspx?legajo={legajo}");
            }
        }

        protected void gvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicos.PageIndex = e.NewPageIndex;
            CargarMedicos();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();
            string especialidad = ddlEspecialidad.SelectedValue;
            string sexo = ddlSexo.SelectedValue;
            string provincia = ddlProvincia.SelectedValue;

            DataTable dt = _negocioMedico.ListadoMedicosJoined();
            if (dt == null) return;

            DataView dv = dt.DefaultView;
            List<string> filtros = new List<string>();

            if (!string.IsNullOrEmpty(nombre))
                filtros.Add($"Nombre LIKE '%{nombre}%'");

            if (!string.IsNullOrEmpty(especialidad))
                filtros.Add($"Especialidad = '{especialidad}'");

            if (!string.IsNullOrEmpty(sexo))
                filtros.Add($"Sexo = '{sexo}'");

            if (!string.IsNullOrEmpty(provincia))
                filtros.Add($"Provincia = '{provincia}'");

            dv.RowFilter = string.Join(" AND ", filtros);

            gvMedicos.DataSource = dv;
            gvMedicos.DataBind();
        }
    }
}