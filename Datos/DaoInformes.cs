using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class DaoInformes
    {
        AccesoDatos _datos = new AccesoDatos();
        Informe _informe = new Informe();
        DaoInformes() { }

        public Informe PacientesPorMedico (DateTime fechaInicio, DateTime fechaFin)
        {
            DataTable dt = new DataTable(); 
            _datos = new AccesoDatos();
            string consulta = "";
            string tabla = "";
            _informe._dt = _datos.ObtenerTabla(consulta, tabla);
            return _informe;
        }

    }
}
