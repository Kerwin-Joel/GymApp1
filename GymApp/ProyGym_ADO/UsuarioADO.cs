using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ProyGym_BE;
using System.Data;
using System.Data.SqlClient;

namespace ProyGym_ADO
{
    public class UsuarioADO
    {

        // Insumos.....
        Conexion MiConexion = new Conexion();
        SqlConnection cnx = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dtr;
        SqlDataAdapter ada;



        public UsuarioBE ConsultarUsuario(String strLogin, String strPassword)
        {
            UsuarioBE objUsuarioBE = new UsuarioBE();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_LOGIN";
            try
            {
                //Codifique
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@usuario", strLogin);
                cmd.Parameters.AddWithValue("@contrasena", strPassword);

                //ejecutamos
                cnx.Open();
                dtr = cmd.ExecuteReader();

                if (dtr.HasRows == true)
                {
                    dtr.Read();
                    objUsuarioBE.Login_Usuario = dtr["usuario"].ToString();
                    objUsuarioBE.Pass_Usuario = dtr["contrasena"].ToString();
                    objUsuarioBE.Nom_Usuario= dtr["nombre"].ToString();
                    objUsuarioBE.Ape_Usuario = dtr["apellido"].ToString();
                    objUsuarioBE.Rol_Usuario = dtr["idRol"].ToString();
                    objUsuarioBE.Dni_Usuario = dtr["numDoc"].ToString();
                    objUsuarioBE.Est_Usuario = Convert.ToInt16(dtr["estado"]);
                    objUsuarioBE.Fec_Registro = Convert.ToDateTime(dtr["fechaRegis"].ToString());
                    objUsuarioBE.Usu_Registro = dtr["estado"].ToString();

                }
                dtr.Close();
                return objUsuarioBE;


            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (cnx.State == ConnectionState.Open)
                {
                    cnx.Close();
                }

            }

        }




    }
}
