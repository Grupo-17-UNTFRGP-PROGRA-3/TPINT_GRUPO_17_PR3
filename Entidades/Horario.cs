﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Horario
    {
        public int _Id { get; set; }

        public TimeSpan _Horario { get; set; }

        public string _Descripcion { get; set; }

        public bool _Eliminado { get; set; }

        public Horario() { }
    }
}
