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
    public class NegocioTurno
    {
        DAOTurnos dao = new DAOTurnos();
        public bool agregarTurno(Turno turno)
        {
            return dao.AgregarTurno(turno) > 0;
        }

        public DataTable listaTurnos()
        {
            return dao.ListadoTurnos();
        }

        public DataTable filtrarTurnos(string filtro)
        {
            return dao.FiltrarTurnos(filtro);
        }
    }
}
