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
            SqlDataReader sqlDR;
            string usuarioTraer = $"select * from Usuario where Usuario = '{usuario}'";
            sqlDR = _datos.ConsultaLectura(usuarioTraer);
            if (sqlDR.Read())
            {
                Usuario user = new Usuario(sqlDR["Usuario"].ToString(), sqlDR["Password"].ToString(), sqlDR["Legajo"].ToString());
                _usuario = user;
            }
            return _usuario;
        }
    }
}
