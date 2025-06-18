using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Clinica
{
    public class LoginUsuario
    {
        DaoUsuarios daoU = new DaoUsuarios();
        string _usuario;
        string _password;

        public LoginUsuario() { }
        public LoginUsuario(string usuario, string pass)
        {
           _usuario = usuario;
           _password = pass;
        }

       
    }
}
