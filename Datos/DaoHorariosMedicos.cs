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

        public int AgregarHorariosMedico(List<HorarioMedico> listaHorarios)
        {
            string consulta = "";

            foreach (HorarioMedico horario in listaHorarios)
            {
                consulta += "INSERT INTO HorariosMedicos(IdDia, Legajo, HoraInicio, HoraFin, Eliminado) VALUES('" +
                    horario._IdDia + "', '" +
                    horario._Legajo + "', '" +
                    horario._HoraInicio + "', '" +
                    horario._HoraFin + "', '" +
                    horario._Eliminado + "'); ";
            }

            return datos.EjecutarConsulta(consulta);
        }
        public HorarioMedico traerHorariosMedico (string legajo)
        {
            horariosMedicos = datos.TraerHorarioMedicoPorLegajo(legajo);
            return horariosMedicos;
        }

        //public int ModificarHorarioMedicos(HorarioMedico horarioMedico)
        //{
        //    string consulta1 = "Delete From[HorariosMedicos] where Legajo =" + horarioMedico._Legajo.ToString() ;
        //    datos.EjecutarConsulta(consulta1);

        //    return this.AgregarHorarioMedico(horarioMedico);
        //}
    }
    
}
