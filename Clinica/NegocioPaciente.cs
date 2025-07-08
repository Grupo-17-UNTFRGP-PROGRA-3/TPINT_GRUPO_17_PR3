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

        public bool AgregarPaciente(Paciente paciente)
        {
            int cantFilas = 0;

            cantFilas = dAO.AgregarPaciente(paciente);

            return cantFilas == 1;
        }

        public bool ModificarPaciente(Paciente paciente)
        {
            int cantFilas = 0;

            cantFilas = dAO.ModificarPaciente(paciente);

            return cantFilas == 1;
        }

        public bool EliminarPaciente(int dni)
        {
            AccesoDatos datos = new AccesoDatos();
            return dAO.EliminarPaciente(dni);
        }

        public bool ExisteDNI(int dni)
        {
            DAOPacientes daoPacientes = new DAOPacientes();

            return daoPacientes.ExisteDNI(dni);
        }
        public Paciente traerPaciente(int dni)
        {
            Paciente paciente= new Paciente();
            DAOPacientes daoPacientes = new DAOPacientes();
            paciente = daoPacientes.traerPaciente(dni);
            return paciente;
        }
        public DataTable ListadoPacientes()
        {
            DataTable dt = new DataTable();
            dt = dAO.ListadoPacientes();
            return dt;
        }

        public DataTable ListadoPacientesNombreConDNI()
        {
            DAOPacientes daoPacientes = new DAOPacientes();

            return daoPacientes.ListadoPacientesNombreConDNI();
        }

        public DataTable ListadoPacientesJoined()
        {
            DataTable dt = new DataTable();
            dt = dAO.ListadoPacientesJoined();
            return dt;
        }

        public DataTable PacienteFiltradoPorDNI(int dni)
        {
            DataTable dt = new DataTable();
            dt = dAO.PacienteFiltradoPorDNI(dni);
            return dt;
        }

        public Paciente ObtenerPacientePorDNI(int dni)
        {
            AccesoDatos datos = new AccesoDatos();
            return datos.TraerPacientePorDNI(dni);
        }

        public int ChequearEliminado(int dni)
        {
            DAOPacientes daoPaciente = new DAOPacientes();

            return daoPaciente.ChequearEliminado(dni);
        }

        public bool RestaurarPacienteEliminado (int dni)
        {             
            DAOPacientes daoPaciente = new DAOPacientes();
            return daoPaciente.RestaurarPacienteEliminado(dni);
        }
    }
}
