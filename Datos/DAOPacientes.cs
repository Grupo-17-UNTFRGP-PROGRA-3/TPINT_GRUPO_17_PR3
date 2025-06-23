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

        public DataTable ListadoPacientes()
        {
            string consulta = "SELECT * FROM Pacientes WHERE Eliminado = 0";
            DataTable dt = new DataTable();
            dt = datos.ObtenerTabla(consulta, "Pacientes");
            return dt;
        }

        public bool EliminarPaciente(int dni)
        {
            string consulta = "UPDATE Pacientes SET Eliminado = 1 WHERE DNI = " + dni;
            return datos.EjecutarConsulta(consulta) > 0;
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
    }
}
