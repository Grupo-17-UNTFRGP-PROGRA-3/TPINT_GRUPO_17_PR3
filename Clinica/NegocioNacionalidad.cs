﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Clinica
{
    public class NegocioNacionalidad
    {
        public DataTable GetTable()
        {
            DaoNacionalidades dao = new DaoNacionalidades();
            return dao.ObtenerNacionalidad();
        }
         
    }
}
