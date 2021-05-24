using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;


using ProyGym_BE;
using ProyGym_BL;

namespace ProyGym_GUI
{
    public partial class frmLogin : Form
    {
        int intentos = 0;
        int tiempo = 20;

        //cRAMOS LAS INSTANCIAS DE USUARIOBE Y USUARIOBL
        UsuarioBE objUsuarioBE = new UsuarioBE();
        UsuarioBL objUsuarioBL = new UsuarioBL();

        public frmLogin()
        {
            InitializeComponent();
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {

            //MessageBox.Show("dsadas");
            if (txtLogin.Text.Trim() != "" & txtPassword.Text.Trim() != "")
            {
                // Obtenemos las credenciales de acuerdo al Login ingresado
                //Esta linea es la que iraaaaa
                objUsuarioBE = objUsuarioBL.ConsultarUsuario(txtLogin.Text,txtPassword.Text);


                //MessageBox.Show("FUERA" + objUsuarioBE.Rol_Usuario);

                // Si el login no existe....
                if (objUsuarioBE.Login_Usuario == null)
                {
                    //MessageBox.Show("NO EXISTE" + objUsuarioBE.Rol_Usuario);
                    //MessageBox.Show("Usuario no existe",
                    //"Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    intentos += 1;
                    //ValidaAccesos(intentos);
                }
                // Si el login existe, validamos el password....
                if (txtLogin.Text == objUsuarioBE.Login_Usuario & txtPassword.Text == objUsuarioBE.Pass_Usuario)
                {
                    //MessageBox.Show("EXISTE" + objUsuarioBE.Rol_Usuario);
                    // Si las credenciales son correctas se registran las mismas en la clase estatica clsCredenciales
                    // y se lanza el MDI Principal
                    this.Hide();
                    timer1.Enabled = false;
                    clsCredenciales.Usuario = objUsuarioBE.Login_Usuario;
                    clsCredenciales.Password = objUsuarioBE.Pass_Usuario;
                    clsCredenciales.Nombre = objUsuarioBE.Nom_Usuario;
                    clsCredenciales.Apellido = objUsuarioBE.Ape_Usuario;
                    clsCredenciales.Estado = objUsuarioBE.Est_Usuario.ToString();
                    clsCredenciales.Rol = objUsuarioBE.Rol_Usuario;
                    Form1 frmCliente = new Form1();
                    frmCliente.ShowDialog();
                }
            }
            else
            {
                MessageBox.Show("Usuario o Password obligatorios",
                    "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                intentos += 1;
                //ValidaAccesos(intentos);
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
           
            tiempo -= 1;
            this.Text = "Ingrese su login y contraseña. Le quedan...." + tiempo;
            if (tiempo == 0)
            {
                MessageBox.Show("Lo sentimos, sobrepaso el tiempo de espera",
                    "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Application.Exit();
            }
        }

        private void frmLogin_FormClosed(object sender, FormClosedEventArgs e)
        {
            timer1.Enabled = false;
            Application.Exit();

        }

        private void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
