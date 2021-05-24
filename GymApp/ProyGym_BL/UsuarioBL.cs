using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ProyGym_ADO;
using ProyGym_BE;
using System.Data;

namespace ProyGym_BL
{
    public class UsuarioBL
    {
        UsuarioADO objUsuarioADO = new UsuarioADO();

        public UsuarioBE ConsultarUsuario(String strLogin, String strPassword)
        {
            return objUsuarioADO.ConsultarUsuario(strLogin, strPassword);
        }
    }
}
