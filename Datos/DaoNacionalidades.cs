using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoNacionalidades
    {
        AccesoDatos AccesoDatos=new AccesoDatos();

        public DataTable ObtenerNacionalidad()
        {
            string consultaSQL = "Select Descripcion, Id FROM Nacionalidades";
            return AccesoDatos.ObtenerTabla( consultaSQL,"Nacionalidades" );
        }
    }
}
