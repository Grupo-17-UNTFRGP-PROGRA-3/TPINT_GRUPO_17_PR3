using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class DaoUsuarios
    { 
        Usuario _usuario = new Usuario();
        AccesoDatos _datos = new AccesoDatos();
        public DaoUsuarios() { }

        public Usuario traerRegistro(string usuario)
        {
            if (usuarioExiste(usuario))
            {
                string usuarioTraer = $"select * from Usuarios where Usuario = '{usuario}'";
                _usuario = _datos.ConsultaLecturaUsuario(usuarioTraer);
                
            }
            return _usuario;
        }

        public bool usuarioExiste(string usuario)
        {
        
            if (_datos.Existe("Usuarios", "Usuario", usuario)) return true;

            return false;
        }
        public bool cuentaExiste(string legajo)
        {

            if (_datos.Existe("Usuarios", "Legajo", legajo)) return true;

            return false;
        }
        public int agregarCuenta(Usuario usuario)
        {
            string consulta = "INSERT INTO Usuarios(Usuario, Password, Legajo, Eliminado) VALUES ('" +
                usuario._usuario.ToString() + "', '" +
                usuario._pass.ToString() + "', '" +
                usuario._legajo.ToString() + "', 0)";

            return _datos.EjecutarConsulta(consulta);
        }
    }
}
