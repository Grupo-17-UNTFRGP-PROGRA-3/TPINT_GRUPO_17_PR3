using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class DAOHorarios
    {
        AccesoDatos datos = new AccesoDatos();
        Horario horario = new Horario();

        public DataTable ObtenerTabla()
        {
            string consulta = "SELECT Id, Horario FROM Horarios WHERE Eliminado = 0";
            SqlCommand sqlcmd = new SqlCommand(consulta);

            return datos.ObtenerTabla(sqlcmd, "Horarios");
        }
    }
}
