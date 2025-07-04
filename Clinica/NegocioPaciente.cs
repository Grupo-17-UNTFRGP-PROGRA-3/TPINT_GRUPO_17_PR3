﻿using System;
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

        public bool ModificarPaciente(int DNI, string Nombre, string Apellido, bool Sexo, int IDNac, string FechaNac, string Direccion, string Email, string Telefono, int IdProv, int IdLoc, bool Eliminido)
        {
            int cantFilas = 0;
            Paciente paciente = new Paciente();
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

            cantFilas = dAO.ModificarPaciente(DNI,paciente);

            if (cantFilas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
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
