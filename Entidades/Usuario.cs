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
        private string _usuario;
        private string _pass;
        private string _legajo;

        public Usuario() { }
        public Usuario(string usuario, string pass, string legajo)
        {
            try
            {
                setLegajo(legajo);
            }
            catch (ArgumentException ex)
            {
                string error = ex.Message;
            }
            setUsuario(usuario);
            setPass(pass);
        }
        public Usuario(string usuario, string pass)
        {
            setUsuario(usuario);
            setPass(pass);
        }
        public void setLegajo(string leg)
        {
            if (legajoValido(leg))
            {
                _legajo = leg;
            }
            else
            {
                throw new ArgumentException("Formato de legajo inválido. Deben ser 4 caracteres alfanuméricos");
            }
        }
        public string getLegajo()
        {  return _legajo; }
        private bool legajoValido(string leg)
        {
            string patron = @"[A-Z0-9]{4}";
            return Regex.IsMatch(leg, patron);
        }

        private void setUsuario(string usuario) { _usuario = usuario; }
        private void setPass(string pass) { _pass = pass; }

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
