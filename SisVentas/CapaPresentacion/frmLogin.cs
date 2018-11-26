﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
            LbHora.Text = DateTime.Now.ToString();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void frmLogin_Load(object sender, EventArgs e)
        {

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            LbHora.Text = DateTime.Now.ToString();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            DataTable Datos = CapaNegocio.NTrabajador.Login(this.txtUsuario.Text, this.txtPassword.Text);
            //Verificar si existe el usuario
            if (Datos.Rows.Count == 0)
            {
                MessageBox.Show("No tiene acceso al sistema", "Sistema de Ventas",MessageBoxButtons.OK,MessageBoxIcon.Error);

            }
            else
            {
                frmPrincipal frm = new frmPrincipal();
                frm.IdTrabajador = Datos.Rows[0][0].ToString();
                frm.Apellidos = Datos.Rows[0][1].ToString();
                frm.Nombre = Datos.Rows[0][2].ToString();
                frm.Acceso = Datos.Rows[0][3].ToString();

                frm.Show();
                this.Hide(); //Ocultar formulario


            }
        }

        private void LbHora_Click(object sender, EventArgs e)
        {

        }
    }
}
