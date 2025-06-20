using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DAOLocalidades
    {
        AccesoDatos AccesoDatos = new AccesoDatos();

        public DataTable ObtenerLocalidad(int idProvincia)
        {
            string consultaSQL = "SELECT Id,Descripcion FROM Localidades WHERE IdProvincia = " + idProvincia;
            return AccesoDatos.ObtenerTabla(consultaSQL, "Localidades");
        }
    }
}
