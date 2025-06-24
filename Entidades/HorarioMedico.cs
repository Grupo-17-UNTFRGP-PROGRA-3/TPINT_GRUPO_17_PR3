using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class HorarioMedico
    {
        public int _IdDia { get; set; }
        public string _Legajo { get; set; }
        public string _HoraInicio { get; set; }
        public string _HoraFin { get; set; }
        public bool _Eliminado { get; set; }
        public HorarioMedico() { }
    }
}
