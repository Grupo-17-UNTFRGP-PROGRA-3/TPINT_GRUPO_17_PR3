using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
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
            string consulta = "SELECT LegajoMedico AS 'Legajo', m.Nombre, m.Apellido, e.Descripcion, COUNT ( t.Id) AS 'Turnos'  FROM Turnos t " + 
                "INNER JOIN Medicos m ON t.LegajoMedico = m.Legajo " +
                "Inner Join Especialidades e ON m.IdEspecialidad = e.Id " +
                "WHERE LegajoMedico in (SELECT DISTINCT LegajoMedico) " +
                "AND Fecha between '" + fechaInicio + "' and '" + fechaFin + "' " +
                "group by LegajoMedico, m.Nombre, m.Apellido, e.Descripcion Order by Turnos DESC";
            string tabla = "Turnos";
           dt = _datos.ObtenerTabla(consulta, tabla);
            return dt;
        }

        public DataTable PacientesPorEspecialidad(string fechaInicio, string fechaFin)
        {
            DataTable dt = new DataTable();
            _datos = new AccesoDatos();
            string consulta = "SELECT e.Descripcion, COUNT (t.Id) AS 'Pacientes' "+
                "FROM Turnos t " +
                "INNER JOIN Medicos m ON t.LegajoMedico = m.Legajo " +
                "INNER JOIN Especialidades e ON m.IdEspecialidad = e.Id " +
                "Where t.Fecha between '"+ fechaInicio +"' and '"+ fechaFin +"' "+
                "GROUP BY e.Descripcion "+
                "ORDER BY Pacientes DESC";
            string tabla = "Turnos";
            dt = _datos.ObtenerTabla(consulta, tabla);
            return dt;
        }

        public DataTable HorasPico(string fechaInicio, string fechaFin)
        {
            DataTable dt = new DataTable();
            _datos = new AccesoDatos();
            string consulta = "Select h.Descripcion, Count (t.Id) AS 'Cantidad de pacientes'"+
                "  From Turnos t"+
                "  Inner join Horarios h ON t.IdHorario = h.Id"+
                "  WHERE Fecha BETWEEN '"+fechaInicio+"' AND '"+fechaFin +"'"+
                "  group by h.Id, h.Descripcion" +
                "  Order By h.Id";
            string tabla = "Turnos";
            dt = _datos.ObtenerTabla(consulta, tabla);
            return dt;
        }
    }
}
