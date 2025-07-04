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
            
            cantFilasMedico = dAOMedico.AgregarMedico(medico);

            if (cantFilasMedico > 0) return true;

            return false;
        }
        
        public bool ModificarMedico(Medico medico)
        {
            int cantFilasMedico = 0;
            
            cantFilasMedico = dAOMedico.ModificarMedico(medico);

            if (cantFilasMedico > 0) return true;
           
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
       
        public DataTable ListadoMedicosPorEspecialidad(int idEspecialidad)
        {
            DAOMedicos daoMedico = new DAOMedicos();

            return daoMedico.ListadoMedicosPorEspecialidad(idEspecialidad);
        }
        
        public DataTable ListadoDiasDeAtencionPorLegajo(string legajo)
        {
            DAOMedicos daoMedico = new DAOMedicos();

            return daoMedico.ListadoDiasDeAtencionPorLegajo(legajo);
        }
        
        public Medico ObtenerMedicoPorLegajo(string legajo)
        {
            AccesoDatos datos = new AccesoDatos();
            return datos.TraerMedicoPorLegajo(legajo);
        }
        
        public string ObtenerLegajoPorDNI(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            return datos.TraerLegajoMedicoPorDNI(dni);
        }
        
        public bool ExisteDNIMedico(int dni)
        {
            DAOMedicos daoMedico = new DAOMedicos();

            return daoMedico.ExisteDNIMedico(dni);
        }
        
        public int ChequearEliminado(string legajo)
        {
            DAOMedicos daoMedico = new DAOMedicos();
            return daoMedico.ChequearEliminado(legajo);
        }
        
        public bool RestaurarMedicoEliminado(string legajo)
        {
            DAOMedicos daoMedico = new DAOMedicos();
            return daoMedico.RestaurarMedicoEliminado(legajo);
        }
    }
}
