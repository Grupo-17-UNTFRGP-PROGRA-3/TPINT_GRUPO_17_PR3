using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Localidad
    {
        public int _ID_Localidad { get; set; }
        public string _DescripcionLocalidad { get; set; }
        public bool _EliminadoLocalidad { get; set; }
        public Localidad() { }
    }
}
