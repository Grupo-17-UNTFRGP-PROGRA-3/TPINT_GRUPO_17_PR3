using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

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
        public Usuario ConsultaLecturaUsuario(string consutalSql)
        {
            _conexion.Open();
            SqlCommand consulta = new SqlCommand(consutalSql, _conexion);
            SqlDataReader sqlDR = consulta.ExecuteReader();
            sqlDR.Read();
            Usuario user = new Usuario(sqlDR["Usuario"].ToString(), sqlDR["Password"].ToString(), sqlDR["Legajo"].ToString());
            _conexion.Close();

            return user;
        }
        public bool Existe(string tablaId, string atributoId, string registroId)
        {
            _conexion.Open();
            
            string traer = $"select * from " + tablaId + " where " + atributoId + " = '" + registroId + "'";
            SqlCommand consulta = new SqlCommand(traer, _conexion);
            SqlDataReader cmd = consulta.ExecuteReader();

            if (cmd.Read())
            {
                _conexion.Close();

                return true;
            }
            else
            {
                _conexion.Close();

                return false;
            }
        }

        public SqlDataReader ObtenerTabla(string nombreTabla)
        {
            _conexion.Open();
            string consulta = $"SELECT * FROM {nombreTabla}";
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return reader;
        }

        public DataTable ObtenerTabla(string consultaSQL, string nombreTabla)
        {
            _conexion.Open();

            SqlDataAdapter dataAdapter = new SqlDataAdapter(consultaSQL, _conexion);
            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet, nombreTabla);

            _conexion.Close();

            return dataSet.Tables[nombreTabla];
        }


        public bool ExisteDNI(int dni)
        {
            string consulta = "SELECT COUNT(*) FROM Pacientes WHERE DNI = @dni";
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            cmd.Parameters.AddWithValue("@dni", dni);
            _conexion.Open();
            int cantidad = (int)cmd.ExecuteScalar();
            _conexion.Close();
            return cantidad > 0;
        }

        public bool ExisteLegajo(string legajo)
        {
            string consulta = "SELECT COUNT(*) FROM Medicos WHERE Legajo = @legajo";
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            cmd.Parameters.AddWithValue("@legajo", legajo);
            _conexion.Open();
            int cantFilas = (int)cmd.ExecuteScalar();
            _conexion.Close();

            bool existe = false;

            if (cantFilas == 1)
            {
                existe = true;
            }

            return existe;
        }
    }
}
