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

        public int ModificarHorariosMedico(string legajo, List<HorarioMedico> listaHorarios)
        {
            string consulta = "";
            foreach (HorarioMedico horario in listaHorarios)
            {
                consulta += "UPDATE HorariosMedicos SET " +
                    "HoraInicio = '" + horario._HoraInicio + "', " +
                    "HoraFin = '" + horario._HoraFin + "', " +
                    "Eliminado = '" + horario._Eliminado + "' " +
                    "WHERE Legajo = '" + legajo + "' AND IdDia = '" + horario._IdDia + "'; ";
            }

            return datos.EjecutarConsulta(consulta);
        }

        public List<HorarioMedico> TraerListaHorariosMedicosPorLegajo(string legajo)
        {
            return datos.TraerListaHorariosMedicoPorLegajo(legajo);
        }

        public HorarioMedico traerHorariosMedico (string legajo)
        {
            horariosMedicos = datos.TraerHorarioMedicoPorLegajo(legajo);
            return horariosMedicos;
        }
    }
    
}
