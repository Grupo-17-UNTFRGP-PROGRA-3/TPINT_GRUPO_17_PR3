using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;


namespace Clinica
{
    public class NegocioEspecialidad
    {
        public DataTable GetTable()
        {
            DaoEspecialidades dao = new DaoEspecialidades();

            return dao.ListadoEspecialidades();
        }
    }
}
