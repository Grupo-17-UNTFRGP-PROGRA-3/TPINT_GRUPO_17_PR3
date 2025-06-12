using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Administrador
{
	public partial class ListaTurnos : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                gvTurnos.DataSource = ObtenerTurnosPrueba();
                gvTurnos.DataBind();
            }
        }

        private List<Turno> ObtenerTurnosPrueba()
        {
            return new List<Turno>
 {
 new Turno { Fecha = new DateTime(2025, 6, 12), Hora = "09:00", Especialidad = "Cardiología", Medico = "Dr. Juan Pérez", Paciente = "Ana García", Estado = "Confirmado" },
 new Turno { Fecha = new DateTime(2025, 6, 12), Hora = "10:00", Especialidad = "Dermatología", Medico = "Dra. María López", Paciente = "Carlos Sánchez", Estado = "Pendiente" },
 new Turno { Fecha = new DateTime(2025, 6, 12), Hora = "11:00", Especialidad = "Neurología", Medico = "Dr. Pedro Gómez", Paciente = "Laura Martínez", Estado = "Confirmado" },
 new Turno { Fecha = new DateTime(2025, 6, 13), Hora = "09:00", Especialidad = "Pediatría", Medico = "Dra. Ana Torres", Paciente = "Miguel Fernández", Estado = "Cancelado" },
 new Turno { Fecha = new DateTime(2025, 6, 13), Hora = "10:00", Especialidad = "Ginecología", Medico = "Dra. Laura Ruiz", Paciente = "Sofía Díaz", Estado = "Confirmado" }
 };
        }

        public class Turno
        {
            public DateTime Fecha { get; set; }
            public string Hora { get; set; }
            public string Especialidad { get; set; }
            public string Medico { get; set; }
            public string Paciente { get; set; }
            public string Estado { get; set; }
        }

        protected void btnAgregar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("AltaTurnos.aspx");
        }
    }
}
