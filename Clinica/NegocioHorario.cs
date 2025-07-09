using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clinica
{
    public class NegocioHorario
    {
        public DataTable ObtenerTabla()
        {
            DAOHorarios daoHorarios = new DAOHorarios();

            return daoHorarios.ObtenerTabla();
        }
        public int ObtenerIdHorario(string horario)
        {
            DAOHorarios daoHorarios = new DAOHorarios();

            return daoHorarios.ObtenerIdPorHorario(horario);
        }
        public string ObtenerHorario(int id)
        {
            DAOHorarios daoHorarios = new DAOHorarios();

            return daoHorarios.ObtenerHorarioPorID(id);
        }
        public DataTable ObtenerHorasHabilitadas(int legajo, int dia)
        {
            DAOHorarios dAOHorarios = new DAOHorarios();

            return dAOHorarios.TraerHorasHabilitadas(legajo, dia);
        }

        public DataTable ObtenerHorasHabilitadas(int legajo, int dia, string f)
        {
            DAOHorarios dAOHorarios = new DAOHorarios();

            return dAOHorarios.TraerHorasHabilitadas(legajo, dia, f);
        }
    }
}
