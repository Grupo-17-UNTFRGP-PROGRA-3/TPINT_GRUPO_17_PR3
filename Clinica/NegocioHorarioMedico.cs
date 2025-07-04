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
        public bool AgregarHorarioMedico(HorarioMedico horarioMedico)
        {
            int cantFilas = dao.AgregarHorarioMedico(horarioMedico);

            if (cantFilas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool ModificarHorarioMedico(HorarioMedico horarioMedico)
        {
            int filasAfectadas = dao.ModificarHorarioMedico(horarioMedico);

            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public HorarioMedico ObtenerHorarioMedicoPorLegajoDia(string legajo, int dia)
        {
            HorarioMedico horMed = null;
            horMed = dao.traerHorarioMedico(legajo, dia);

            return horMed;
        }
    }
}
