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
    public class DAOPacientes
    {
        AccesoDatos datos = new AccesoDatos();
        Paciente paciente = new Paciente();

        public DAOPacientes() { }

        public int AgregarPaciente(Paciente paciente)
        {
            string consulta = "INSERT INTO Pacientes(DNI, Nombre, Apellido, Sexo, IdNacionalidad, FechaNacimiento, Direccion, Email," +
                " Telefono, IdProvincia, IdLocalidad, Eliminado) VALUES('" +
             paciente._DNI + "', '" +
             paciente._Nombre + "', '" +
             paciente._Apellido + "', '" +
             paciente._Sexo + "', '" +
             paciente._IdNacionalidad + "', '" +
             paciente._FechaNacimiento + "', '" +
             paciente._Direccion + "', '" +
             paciente._Email + "', '" +
             paciente._Telefono + "', '" +
             paciente._IdProvincia + "', '" +
             paciente._IdLocalidad + "', '" +
             paciente._Eliminado + "')";

            return datos.EjecutarConsulta(consulta);
        }

        public int ModificarPaciente(Paciente paciente)
        {
            string consulta = "UPDATE Pacientes SET " +
            "Nombre = @Nombre, Apellido = @Apellido, Sexo = @Sexo, IdNacionalidad = @IdNacionalidad, " +
            "FechaNacimiento = @FechaNacimiento, Direccion = @Direccion, Email = @Email, " +
            "Telefono = @Telefono, IdProvincia = @IdProvincia, IdLocalidad = @IdLocalidad " +
            "WHERE DNI = @DNI";
          
            
            List<SqlParameter> parametros = new List<SqlParameter>
            {
            new SqlParameter("@Nombre", paciente._Nombre),
            new SqlParameter("@Apellido", paciente._Apellido),
            new SqlParameter("@Sexo", paciente._Sexo),
            new SqlParameter("@IdNacionalidad", paciente._IdNacionalidad),
            new SqlParameter("@FechaNacimiento", paciente._FechaNacimiento),
            new SqlParameter("@Direccion", paciente._Direccion),
            new SqlParameter("@Email", paciente._Email),
            new SqlParameter("@Telefono", paciente._Telefono),
            new SqlParameter("@IdProvincia", paciente._IdProvincia),
            new SqlParameter("@IdLocalidad", paciente._IdLocalidad),
            new SqlParameter("@DNI", paciente._DNI)
            };

            return datos.EjecutarConsultaConParametros(consulta, parametros);
        }

        public bool EliminarPaciente(int dni)
        {
            string consulta = "UPDATE Pacientes SET Eliminado = 1 WHERE DNI = " + dni;
            return datos.EjecutarConsulta(consulta) > 0;
        }

        public bool ExisteDNI(int dni)
        {
            AccesoDatos datos = new AccesoDatos(); 

            return datos.ExisteDNIPaciente(dni);
        }

        public Paciente traerPaciente(int dni)
        {
           
            AccesoDatos datos = new AccesoDatos();
            Paciente paciente = datos.TraerPacientePorDNI(dni);
            return paciente;
        }

        public DataTable ListadoPacientes()
        {
            string consulta = "SELECT * FROM Pacientes WHERE Eliminado = 0";
            DataTable dt = new DataTable();
            dt = datos.ObtenerTabla(consulta, "Pacientes");
            return dt;
        }

        public DataTable ListadoPacientesNombreConDNI()
        {
            string consulta = "SELECT Dni, Nombre + ' ' + Apellido + ', ' + Dni AS Descripcion FROM Pacientes";

            SqlCommand sqlcmd = new SqlCommand(consulta);

            return datos.ObtenerTabla(sqlcmd, "Pacientes");
        }

        public DataTable ListadoPacientesJoined()
        {
            string consulta = "SELECT P.Dni, P.Nombre, P.Apellido, N.Descripcion AS 'Nacionalidad', P.FechaNacimiento, " +
                "CASE WHEN Sexo = 0 THEN 'Masculino' ELSE 'Femenino' END AS 'Sexo' " +
                "FROM Pacientes P " +
                "INNER JOIN Nacionalidades N ON P.IdNacionalidad = N.Id " +
                "WHERE P.Eliminado = 0";
            DataTable dt = new DataTable();
            dt = datos.ObtenerTabla(consulta, "Pacientes");
            return dt;
        }
    
        public DataTable PacienteFiltradoPorDNI(int dni)
        {
            string consulta = "SELECT P.Dni, P.Nombre, P.Apellido, N.Descripcion AS 'Nacionalidad', P.FechaNacimiento, " +
                "CASE WHEN Sexo = 0 THEN 'Masculino' ELSE 'Femenino' END AS 'Sexo' " +
                "FROM Pacientes P " +
                "INNER JOIN Nacionalidades N ON P.IdNacionalidad = N.Id " +
                "WHERE P.Eliminado = 0" +
                "AND Dni = @DNI";
            SqlCommand sqlcmd = new SqlCommand(consulta);
            
            sqlcmd.Parameters.AddWithValue("@DNI", dni);
            return datos.ObtenerTabla(sqlcmd, "Pacientes");
        }
    
        public int ChequearEliminado (int dni)
        {
            string consulta = "SELECT COUNT(*) FROM Pacientes WHERE (Dni = @DNI) AND (Eliminado = 1)";
            SqlCommand sqlcmd = new SqlCommand(consulta);

            sqlcmd.Parameters.AddWithValue("@DNI", dni);

            return datos.EjecutarConsultaEscalar(sqlcmd);
        }

        public bool RestaurarPacienteEliminado(int dni)
        {
            string consulta = "UPDATE Pacientes SET Eliminado = 0 WHERE (Dni = @DNI)";
            SqlCommand sqlcmd = new SqlCommand(consulta);

            sqlcmd.Parameters.AddWithValue("@DNI", dni);

            return datos.EjecutarConsulta(sqlcmd) > 0;
        }
    }
}
