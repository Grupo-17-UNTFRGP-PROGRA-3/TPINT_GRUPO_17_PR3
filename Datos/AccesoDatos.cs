using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
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

        public int EjecutarConsulta(SqlCommand sqlcmd)
        {
            sqlcmd.Connection = _conexion;
            sqlcmd.Connection.Open();

            int filasAfectadas = sqlcmd.ExecuteNonQuery();

            sqlcmd.Connection.Close();
            return filasAfectadas;
        }

        public int EjecutarConsultaEscalar(SqlCommand sqlcmd)
        {
            sqlcmd.Connection = _conexion;
            sqlcmd.Connection.Open();

            int filasAfectadas = (int)sqlcmd.ExecuteScalar();

            sqlcmd.Connection.Close();
            return filasAfectadas;
        }

        public int EjecutarConsultaConParametros(string consultaSql, List<SqlParameter> parametros)
        {            
            {
                SqlCommand cmd = new SqlCommand(consultaSql, _conexion);
                cmd.Parameters.AddRange(parametros.ToArray());
                _conexion.Open();
                return cmd.ExecuteNonQuery();
            }
        }

        public SqlDataReader ConsultaLectura(string consutalSql)
        {
            _conexion.Open();
            SqlCommand consulta = new SqlCommand(consutalSql, _conexion);
            SqlDataReader cmd = consulta.ExecuteReader();
            _conexion.Close();
            return cmd;
        }

        public int ConsultaLecturaHorario(string consultaSQL)
        {
            _conexion.Open();
            SqlCommand consulta = new SqlCommand(consultaSQL, _conexion);
            SqlDataReader sqlDR = consulta.ExecuteReader();
            sqlDR.Read();
            int idHorario = Convert.ToInt32(sqlDR["Id"]);
            _conexion.Close();

            return idHorario;
        }
        public string ConsultaLecturaHorarioId(string consultaSQL)
        {
            _conexion.Open();
            SqlCommand consulta = new SqlCommand(consultaSQL, _conexion);
            SqlDataReader sqlDR = consulta.ExecuteReader();
            sqlDR.Read();
            string Horario = sqlDR["Horario"].ToString();
            _conexion.Close();

            return Horario;
        }
        
        public Usuario ConsultaLecturaUsuario(string consultalSql)
        {
            _conexion.Open();
            SqlCommand consulta = new SqlCommand(consultalSql, _conexion);
            SqlDataReader sqlDR = consulta.ExecuteReader();
            sqlDR.Read();
            Usuario user = new Usuario(sqlDR["Usuario"].ToString(), sqlDR["Password"].ToString(), int.Parse(sqlDR["Legajo"].ToString()));
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

        public DataTable ObtenerTabla(SqlCommand sqlcmd, string nombreTabla)
        {
            sqlcmd.Connection = _conexion;

            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlcmd);
            DataSet dataSet = new DataSet();

            sqlcmd.Connection.Open();
            dataAdapter.Fill(dataSet, nombreTabla);
            sqlcmd.Connection.Close();

            return dataSet.Tables[nombreTabla];
        }

        public bool ExisteDNIPaciente(int dni)
        {
            string consulta = "SELECT COUNT(*) FROM Pacientes WHERE DNI = @dni";
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            cmd.Parameters.AddWithValue("@dni", dni);
            _conexion.Open();
            int cantidad = (int)cmd.ExecuteScalar();
            _conexion.Close();
            return cantidad > 0;
        }

        public bool ExisteDNIMedico(int dni)
        {
            string consulta = "SELECT COUNT(*) FROM Medicos WHERE DNI = @dni";
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            cmd.Parameters.AddWithValue("@dni", dni);
            _conexion.Open();
            int cantidad = (int)cmd.ExecuteScalar();
            _conexion.Close();
            return cantidad > 0;
        }

        public bool ExisteLegajo(int legajo)
        {
            string consulta = "SELECT COUNT(*) FROM Medicos WHERE Legajo = @legajo";
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            cmd.Parameters.AddWithValue("@legajo", legajo);
            _conexion.Open();
            int cantidad = (int)cmd.ExecuteScalar();
            _conexion.Close();

            bool existe = false;

            if (cantidad == 1)
            {
                existe = true;
            }

            return existe;
        }
        
        public bool ExisteUsuario(string Nusuario)
        {
            string consulta = "SELECT COUNT(*) FROM Usuarios WHERE usuario = @usuario";
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            cmd.Parameters.AddWithValue("@usuario", Nusuario);
            _conexion.Open();
            int cantidad = (int)cmd.ExecuteScalar();
            _conexion.Close();

            bool existe = false;

            if (cantidad == 1)
            {
                existe = true;
            }

            return existe;
        }

        public Paciente TraerPacientePorDNI(int dni)
        {
            Paciente paciente = null;
            string consulta = "SELECT * FROM Pacientes WHERE DNI = @dni";

            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            cmd.Parameters.AddWithValue("@dni", dni);

            _conexion.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                paciente = new Paciente
                {
                    _DNI = Convert.ToInt32(reader["DNI"]),
                    _Nombre = reader["Nombre"].ToString(),
                    _Apellido = reader["Apellido"].ToString(),
                    _IdNacionalidad = Convert.ToInt32(reader["IdNacionalidad"]),
                    _FechaNacimiento = reader["FechaNacimiento"].ToString(),
                    _Direccion = reader["Direccion"].ToString(),
                    _Email = reader["Email"].ToString(),
                    _Telefono = reader["Telefono"].ToString(),
                    _IdProvincia = Convert.ToInt32(reader["IdProvincia"]),
                    _IdLocalidad = Convert.ToInt32(reader["IdLocalidad"]),
                };
                if (reader["Sexo"].ToString() == "False")
                {
                    paciente._Sexo = false;
                }
                else { paciente._Sexo = true; }

                if (Convert.ToInt32(reader["Eliminado"]) == 0)
                {
                    paciente._Eliminado = false;
                }
                else
                {
                    paciente._Eliminado = true;
                }
            }
            reader.Close();
            _conexion.Close();
            return paciente;
        }
        
        public int TraerLegajoMedicoPorDNI(int dni)
        {
            int legajo = -1;
            string consulta = "SELECT Legajo FROM Medicos WHERE Dni = '" + dni + "'";

            SqlCommand cmd = new SqlCommand(consulta, _conexion);

            _conexion.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                legajo = Convert.ToInt32(reader["Legajo"]);
            }

            _conexion.Close();

            return legajo;
        }
        
        public Medico TraerMedicoPorLegajo(int legajo)
        {
            Medico medico = null;
            string consulta = "SELECT * FROM Medicos WHERE Legajo = @legajo";

            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            cmd.Parameters.AddWithValue("@Legajo", legajo);

            _conexion.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                medico = new Medico
                {
                     _DNI = Convert.ToInt32(reader["DNI"]),
                     _Nombre = reader["Nombre"].ToString(),
                     _Apellido = reader["Apellido"].ToString(),
                     _IdNacionalidad = Convert.ToInt32(reader["IdNacionalidad"]),
                     _FechaNacimiento = DateTime.Parse(reader["FechaNacimiento"].ToString()),
                     _Direccion = reader["Direccion"].ToString(),
                     _Email = reader["Email"].ToString(),
                     _Telefono = reader["Telefono"].ToString(),
                     _IdProvincia = Convert.ToInt32(reader["IdProvincia"]),
                     _IdLocalidad = Convert.ToInt32(reader["IdLocalidad"]),
                     _Legajo = Convert.ToInt32(reader["Legajo"]),
                     _IdEspecialidad = Convert.ToInt32(reader["IdEspecialidad"])
                };

                if (reader["Sexo"].ToString() == "False")
                {
                    medico._Sexo = false;
                }
                else { medico._Sexo = true; }

                if (Convert.ToInt32(reader["Eliminado"]) == 0)
                {
                    medico._Eliminado = false;
                }
                else
                {
                    medico._Eliminado = true;
                }
            }
            reader.Close();
            _conexion.Close();
            return medico;
        }
        
        public Usuario traerUsuarioPorLegajo(int legajo)
        {
            Usuario usuario = new Usuario();
            string consulta = "SELECT * FROM Usuarios WHERE Legajo = @legajo";
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            cmd.Parameters.AddWithValue("@legajo", legajo);
            _conexion.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                usuario = new Usuario
                {
                    _usuario = reader["Usuario"].ToString(),
                    _pass = reader["Password"].ToString(),
                    _legajo = int.Parse(reader["Legajo"].ToString())
                };
                
            }
            reader.Close();
            _conexion.Close();

            return usuario;
        }
        
        public List<HorarioMedico> TraerListaHorariosMedicoPorLegajo(int legajo)
        {
            List<HorarioMedico> horariosMedico = new List<HorarioMedico>();
            string consulta = "SELECT * FROM HorariosMedicos WHERE Legajo = " + legajo;
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            _conexion.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                HorarioMedico horarioMedico = new HorarioMedico
                {
                    _IdDia = Convert.ToInt32(reader["IdDia"]),
                    _HoraInicio = reader["HoraInicio"].ToString(),
                    _HoraFin = reader["HoraFin"].ToString(),
                    _Legajo = Convert.ToInt32(legajo),
                    _Eliminado = Convert.ToBoolean(reader["Eliminado"])
                };

                horariosMedico.Add(horarioMedico);
            }

            _conexion.Close();

            return horariosMedico;
        }

        public HorarioMedico TraerHorarioMedico(int legajo, int dia)
        {
            HorarioMedico horMed = new HorarioMedico();
            string consulta = "SELECT * FROM HorariosMedicos WHERE Legajo = " + legajo.ToString() + " AND IdDia = " + dia.ToString();
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            _conexion.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                horMed._IdDia = Convert.ToInt32(reader["IdDia"]);
                horMed._HoraInicio = reader["HoraInicio"].ToString();
                horMed._HoraFin = reader["HoraFin"].ToString();
                horMed._Legajo = Convert.ToInt32(reader["Legajo"]);
                horMed._Eliminado = Convert.ToBoolean(reader["Eliminado"]);
            }

            _conexion.Close();

            return horMed;
        }

        public DataTable HorasDispXmedicoXdia(int Legajo, int Dia)
        { 
            DataTable horasHabilitadas = new DataTable();
            string consulta = "select h.Id, h.Horario from Horarios h " +
                              "inner join HorariosMedicos hm ON hm.IdDia = "+ Dia.ToString() +" and hm.Legajo = "+ Legajo.ToString()+
                              "where hm.Eliminado = 0 and h.Horario between hm.HoraInicio and DATEADD(HOUR, -1, hm.HoraFin)";
   
            SqlCommand cmd = new SqlCommand(consulta, _conexion);
            _conexion.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter(cmd);
            
            sqlDA.Fill(horasHabilitadas);

            return horasHabilitadas;
        }
    }
}