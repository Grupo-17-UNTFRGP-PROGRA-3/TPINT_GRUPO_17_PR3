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
            string consulta = "INSERT INTO Medicos(Legajo, DNI, Nombre, Apellido, Sexo, IdNacionalidad, FechaNacimiento, Direccion, Email," +
                " Telefono, IdEspecialidad, IdProvincia,IdLocalidad, Eliminado) VALUES('" +
             medico._Legajo + "', '" +
             medico._DNI + "', '" +
             medico._Nombre + "', '" +
             medico._Apellido + "', '" +
             medico._Sexo + "', '" +
             medico._IdNacionalidad + "', '" +
             medico._FechaNacimiento + "', '" +
             medico._Direccion + "', '" +
             medico._Email + "', '" +
             medico._Telefono + "', '" +
             medico._IdEspecialidad + "', '" +
             medico._IdProvincia + "', '" +
             medico._IdLocalidad + "', '" +
             medico._Eliminado + "')";

            return datos.EjecutarConsulta(consulta);
        }

        public bool EliminarMedico(string legajo)
        {
            string consulta = "UPDATE Medicos SET Eliminado = 1 WHERE Legajo = " + legajo;
            return datos.EjecutarConsulta(consulta) > 0;
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
            string consulta = "SELECT M.Legajo, M.Dni, M.Nombre, M.Apellido, E.Descripcion AS 'Especialidad', M.FechaNacimiento, " +
                "CASE WHEN Sexo = 0 THEN 'Masculino' ELSE 'Femenino' END AS 'Sexo' " +
                "FROM Medicos M " +
                "INNER JOIN Especialidades E ON M.IdEspecialidad = E.Id " +
                "WHERE M.Eliminado = 0 AND M.Legajo != '0000'";
            DataTable dt = new DataTable();
            dt = datos.ObtenerTabla(consulta, "Medicos");
            return dt;
        }

        public int ModificarMedico(string leg, Medico medico)
        {
            string consulta = @"UPDATE [dbo].[Medicos] SET [Legajo] = @Legajo, [Dni] = @Dni, [Nombre] = @Nombre, [Apellido] = @Apellido, [Sexo] = @Sexo, " +
                " [IdNacionalidad] = @IdNacionalidad, [FechaNacimiento] = @FechaNacimiento, [Direccion] = @Direccion, [Email] = @Email," +
                " [Telefono] = @Telefono, [IdEspecialidad] = @IdEspecialidad, [IdProvincia] = @IdProvincia, [IdLocalidad] = @IdLocalidad " +
                "WHERE [Legajo] = @Legajo";

            List<SqlParameter> parametros = new List<SqlParameter>
            {
            new SqlParameter("@Legajo", leg),
            new SqlParameter("@Dni", medico._DNI ),
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
    }
}