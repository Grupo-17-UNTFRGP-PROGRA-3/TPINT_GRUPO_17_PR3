using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Nacionalidad
    {
        public int _ID_Nacionalidad { get; set; }
        public string _DescripcionNacionalidad { get; set; }
        public  bool _EliminadoNacionalidad { get; set; }
        public Nacionalidad() { }
    }
}
