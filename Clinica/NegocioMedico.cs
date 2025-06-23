using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clinica
{
    public class NegocioMedico
    {
        DAOMedicos dAO = new DAOMedicos();

        public bool AgregarMedico(int DNI, string Nombre, string Apellido, bool Sexo, int IDNac, string FechaNac, string Direccion, string Email, string Telefono, int IdProv, int IdLoc, bool Eliminido, int Legajo, int Especialidad)
        {
            int cantFilas = 0;
            Medico medico = new Medico();
            medico._DNI = DNI;
            medico._Nombre = Nombre;
            medico._Apellido = Apellido;
            medico._Sexo = Sexo;
            medico._IdNacionalidad = IDNac;
            medico._FechaNacimiento = FechaNac;
            medico._Direccion = Direccion;
            medico._Email = Email;
            medico._Telefono = Telefono;
            medico._IdProvincia = IdProv;
            medico._IdLocalidad = IdLoc;
            medico._Eliminado = Eliminido;
            medico._Legajo = Legajo;
            medico._IdEspecialidad = Especialidad;

            cantFilas = dAO.AgregarMedico(medico);

            if (cantFilas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool ExisteLegajo(string legajo)
        {
            AccesoDatos datos = new AccesoDatos();

            return datos.ExisteLegajo(legajo);
        }

        public bool EliminarMedico(string legajo)
        {
            AccesoDatos datos = new AccesoDatos();
            return dAO.EliminarMedico(legajo);
        }

        public DataTable ListadoMedicosJoined()
        {
            DataTable dt = new DataTable();
            dt = dAO.ListadoMedicosJoined();
            return dt;
        }

        public DataTable ListadoMedicos()
        {
            DataTable dt = new DataTable();
            dt = dAO.ListadoMedicos();
            return dt;
        }
    }
}
