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
        private readonly DAOMedicos dAOMedico = new DAOMedicos();
        private readonly DaoHorarioMedico dAOHorario = new DaoHorarioMedico();
        public bool AgregarMedico(Medico medico)
        {
            int cantFilasMedico = 0;
            int cantFilasHorarios = 0;

            cantFilasMedico = dAOMedico.AgregarMedico(medico);

            if (cantFilasMedico > 0)
            {
                cantFilasHorarios = dAOHorario.AgregarHorariosMedico(medico._Horarios);
                return cantFilasHorarios > 0;
            }

            return false;
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

            cantFilas = dAOMedico.ModificarMedico(Legajo, medico);

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
            return dAOMedico.EliminarMedico(legajo);
        }

        public DataTable ListadoMedicosJoined()
        {
            DataTable dt = new DataTable();
            dt = dAOMedico.ListadoMedicosJoined();
            return dt;
        }

        public DataTable ListadoMedicos()
        {
            DataTable dt = new DataTable();
            dt = dAOMedico.ListadoMedicos();
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
