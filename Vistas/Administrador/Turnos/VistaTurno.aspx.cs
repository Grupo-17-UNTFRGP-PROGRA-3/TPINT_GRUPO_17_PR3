using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinica;

namespace Vistas.Administrador.Turnos
{
    public partial class VistaTurno : System.Web.UI.Page
    {
        NegocioTurno negocioTurno= new NegocioTurno();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UsuarioRol"].ToString() == "Administrador")
                { 
                    btnActualizar.Visible = false;
                    txtOb.Enabled = false;
                    lblMed.Visible = true;
                    lblEsp.Visible = true;
                    lblMedico.Visible = true;
                    lblEspecialidad.Visible = true;
                    ddlFiltroEstado.Enabled = false;
                }
                if (Request.QueryString["id"] != null)
                {
                    DataTable dt = new DataTable();
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    dt = negocioTurno.listaPorID(id);
                    lblCodigo.Text = dt.Rows[0]["id"].ToString();
                    lblFecha.Text = dt.Rows[0]["Fecha"].ToString();
                    lblHora.Text = dt.Rows[0]["Hora"].ToString();
                    lblPaciente.Text = dt.Rows[0]["Paciente"].ToString();
                    lblDNI.Text = dt.Rows[0]["DNI"].ToString();
                    ddlFiltroEstado.Text = dt.Rows[0]["Estado"].ToString();
                    txtOb.Text = dt.Rows[0]["Observacion"].ToString();
                    lblEspecialidad.Text = dt.Rows[0]["Especialidad"].ToString();
                    lblMedico.Text = dt.Rows[0]["Medico"].ToString();
                }
            }
        }
        public void actualizarTurno()
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            string estado = ddlFiltroEstado.Text;
            string observacion = txtOb.Text;

            if(negocioTurno.actualizarTurno(id, estado, observacion) == 1)
            {
                lblMensaje.Text = "Se agregaron los datos con exito";
                lblMensaje.ForeColor = Color.Green;
            }
            else
            {
                lblMensaje.Text = "No se pudo actualizar los datos";
                lblMensaje.ForeColor = Color.Red;
            }

        }


        protected void btnVolver_Click(object sender, EventArgs e)
        {
            if (Session["UsuarioRol"].ToString() == "Administrador")
            {
                Response.Redirect("~/Administrador/Turnos/ListaTurnos.aspx");
            }
            else
            {
                Response.Redirect("~/Medico/ListadoTurnos.aspx");
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            actualizarTurno();
        }
    }
}