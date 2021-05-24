using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyGym_BE
{
    public class UsuarioBE
    {
        private String mvarlogin_usuario;
        private String mvarpass_usuario;
        private String mvarnomb_usuario;
        private String mvarape_usuario;
        private String mvarrol_usuario;
        private String mvardni_usuario;
        private Int16 mvaresta_usuario;
        private DateTime mvarfecha_registro;
        
        private String mvarusu_registro;
        public String Login_Usuario
        {
            get { return mvarlogin_usuario; }
            set { mvarlogin_usuario = value; }
        }
        public String Pass_Usuario
        {
            get { return mvarpass_usuario; }
            set { mvarpass_usuario = value; }
        }
        public String Nom_Usuario
        {
            get { return mvarnomb_usuario; }
            set { mvarnomb_usuario = value; }
        }
        public String Ape_Usuario
        {
            get { return mvarape_usuario; }
            set { mvarape_usuario = value; }
        }
        public String Rol_Usuario
        {
            get { return mvarrol_usuario; }
            set { mvarrol_usuario = value; }
        }
        public String Dni_Usuario
        {
            get { return mvardni_usuario; }
            set { mvardni_usuario = value; }
        }
        public Int16 Est_Usuario
        {
            get { return mvaresta_usuario; }
            set { mvaresta_usuario = value; }
        }
        public DateTime Fec_Registro
        {
            get { return mvarfecha_registro; }
            set { mvarfecha_registro = value; }
        }
        public String Usu_Registro
        {
            get { return mvarusu_registro; }
            set { mvarusu_registro = value; }
        }

    }
}
