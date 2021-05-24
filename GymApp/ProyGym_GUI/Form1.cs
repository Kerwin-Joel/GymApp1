using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace ProyGym_GUI
{
    public partial class Form1 : Form
    {
        TimeSpan horaentrada = new TimeSpan();
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            lblSaludo.Text = $"Bienvenido: {clsCredenciales.Nombre} {clsCredenciales.Apellido}";
            horaentrada = DateTime.Now.TimeOfDay;

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            this.Text = "Super Gym da la hora" + DateTime.Now;

            lblSesion.Text = "Tiempo de sesion:" +
                DateTime.Now.TimeOfDay.Subtract(horaentrada).ToString().Substring(0, 8);
        }

        private void toolStripStatusLabel2_Click(object sender, EventArgs e)
        {

        }
    }
}
