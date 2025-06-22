using Datos;
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
