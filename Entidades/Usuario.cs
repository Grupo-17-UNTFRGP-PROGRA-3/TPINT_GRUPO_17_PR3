using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        public string _usuario;
        public string _pass;
        public int _legajo;

        public Usuario() { }

        public Usuario(string usuario)
        {
            _usuario = usuario;
        }
        public Usuario(string usuario, string pass, int legajo)
        {
            setLegajo(legajo);
            setUsuario(usuario);
            setPass(pass);
        }
        public Usuario(string usuario, string pass)
        {
            setUsuario(usuario);
            setPass(pass);
        }
        public void setLegajo(int leg) { _legajo = leg; }
        public int getLegajo()
        {  return _legajo; }
        private void setUsuario(string usuario) { _usuario = usuario; }
        private void setPass(string pass) { _pass = pass; }
        public string getUsuario() { return _usuario; }
        public string getPass() { return _pass; }

        public static bool operator ==(Usuario a, Usuario b)
        { 
            if (a._pass == b._pass && a._usuario == b._usuario)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool operator !=(Usuario a, Usuario b)
        {
            if (!(a._pass == b._pass && a._usuario == b._usuario))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
