using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class DaoInformes
    {
        AccesoDatos _datos = new AccesoDatos();
        Informe _informe = new Informe();
        public DaoInformes() { }

        public DataTable PacientesPorMedico (string fechaInicio, string fechaFin)
        {
            DataTable dt = new DataTable(); 
            _datos = new AccesoDatos();
            string consulta = "SELECT LegajoMedico, COUNT ( Id) AS 'Turnos por Medico'  FROM Turnos " + 
                "WHERE LegajoMedico in (SELECT DISTINCT LegajoMedico)" + 
                "AND Fecha between '" + fechaInicio + "' and '" + fechaFin + "' " +
                "group by LegajoMedico Order by LegajoMedico;";
            string tabla = "Turnos";
           dt = _datos.ObtenerTabla(consulta, tabla);
            return dt;
        }

    }
}
