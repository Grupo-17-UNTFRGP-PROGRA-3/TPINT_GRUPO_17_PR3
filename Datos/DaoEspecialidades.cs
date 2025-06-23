using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class DaoEspecialidades
    {
        AccesoDatos datos = new AccesoDatos();
        Especialidad especialidad = new Especialidad();

        public DataTable ListadoEspecialidades()
        {
            string consulta = "SELECT * FROM Especialidades WHERE Eliminado = 0";
            DataTable dt = new DataTable();
            dt = datos.ObtenerTabla(consulta, "Especialidades");
            return dt;
        }
    }
}
