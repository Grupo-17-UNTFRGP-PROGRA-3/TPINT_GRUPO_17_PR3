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
        public int ObtenerIdPorHorario(string horario)
        {
            string consulta = "SELECT Id FROM Horarios WHERE Horario = '" + horario + "'";
            return datos.ConsultaLecturaHorario(consulta);
        }
        public string ObtenerHorarioPorID(int id)
        {
            string consulta = "SELECT Horario FROM Horarios WHERE Id = " + id.ToString();

            return datos.ConsultaLecturaHorarioId(consulta);
        }
    }
}
