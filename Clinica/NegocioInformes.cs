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

        public DataTable TraerInforme (string fechaInicio, string fechaFin, int tipoInf)
        {
            switch (tipoInf)
            {
                case 1:
                {
                    _inf._dt= _DaoInf.PacientesPorMedico(fechaInicio, fechaFin);
                }
                    break;
                case 2:
                {
                    _inf._dt = _DaoInf.PacientesPorEspecialidad(fechaInicio, fechaFin);
                }
                    break;
                case 3: 
                {
                    _inf._dt = _DaoInf.HorasPico(fechaInicio, fechaFin);
                    }
                    break;
                case 4: { }
                    break;
                default: _inf._dt = null;
                    break;
            }
            return _inf._dt; 
        }



    }
}
