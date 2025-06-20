using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Paciente
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

        public Paciente() { }
    }
    
}
