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
        
            if (_datos.ExisteUsuario(usuario)) return true;

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
                usuario._pass.ToString() + "', " +
                usuario._legajo.ToString() + ", 0)";

            return _datos.EjecutarConsulta(consulta);
        }
        
        public int ModificarUsuario(string usuario, string Pass, int legajo)
        {
            string consulta = "UPDATE Usuarios SET " +
            "Usuario = @usuario, Password = @password " + "WHERE Legajo = @legajo";
            List<SqlParameter> parametros = new List<SqlParameter>
            {
            new SqlParameter("@usuario", usuario),
            new SqlParameter("@password",Pass),
            new SqlParameter("@legajo",legajo) };
            return _datos.EjecutarConsultaConParametros(consulta, parametros);
        }

        public DataTable ListadoUsuarios()
        {
            string consulta = "SELECT Usuario,Password,Legajo FROM Usuarios WHERE Eliminado = 0";
            DataTable dt = new DataTable();
            dt = _datos.ObtenerTabla(consulta, "Usuarios");
            return dt;
        }

        public Usuario TraerUsuarioPorNombre(string nombre)
        {
            AccesoDatos datos = new AccesoDatos();

            return datos.TraerUsuarioPorNombre(nombre);
        }
    }
}
