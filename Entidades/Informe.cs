using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Informe
    {
        public DataTable _dt = new DataTable();
        public DateTime _FechaInicio;
        public DateTime _FechaFin;

        public Informe() { }

        public Informe(DateTime inicio, DateTime fin)
        { 
            _FechaInicio = inicio;
            _FechaFin = fin;
        }
    }
}
