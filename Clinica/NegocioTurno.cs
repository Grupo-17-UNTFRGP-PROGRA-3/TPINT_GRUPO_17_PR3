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
        public DataTable listaTurnos(int legajo)
        {
            return dao.ListadoTurnos(legajo);
        }
        public DataTable filtrarTurnos(string filtro)
        {
            return dao.FiltrarTurnos(filtro);
        }
        public DataTable filtrarTurnos(int legajo, string paciente, string fecha, string estado)
        {
            return dao.FiltrarTurnos(legajo, paciente, fecha, estado);
        }

        public bool existeTurno(Turno turno)
        {
            DAOTurnos daoTurnos = new DAOTurnos();

            return daoTurnos.ExisteTurno(turno);
        }
    }
}
