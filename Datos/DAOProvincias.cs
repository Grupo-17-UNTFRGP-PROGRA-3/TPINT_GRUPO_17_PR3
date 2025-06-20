using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DAOProvincias
    {
        AccesoDatos AccesoDatos = new AccesoDatos();

        public DataTable ObtenerProvicias()
        {
            string consultaSQL = "Select Descripcion, Id FROM Provincias";
            return AccesoDatos.ObtenerTabla(consultaSQL, "Provincias");
        }
    }
}
