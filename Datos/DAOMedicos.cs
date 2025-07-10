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
    public class DAOMedicos
    {
        AccesoDatos datos = new AccesoDatos();
        Medico medico = new Medico();

        public int AgregarMedico(Medico medico)
        {
            string consulta = "INSERT INTO Medicos(DNI, Nombre, Apellido, Sexo, IdNacionalidad, FechaNacimiento, Direccion, Email," +
                " Telefono, IdEspecialidad, IdProvincia,IdLocalidad, Eliminado) VALUES('" +
             medico._DNI + "', '" +
             medico._Nombre + "', '" +
             medico._Apellido + "', '" +
             medico._Sexo + "', '" +
             medico._IdNacionalidad + "', '" +
             medico._FechaNacimiento.ToString("yyyy-MM-dd") + "', '" +
             medico._Direccion + "', '" +
             medico._Email + "', '" +
             medico._Telefono + "', '" +
             medico._IdEspecialidad + "', '" +
             medico._IdProvincia + "', '" +
             medico._IdLocalidad + "', '" +
             medico._Eliminado + "')";

            return datos.EjecutarConsulta(consulta);
        }

        public int ModificarMedico(Medico medico)
        {
            string consulta = @"UPDATE [dbo].[Medicos] SET [Nombre] = @Nombre, [Apellido] = @Apellido, [Sexo] = @Sexo, " +
                " [IdNacionalidad] = @IdNacionalidad, [FechaNacimiento] = @FechaNacimiento, [Direccion] = @Direccion, [Email] = @Email," +
                " [Telefono] = @Telefono, [IdEspecialidad] = @IdEspecialidad, [IdProvincia] = @IdProvincia, [IdLocalidad] = @IdLocalidad " +
                "WHERE [Legajo] = @Legajo";

            List<SqlParameter> parametros = new List<SqlParameter>
            {
            new SqlParameter("@Legajo", medico._Legajo),
            new SqlParameter("@Nombre", medico._Nombre ),
            new SqlParameter("@Apellido", medico._Apellido),
            new SqlParameter("@Sexo", medico._Sexo ),
            new SqlParameter("@IdNacionalidad", medico._IdNacionalidad ),
            new SqlParameter("@FechaNacimiento", medico._FechaNacimiento ),
            new SqlParameter("@Direccion", medico._Direccion),
            new SqlParameter("@Email", medico._Email),
            new SqlParameter("@Telefono", medico._Telefono),
            new SqlParameter("@IdEspecialidad", medico._IdEspecialidad),
            new SqlParameter("@IdProvincia", medico._IdProvincia),
            new SqlParameter("@IdLocalidad", medico._IdLocalidad)
            };

            return datos.EjecutarConsultaConParametros(consulta, parametros);
        }

        public bool EliminarMedico(int legajo)
        {
            string consulta = "UPDATE Medicos SET Eliminado = 1 WHERE Legajo = " + legajo;
            return datos.EjecutarConsulta(consulta) > 0;
        }

        public bool ExisteDNIMedico(int dni)
        {
            AccesoDatos datos = new AccesoDatos();

            return datos.ExisteDNIMedico(dni);
        }

        public DataTable ListadoMedicos()
        {
            string consulta = "SELECT * FROM Medicos WHERE Eliminado = 0";
            DataTable dt = new DataTable();
            dt = datos.ObtenerTabla(consulta, "Medicos");
            return dt;
        }

        public DataTable ListadoMedicosJoined()
        {
            string consulta = "SELECT M.Legajo, M.Dni, M.Nombre, M.Apellido, E.Descripcion AS 'Especialidad', M.FechaNacimiento, P.Descripcion AS 'Provincia', " +
                "CASE WHEN Sexo = 0 THEN 'Masculino' ELSE 'Femenino' END AS 'Sexo' " +
                "FROM Medicos M " +
                "INNER JOIN Especialidades E ON M.IdEspecialidad = E.Id " +
                "INNER JOIN Provincias P ON M.IdProvincia = P.Id " +
                "WHERE M.Eliminado = 0 AND M.Legajo != '0000'";
            DataTable dt = new DataTable();
            dt = datos.ObtenerTabla(consulta, "Medicos");
            return dt;
        }
    
        public DataTable ListadoMedicosPorEspecialidad(int idEspecialidad)
        {
            AccesoDatos datos = new AccesoDatos();
            string consulta = "SELECT Legajo, Nombre + ' ' + Apellido AS Descripcion " +
                              "FROM Medicos " +
                              "WHERE (IdEspecialidad = @IDESPECIALIDAD) AND (Legajo <> '0000')";
            SqlCommand sqlcmd = new SqlCommand(consulta);

            sqlcmd.Parameters.AddWithValue("@IDESPECIALIDAD", idEspecialidad.ToString());

            return datos.ObtenerTabla(sqlcmd, "Especialidades");
        }

        public DataTable ListadoDiasDeAtencionPorLegajo(string legajo)
        {
            string consulta = "SELECT HM.IdDia, D.Descripcion " +
                              "FROM HorariosMedicos HM " +
                              "JOIN Dias D ON HM.IdDia = D.Id " +
                              "WHERE (HM.Eliminado = 0) AND (Legajo = @LEGAJO)";
            SqlCommand sqlcmd = new SqlCommand(consulta);

            sqlcmd.Parameters.AddWithValue("@LEGAJO", legajo);

            return datos.ObtenerTabla(sqlcmd, "HorariosMedicos");
        }

        public int ChequearEliminado(string dni)
        {
            string consulta = "SELECT COUNT(*) FROM Medicos WHERE (Dni = @Dni) AND (Eliminado = 1)";
            SqlCommand sqlcmd = new SqlCommand(consulta);

            sqlcmd.Parameters.AddWithValue("@Dni", dni);
            return datos.EjecutarConsultaEscalar(sqlcmd);
        }

        public bool RestaurarMedicoEliminado(int dni)
        {
            string consulta = "UPDATE Medicos SET Eliminado = 0 WHERE (Dni = @DNI)";
            SqlCommand sqlcmd = new SqlCommand(consulta);

            sqlcmd.Parameters.AddWithValue("@DNI", dni);
            return datos.EjecutarConsulta(sqlcmd) > 0;
        }
    }
}