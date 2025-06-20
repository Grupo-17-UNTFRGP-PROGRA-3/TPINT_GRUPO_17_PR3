using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Clinica
{
    public class NegocioLocalidad
    {
        public DataTable GetTable(int idProvincia)
        {
            DAOLocalidades dao = new DAOLocalidades();
            return dao.ObtenerLocalidad(idProvincia);
        }
    }
}
