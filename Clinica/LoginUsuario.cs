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
        DaoUsuarios _daoU = new DaoUsuarios();
        string _usuario;
        string _password;

        public LoginUsuario() { }
        public LoginUsuario(string usuario, string pass)
        {
           _usuario = usuario;
           _password = pass;
        }

        public bool EsLoginValido()
        {

            if (!(_daoU.usuarioExiste(_usuario))) return false;

            Usuario usuario = _daoU.traerRegistro(_usuario);
            Usuario usuarioIngresado = new Usuario(_usuario,_password);

            if (usuario == usuarioIngresado) return true;

            return false; 
        }

        public bool EsAdmin()
        {
            Usuario usuario = _daoU.traerRegistro(_usuario);

            if (usuario.getLegajo() == "0000") return true;

            return false;
        }
    }
}
