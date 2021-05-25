using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ProGym_BE;
using ProyGym_BE;
using ProyGym_BL;

namespace ProyGym_GUI
{
    public partial class InstructorInsertar : Form
    {
        InstructorBL objInstructorBL = new InstructorBL();
        InstructorBE objInstructorBE = new InstructorBE();
        public InstructorInsertar()
        {
            InitializeComponent();
        }

        private void btnGrabar_Click(object sender, EventArgs e)
        {

            try
            {
                //Codifique

                if (txtNombre.Text.Trim() == string.Empty)
                {
                    throw new Exception("El nombre es obligatorio");
                }

                //if (mskRuc.MaskFull == false)
                //{
                //    throw new Exception("El ruc debe tener 11 caracteres");
                //}


                objInstructorBE.IdDistrito = txtDistrito.Text.Trim();
                objInstructorBE.Usuario = txtUsuario.Text.Trim();
                objInstructorBE.Nombre = txtNombre.Text.Trim();
                objInstructorBE.Apellido = txtApellido.Text.Trim();
                objInstructorBE.Sexo = txtSexo.Text.Trim();
                objInstructorBE.NumDoc = txtNumDoc.Text.Trim();
                objInstructorBE.Celular = txtCelular.Text.Trim();
                objInstructorBE.Correo = txtCorreo.Text.Trim();
                objInstructorBE.Foto = txtFoto.Text.Trim();
                objInstructorBE.UsuRegistro = txtUsuReg.Text.Trim();


                if (objInstructorBL.InsertarInstructor(objInstructorBE) == true)
                {
                    this.Close();
                }
                else
                {
                    throw new Exception("No se inserto el registro. contacte con TI");
                }



            }
            catch (Exception ex)
            {
                MessageBox.Show("Se ha producido el error: " + ex.Message);
            }

        }
    }
}
