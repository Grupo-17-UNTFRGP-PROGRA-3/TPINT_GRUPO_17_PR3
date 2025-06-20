using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Clinica
{
    public class NegocioProvincia
    {
        public DataTable GetTable()
        {
            DAOProvincias dao = new DAOProvincias();
            return dao.ObtenerProvicias();
        }
    }
}
