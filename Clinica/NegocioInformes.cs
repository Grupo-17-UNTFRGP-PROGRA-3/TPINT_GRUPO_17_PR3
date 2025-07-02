using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Clinica
{
    public class NegocioInformes
    {
        DaoInformes _DaoInf = new DaoInformes();
        Informe _inf = new Informe();

        public NegocioInformes() { }

        public DataTable TraerInforme (string fechaInicio, string fechaFin)
        {
            _inf._dt= _DaoInf.PacientesPorMedico(fechaInicio, fechaFin);
            return _inf._dt; 
        }



    }
}
