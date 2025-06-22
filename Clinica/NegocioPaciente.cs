using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Clinica
{
    public class NegocioPaciente
    {
        DAOPacientes dAO = new DAOPacientes();
        public bool AgregarPaciente(int DNI, string Nombre, string Apellido, bool Sexo, int IDNac, string FechaNac, string Direccion, string Email, string Telefono, int IdProv, int IdLoc, bool Eliminido)
        {
            int cantFilas = 0;
            Paciente paciente = new Paciente();
            paciente._DNI = DNI;
            paciente._Nombre = Nombre;
            paciente._Apellido = Apellido;
            paciente._Sexo = Sexo;
            paciente._IdNacionalidad = IDNac;
            paciente._FechaNacimiento = FechaNac;
            paciente._Direccion = Direccion;
            paciente._Email = Email;
            paciente._Telefono = Telefono;
            paciente._IdProvincia = IdProv;
            paciente._IdLocalidad = IdLoc;
            paciente._Eliminado = Eliminido;

            cantFilas = dAO.AgregarPaciente(paciente);

            if (cantFilas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool ExisteDNI(int dni)
        {
            AccesoDatos datos = new AccesoDatos();
            return datos.ExisteDNI(dni);
        }

        public DataTable ListadoPacientes()
        {
            DataTable dt = new DataTable();
            dt = dAO.ListadoPacientes();
            return dt;
        }
        public DataTable ListadoPacientesJoined()
        {
            DataTable dt = new DataTable();
            dt = dAO.ListadoPacientesJoined();
            return dt;
        }

        public bool EliminarPaciente(int dni)
        {
            AccesoDatos datos = new AccesoDatos();
            return dAO.EliminarPaciente(dni);
        }


    }
}
