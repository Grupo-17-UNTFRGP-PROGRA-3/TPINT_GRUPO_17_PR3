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
    public class DAOTurnos
    {
        AccesoDatos _datos =new AccesoDatos();
        Turno turno = new Turno();

        public int AgregarTurno(Turno turno)
        {
            string consulta = "INSERT INTO Turnos (LegajoMedico, DniPaciente, Fecha, IdHorario, Estado, Observacion, Eliminado) " +
            "VALUES (@LegajoMedico, @DniPaciente, @Fecha, @IdHorario, @Estado, @Observacion, 0)";
            SqlCommand cmd = new SqlCommand(consulta);
            cmd.Parameters.AddWithValue("@LegajoMedico", turno._LegajoMedico);
            cmd.Parameters.AddWithValue("@DniPaciente", turno._DniPaciente);
            cmd.Parameters.AddWithValue("@Fecha", turno._Fecha);
            cmd.Parameters.AddWithValue("@IdHorario", turno._IdHorario);
            cmd.Parameters.AddWithValue("@Estado", turno._Estado);
            cmd.Parameters.AddWithValue("@Observacion", turno._Observacion ?? "");
            return _datos.EjecutarConsulta(cmd);
        }


        public DataTable ListadoTurnos()
        {
            string consulta = @"SELECT T.Fecha, H.Horario AS Hora, E.Descripcion AS Especialidad,
                               M.Nombre + ' ' + M.Apellido AS Medico,
                               P.Nombre + ' ' + P.Apellido AS Paciente,
                               T.Estado
                        FROM Turnos T
                        JOIN Medicos M ON T.LegajoMedico = M.Legajo
                        JOIN Pacientes P ON T.DniPaciente = P.Dni
                        JOIN Especialidades E ON M.IdEspecialidad = E.Id
                        JOIN Horarios H ON T.IdHorario = H.Id
                        WHERE T.Eliminado = 0";
            return _datos.ObtenerTabla(consulta, "Turnos");
        }

        public DataTable FiltrarTurnos(string filtro)
        {
            string consulta = $@"SELECT T.Fecha, H.Horario AS Hora, E.Descripcion AS Especialidad,
                                M.Nombre + ' ' + M.Apellido AS Medico,
                                P.Nombre + ' ' + P.Apellido AS Paciente,
                                T.Estado
                         FROM Turnos T
                         JOIN Medicos M ON T.LegajoMedico = M.Legajo
                         JOIN Pacientes P ON T.DniPaciente = P.Dni
                         JOIN Especialidades E ON M.IdEspecialidad = E.Id
                         JOIN Horarios H ON T.IdHorario = H.Id
                         WHERE T.Eliminado = 0 AND 
                               (P.Dni LIKE '%{filtro}%' OR 
                                M.Apellido LIKE '%{filtro}%' OR 
                                E.Descripcion LIKE '%{filtro}%')";
            return _datos.ObtenerTabla(consulta, "Turnos");
        }






    }
}
