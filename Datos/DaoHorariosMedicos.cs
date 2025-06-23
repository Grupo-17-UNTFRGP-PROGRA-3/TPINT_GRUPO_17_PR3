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
        public HorarioMedico traerHorariosMedico (int legajo)
        {
            horariosMedicos = datos.TraerHorarioMedicoPorLegajo(legajo);
            return horariosMedicos;
        }

        public int ModificarHorarioMedicos(HorarioMedico horarioMedico)
        {
            string consulta1 = "Delete From[HorariosMedicos] where Legajo =" + horarioMedico._Legajo.ToString() ;
            datos.EjecutarConsulta(consulta1);

            return this.AgregarHorarioMedico(horarioMedico);
        }
    }
    
}
