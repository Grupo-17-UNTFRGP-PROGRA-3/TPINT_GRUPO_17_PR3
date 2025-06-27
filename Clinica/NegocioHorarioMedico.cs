using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clinica
{
    public class NegocioHorarioMedico
    {
        DaoHorarioMedico dao = new DaoHorarioMedico();
        //public bool AgregarHorarioMedico(int IdDia, string Legajo, string HoraInicio, string HoraFin)
        //{
        //    int cantFilas = 0;
        //    HorarioMedico horarioMedico = new HorarioMedico();
        //    horarioMedico._IdDia = IdDia;
        //    horarioMedico._Legajo = Legajo;
        //    horarioMedico._HoraInicio = HoraInicio;
        //    horarioMedico._HoraFin = HoraFin;

        //    cantFilas = dao.AgregarHorarioMedico(horarioMedico);

        //    if (cantFilas == 1)
        //    {
        //        return true;
        //    }
        //    else
        //    {
        //        return false;
        //    }
        //}

        //public bool ModificarHorarioMedico(int IdDia, string Legajo, string HoraInicio, string HoraFin)
        //{
        //   HorarioMedico horMed = new HorarioMedico();
        //    horMed._IdDia = IdDia;
        //    horMed._Legajo = Legajo;
        //    horMed._HoraInicio = HoraInicio;
        //    horMed._HoraFin = HoraFin;

        //    int filasAfectadas = dao.ModificarHorarioMedicos(horMed);

        //    if (filasAfectadas == 1)
        //    {
        //        return true;
        //    }
        //    else
        //    {
        //        return false;
        //    }
        //}

        public HorarioMedico ObtenerHorarioMedicoPorLegajo(string legajo)
        {
            HorarioMedico horMed = null;
            horMed = dao.traerHorariosMedico(legajo);

            return horMed;
        }
    }
}
