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
    }
}
