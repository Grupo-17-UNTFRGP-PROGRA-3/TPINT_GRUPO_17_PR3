using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Clinica
{
    public class NegocioUsuario
    {
        DaoUsuarios _daoU = new DaoUsuarios();
        Usuario _usuario = new Usuario();

        public NegocioUsuario() { }
        
        public NegocioUsuario(Usuario usuario)
        {
           _usuario = usuario;
        }
        public void setUsuario(Usuario usuario)
        {
            _usuario = usuario;
        }
        public bool ExisteCuenta(string legajo)
        {
            if (_daoU.cuentaExiste(legajo)) return true;

            return false;
        }
        public int EsLoginValido()
        {

            if (!(_daoU.usuarioExiste(_usuario._usuario.ToString()))) return -1; //SI NO EXISTE EL USUARIO, DEVUELVE -1

            Usuario usuario = _daoU.traerRegistro(_usuario._usuario.ToString());
            Usuario usuarioIngresado = new Usuario(_usuario._usuario.ToString(),_usuario._pass.ToString());

            if (usuario == usuarioIngresado) return 1; //SI LAS CREDENCIALES SON CORRECTAS, DEVUELVE 1

            return 0; //SI LAS CREDENCIALES SON INCORRECTAS, DEVUELVE 0
        }
        public bool EsAdmin()
        {
            Usuario usuario = _daoU.traerRegistro(_usuario._usuario.ToString());

            if (usuario.getLegajo() == 0) return true;

            return false;
        }
        public bool AgregarCuenta(Usuario usuario)
        {
            if (_daoU.agregarCuenta(usuario) == 1) return true;

            return false;
        }
        public bool ModificarUsuario(string usuario,string Pass,int legajo)
        {
            if(_daoU.ModificarUsuario(usuario,Pass,legajo) == 1) return true;
            return false;
        }
        public bool existeUsuario(string usuario)
        {
           return _daoU.usuarioExiste(usuario);
        }

        public DataTable ListadoUsuarios()
        {
            DataTable dt = new DataTable();
            dt = _daoU.ListadoUsuarios();
            return dt;
        }

        public Usuario ObtenerUsuarioPorLegajo(int legajo) { 
            AccesoDatos datos = new AccesoDatos();
            return datos.traerUsuarioPorNombreUsuario(legajo);
        }
    }
}
