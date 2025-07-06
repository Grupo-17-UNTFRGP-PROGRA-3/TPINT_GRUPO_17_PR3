using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turno
    {
        public int _Id { get; set; }
        public int _LegajoMedico{ get; set; }
        public string _DniPaciente{ get; set; }
        public DateTime _Fecha{ get; set; }
        public int _IdHorario{ get; set; }
        public string _Estado{ get; set; }
        public string _Observacion{ get; set; }
        public bool _Eliminado{ get; set; }

        public Turno() { }
    }
}
