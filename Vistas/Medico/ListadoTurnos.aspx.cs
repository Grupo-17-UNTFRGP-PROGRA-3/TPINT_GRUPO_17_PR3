using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Medico
{
    public partial class ListadoTurnos : System.Web.UI.Page
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
                new Turno { Fecha = new DateTime(2025, 6, 12), Hora = "09:00", Paciente = "Ana García", Estado = "Presente" },
                new Turno { Fecha = new DateTime(2025, 6, 12), Hora = "10:00", Paciente = "Carlos Sánchez", Estado = "Pendiente" },
                new Turno { Fecha = new DateTime(2025, 6, 12), Hora = "11:00", Paciente = "Laura Martínez", Estado = "Pendiente" },
                new Turno { Fecha = new DateTime(2025, 6, 13), Hora = "09:00", Paciente = "Miguel Fernández", Estado = "Ausente" },
                new Turno { Fecha = new DateTime(2025, 6, 13), Hora = "10:00", Paciente = "Sofía Díaz", Estado = "Presente" }
             };
        }

        public class Turno
        {
            public DateTime Fecha { get; set; }
            public string Hora { get; set; }
            public string Paciente { get; set; }
            public string Estado { get; set; }
        }
    }
}