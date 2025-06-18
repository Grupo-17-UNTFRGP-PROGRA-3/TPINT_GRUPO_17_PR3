using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class AccesoDatos
    {
        private const string _cadenaConexion = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=ClinicaDB;Integrated Security=True;Encrypt=False";
        private SqlConnection _conexion = new SqlConnection(_cadenaConexion);

        public AccesoDatos() { }

        public int EjecutarConsulta(string consutalSql)
        {
            _conexion.Open();
            SqlCommand cmd = new SqlCommand(consutalSql, _conexion);
            int filasAfectadas = cmd.ExecuteNonQuery();
            _conexion.Close();
            return filasAfectadas;
        }

        public SqlDataReader ConsultaLectura(string consutalSql)
        {
            _conexion.Open();
            SqlCommand consulta = new SqlCommand(consutalSql, _conexion);
            SqlDataReader cmd = consulta.ExecuteReader();
            _conexion.Close();
            return cmd;
        }
    }
}
