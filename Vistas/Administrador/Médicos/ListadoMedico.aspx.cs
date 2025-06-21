using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ListadoMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvMedicos.DataSource = ObtenerMedicosPrueba();
                gvMedicos.DataBind();
            }
        }

        private List<Medico> ObtenerMedicosPrueba()
        {
            return new List<Medico>
            {
                new Medico {Legajo = "12345", Nombre = "Juan", Apellido = "Pérez", Dni = "12345678", Sexo = "Masculino", Nacionalidad = "Argentina", FechaNacimiento = new DateTime(1998, 12, 21), Calle = "Belgrano", Altura = "201", Provincia = "Buenos Aires", Localidad = "Gral. Pacheco", Email = "juan@email.com", Telefono = "+5411291828", Especialidad = "Traumatología" },
                new Medico {Legajo = "54321", Nombre = "María", Apellido = "Gómez", Dni = "23456789", Sexo = "Femenino", Nacionalidad = "Argentina", FechaNacimiento = new DateTime(1985, 5, 10), Calle = "Rivadavia", Altura = "452", Provincia = "Córdoba", Localidad = "Córdoba", Email = "maria.gomez@example.com", Telefono = "+543514457899", Especialidad = "Odontología" },
                new Medico {Legajo = "98765", Nombre = "Carlos", Apellido = "Fernández", Dni = "34567890", Sexo = "Masculino", Nacionalidad = "Uruguaya", FechaNacimiento = new DateTime(1972, 11, 30), Calle = "San Martín", Altura = "889", Provincia = "Santa Fe", Localidad = "Rosario", Email = "cfernandez@mail.com", Telefono = "+549341223344", Especialidad = "Oftalmología" },
                new Medico {Legajo = "56789", Nombre = "Lucía", Apellido = "Martínez", Dni = "45678901", Sexo = "Femenino", Nacionalidad = "Argentina", FechaNacimiento = new DateTime(1990, 3, 14), Calle = "Alsina", Altura = "1023", Provincia = "Mendoza", Localidad = "Mendoza", Email = "lucia.martinez@dominio.com", Telefono = "+549261445566", Especialidad = "Pediatría" },
                new Medico {Legajo = "55555", Nombre = "Pedro", Apellido = "Suárez", Dni = "56789012", Sexo = "Masculino", Nacionalidad = "Paraguaya", FechaNacimiento = new DateTime(2000, 7, 7), Calle = "Mitre", Altura = "77", Provincia = "Buenos Aires", Localidad = "La Plata", Email = "psuarez@correo.com", Telefono = "+549221334455", Especialidad = "Traumatología" },
                new Medico {Legajo = "11111", Nombre = "Florencia", Apellido = "Rivas", Dni = "67890123", Sexo = "Femenino", Nacionalidad = "Chilena", FechaNacimiento = new DateTime(1995, 9, 25), Calle = "Urquiza", Altura = "313", Provincia = "Tucumán", Localidad = "San Miguel de Tucumán", Email = "flor.rivas@example.cl", Telefono = "+549381445566", Especialidad = "Ginecología" }
            };
        }

        public class Medico
        {
            public string Legajo {  get; set; }
            public string Nombre { get; set; }
            public string Apellido { get; set; }
            public string Dni { get; set; }
            public string Sexo { get; set; }
            public string Nacionalidad { get; set; }
            public DateTime FechaNacimiento { get; set; }
            public string Calle { get; set; }
            public string Altura { get; set; }
            public string Provincia { get; set; }
            public string Localidad { get; set; }
            public string Email { get; set; }
            public string Telefono { get; set; }
            public string Especialidad {  get; set; }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaMedico.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Home.aspx");
        }
    }
}