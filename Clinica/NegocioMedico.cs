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

        public bool ModificarMedico(Medico medico)
        {
            int cantFilasMedico = 0;
            int cantFilasHorarios = 0;

            cantFilasMedico = dAOMedico.ModificarMedico(medico);

            if (cantFilasMedico == 1)
            {
                cantFilasHorarios = dAOHorario.ModificarHorariosMedico(medico._Legajo, medico._Horarios);
                return cantFilasHorarios > 0;
            }

            return false;
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

        public List<HorarioMedico> ObtenerHorariosMedicoPorLegajo(string legajo)
        {
            AccesoDatos datos = new AccesoDatos();
            return datos.TraerListaHorariosMedicoPorLegajo(legajo);
        }

        public bool ExisteDNI(int dni)
        {
            AccesoDatos datos = new AccesoDatos();
            return datos.ExisteDNI(dni);
        }
    }
}
