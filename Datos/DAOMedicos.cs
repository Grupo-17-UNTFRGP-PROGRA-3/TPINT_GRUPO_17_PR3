using System;
using System.Collections.Generic;
using System.Linq;
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
    }
}