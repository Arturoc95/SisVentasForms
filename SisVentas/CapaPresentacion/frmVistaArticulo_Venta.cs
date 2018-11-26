using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmVistaArticulo_Venta : Form
    {
        public frmVistaArticulo_Venta()
        {
            InitializeComponent();
        }

        private void frmVistaArticulo_Venta_Load(object sender, EventArgs e)
        {

        }

        //Metodo ocultar columnas
        private void OcultarColumnas()
        {
            this.dataListado.Columns[0].Visible = false;
            this.dataListado.Columns[1].Visible = false;
        }

        //Buscar BuscarNombre
        private void MostrarArticuloVentaNombre()
        {
            this.dataListado.DataSource = NVenta.MostrarArticuloVentaNombre(this.txtBuscar.Text);
            this.OcultarColumnas();
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataListado.Rows.Count);
        }


        //Buscar BuscarCodigo
        private void MostrarArticuloVentaCodigo()
        {
            this.dataListado.DataSource = NVenta.MostrarArticuloVentaCodigo(this.txtBuscar.Text);
            this.OcultarColumnas();
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataListado.Rows.Count);
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if(cbBuscar.Text.Equals("Codigo"))
            {
                this.MostrarArticuloVentaCodigo();
            }
            else if (cbBuscar.Text.Equals("Nombre"))
            {
                this.MostrarArticuloVentaNombre();
            }
        }

        private void dataListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataListado_DoubleClick(object sender, EventArgs e)
        {
            frmVenta form = frmVenta.GetInstancia();
            string par1, par2;
            decimal par3, par4;
            int par5;
            DateTime par6;
            par1 = Convert.ToString(this.dataListado.CurrentRow.Cells["IdDetalleIngreso"].Value);
            par2 = Convert.ToString(this.dataListado.CurrentRow.Cells["Nombre"].Value);
            par3 = Convert.ToDecimal(this.dataListado.CurrentRow.Cells["PrecioCompra"].Value);
            par4 = Convert.ToDecimal(this.dataListado.CurrentRow.Cells["PrecioVenta"].Value);
            par5 = Convert.ToInt32(this.dataListado.CurrentRow.Cells["StockActual"].Value);
            par6 = Convert.ToDateTime(this.dataListado.CurrentRow.Cells["FechaVencimiento"].Value);
            form.setArticulo(par1, par2, par3, par4, par5, par6);
            this.Hide();

        }
    }
}
