using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clinica
{
    public class NegocioMedico
    {
        public bool AgregarMedico ()
        {
            /*no me dio el tiempo para armar este, perdon :( 
            
            - Pablo
             */
        }

        public bool ExisteLegajo(int legajo)
        {
            AccesoDatos datos = new AccesoDatos();

            return datos.ExisteLegajo(legajo);
        }
    }
}
