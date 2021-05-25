using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using System.Data;
using System.Data.SqlClient;
using ProyGym_BE;
using ProGym_BE;

namespace ProyGym_ADO
{
    public class InstructorADO
    {
        Conexion MiConexion = new Conexion();
        SqlConnection cnx = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dtr;
        SqlDataAdapter ada;

        public Boolean InsertarInstructor(InstructorBE objInstructorBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_InsertarInstructor";
            //Agregamos parametros 
            try
            {
                //Codifique
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@idDistrito",objInstructorBE.IdDistrito);
                cmd.Parameters.AddWithValue("@usuario", objInstructorBE.Usuario);
                cmd.Parameters.AddWithValue("@nombre", objInstructorBE.Nombre);
                cmd.Parameters.AddWithValue("@apellido", objInstructorBE.Apellido);
                cmd.Parameters.AddWithValue("@sexo", objInstructorBE.Sexo);
                cmd.Parameters.AddWithValue("@numDoc", objInstructorBE.NumDoc);
                cmd.Parameters.AddWithValue("@celular", objInstructorBE.Celular);
                cmd.Parameters.AddWithValue("@correo", objInstructorBE.Correo);
                cmd.Parameters.AddWithValue("@foto", objInstructorBE.Foto);
                cmd.Parameters.AddWithValue("@usuRegistro", objInstructorBE.UsuRegistro);

                cnx.Open();
                cmd.ExecuteNonQuery();
                return true;

            }
            catch (SqlException x)
            {
                throw new Exception(x.Message);
                return false;
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
