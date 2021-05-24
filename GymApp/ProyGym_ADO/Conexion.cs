using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;


namespace ProyGym_ADO
{
    class Conexion
    {
        public String GetCnx()
        {
            string strCnx = ConfigurationManager.ConnectionStrings["Gym"].ConnectionString;
            if(object.ReferenceEquals(strCnx, string.Empty)) return string.Empty;
            else return strCnx;
        }
    }
}
