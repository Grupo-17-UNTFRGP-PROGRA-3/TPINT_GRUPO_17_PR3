using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Informe
    {
        public DataTable _dt = new DataTable();
        public DateTime _FechaInicio;
        public DateTime _FechaFin;
        public string[] _descripcion = new string[4];

        public Informe() { }

        public Informe(DateTime inicio, DateTime fin)
        { 
            _FechaInicio = inicio;
            _FechaFin = fin;
        }
        public void CargarDatosDescripcion(string descColumna, string valor)
        {
            try
            {

            this._descripcion[0] = (this._dt.Rows[0][descColumna]).ToString();
            this._descripcion[1] = (this._dt.Rows[1][descColumna]).ToString();
            this._descripcion[2] = (this._dt.Rows[2][descColumna]).ToString();
            this._descripcion[3] = "El TOP 3 en "+ valor +" fueron: " + this._descripcion[0] + ", " + this._descripcion[1]+ " y " + this._descripcion[2];
            }
            catch 
            {
                _descripcion[3] = "No se encontraron datos";
            }
        }
    }
}
