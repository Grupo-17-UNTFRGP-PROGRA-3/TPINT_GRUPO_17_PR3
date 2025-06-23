using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class DaoHorarioMedico
    {
        AccesoDatos datos = new AccesoDatos();
        HorarioMedico horariosMedicos = new HorarioMedico();

        public int AgregarHorarioMedico(HorarioMedico horariosMedicos)
        {
            string consulta = "INSERT INTO HorariosMedicos(IdDia, Legajo, HoraInicio, HoraFin, Eliminado) VALUES('" +
                horariosMedicos._IdDia + "', '" +
                horariosMedicos._Legajo + "', '" +
                horariosMedicos._HoraInicio + "', '" +
                horariosMedicos._HoraFin + "', 0)";

            return datos.EjecutarConsulta(consulta);
        }
    }
    
}
