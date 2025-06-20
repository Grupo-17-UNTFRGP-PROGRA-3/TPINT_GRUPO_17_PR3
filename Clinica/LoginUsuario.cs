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

        public int EsLoginValido()
        {

            if (!(_daoU.usuarioExiste(_usuario))) return -1; //SI NO EXISTE EL USUARIO, DEVUELVE -1

            Usuario usuario = _daoU.traerRegistro(_usuario);
            Usuario usuarioIngresado = new Usuario(_usuario,_password);

            if (usuario == usuarioIngresado) return 1; //SI LAS CREDENCIALES SON CORRECTAS, DEVUELVE 1

            return 0; //SI LAS CREDENCIALES SON INCORRECTAS, DEVUELVE 0
        }

        public bool EsAdmin()
        {
            Usuario usuario = _daoU.traerRegistro(_usuario);

            if (usuario.getLegajo() == "0000") return true;

            return false;
        }
    }
}
