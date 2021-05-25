using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProGym_BE
{
    public class InstructorBE
    {
        private String idDistrito;
        private String usuario;
        private String nombre;
        private String apellido;
        private String sexo;
        private String numDoc;
        private String celular;
        private String correo;
        private String foto;
        private String usuRegistro;

        public string IdDistrito { get => idDistrito; set => idDistrito = value; }
        public string Usuario { get => usuario; set => usuario = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Sexo { get => sexo; set => sexo = value; }
        public string NumDoc { get => numDoc; set => numDoc = value; }
        public string Celular { get => celular; set => celular = value; }
        public string Correo { get => correo; set => correo = value; }
        public string Foto { get => foto; set => foto = value; }
        public string UsuRegistro { get => usuRegistro; set => usuRegistro = value; }
    }
}
