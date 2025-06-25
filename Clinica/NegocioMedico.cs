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
        public bool AgregarMedico(int DNI, string Nombre, string Apellido, bool Sexo, int IDNac, DateTime FechaNac, string Direccion, string Email, string Telefono, int IdProv, int IdLoc, bool Eliminido, string Legajo, int Especialidad)
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

        public bool ModificarMedico(string Legajo, int Dni, string Nombre, string Apellido, bool Sexo, int IdNacionalidad,
                            DateTime FechaNacimiento, string Direccion, string Email, string Telefono, int IdEspecialidad,
                            int IdProvincia, int IdLocalidad, bool Eliminado)
        {
            int cantFilas = 0;
            Medico medico = new Medico();

            medico._Legajo = Legajo;
            medico._DNI = Dni;
            medico._Nombre = Nombre;
            medico._Apellido = Apellido;
            medico._Sexo = Sexo;
            medico._IdNacionalidad = IdNacionalidad;
            medico._FechaNacimiento = FechaNacimiento;
            medico._Direccion = Direccion;
            medico._Email = Email;
            medico._Telefono = Telefono;
            medico._IdEspecialidad = IdEspecialidad;
            medico._IdProvincia = IdProvincia;
            medico._IdLocalidad = IdLocalidad;
            medico._Eliminado = Eliminado;

            cantFilas = dAO.ModificarMedico(Legajo, medico);

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

        public Medico ObtenerMedicoPorLegajo(string legajo)
        {
            AccesoDatos datos = new AccesoDatos();
            return datos.TraerMedicoPorLegajo(legajo);
        }

        public bool ExisteDNI(int dni)
        {
            AccesoDatos datos = new AccesoDatos();
            return datos.ExisteDNI(dni);
        }
    }
}
