using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medico
    {
        public int _DNI { get; set; }
        public string _Nombre { get; set; }
        public string _Apellido { get; set; }
        public bool _Sexo { get; set; }
        public int _IdNacionalidad { get; set; }
        public string _FechaNacimiento { get; set; }
        public string _Direccion { get; set; }
        public string _Email { get; set; }
        public string _Telefono { get; set; }
        public int _IdProvincia { get; set; }
        public int _IdLocalidad { get; set; }
        public bool _Eliminado { get; set; }
        public string _Legajo { get; set; }
        public int _IdEspecialidad { get; set; }
        
        public Medico() { }

        public Medico (int dni, string nombre, string apellido, bool sexo, int idNacionalidad, string fechaNacimiento,
                  string direccion, string email, string telefono, int idProvincia, int idLocalidad, bool eliminado,
                  string legajo, int idEspecialidad)
        {
            _DNI = dni;
            _Nombre = nombre;
            _Apellido = apellido;
            _Sexo = sexo;
            _IdNacionalidad = idNacionalidad;
            _FechaNacimiento = fechaNacimiento;
            _Direccion = direccion;
            _Email = email;
            _Telefono = telefono;
            _IdProvincia = idProvincia;
            _IdLocalidad = idLocalidad;
            _Eliminado = eliminado;
            _Legajo = legajo;
            _IdEspecialidad = idEspecialidad;
        }
    }
}