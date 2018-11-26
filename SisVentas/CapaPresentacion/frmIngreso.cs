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
    public partial class frmIngreso : Form
    {
        public int IdTrabajador;
        private bool IsNuevo;
        private DataTable dtDetalle;
        private decimal TotalPagado=0;

        private static frmIngreso _Instancia;

        public static frmIngreso GetInstancia()
        {
            if(_Instancia==null)
            {
                _Instancia = new frmIngreso();
            }
            return _Instancia;
        }

        public void SetProveedor(string idproveedor, string nombre)
        {
            this.txtIdProveedor.Text = idproveedor;
            this.txtProveedor.Text = nombre;
        }

        public void SetArticulo(string idarticulo, string nombre)
        {
            this.txtIdArticulo.Text = idarticulo;
            this.txtArticulo.Text = nombre;
        }




        public frmIngreso()
        {
            InitializeComponent();
            this.ttMensaje.SetToolTip(this.txtIdProveedor, "Seleccione el Proveedor.");
            this.ttMensaje.SetToolTip(this.txtSerie, "Ingrese la serie del comprobante.");
            this.ttMensaje.SetToolTip(this.txtCorrelativo, "Seleccione el numero del comprobante.");
            this.ttMensaje.SetToolTip(this.txtStock, "Ingrese la cantidad de compra.");
            this.ttMensaje.SetToolTip(this.txtArticulo, "Seleccione el Articulo de compra.");
            this.txtIdProveedor.Visible = false;
            this.txtIdArticulo.Visible = false;
            this.txtProveedor.ReadOnly = true;
            this.txtArticulo.ReadOnly = true;
        }


        //Mostrar mensaje  de confirmacion
        private void MensajeOk(string mensaje)
        {
            MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        //Mostrar mensaje de error
        private void MensajeError(string mensaje)
        {
            MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        //Limpiar todos los controles del formulario
        private void Limpiar()
        {
            this.txtIdIngreso.Text = string.Empty;
            this.txtIdProveedor.Text = string.Empty;
            this.txtProveedor.Text = string.Empty;
            this.txtSerie.Text = string.Empty;
            this.txtCorrelativo.Text = string.Empty;
            this.txtIVA.Text = string.Empty;
            this.lblTotalPagado.Text = "0,0";
            this.txtIVA.Text = "18";
            this.CrearTabla();

        }

        private void LimpiarDetalle()
        {
            this.txtIdArticulo.Text = string.Empty;
            this.txtArticulo.Text = string.Empty;
            this.txtStock.Text = string.Empty;
            this.txtPrecioCompra.Text = string.Empty;
            this.txtPrecioVenta.Text = string.Empty;

        }

        //Habilitar controles del formualrio
        private void Habilitar(bool valor)
        {
            this.txtIdIngreso.ReadOnly = !valor;
            this.txtSerie.ReadOnly = !valor;
            this.txtCorrelativo.ReadOnly = !valor;
            this.txtIVA.Enabled = valor;
            this.dtFecha.Enabled = valor;
            this.cbTipoComprobante.Enabled = valor;
            this.txtStock.ReadOnly = !valor;
            this.txtPrecioCompra.ReadOnly = !valor;
            this.txtPrecioVenta.ReadOnly = !valor;
            this.dtFechaProduccion.Enabled = valor;
            this.dtFechaVencimiento.Enabled = valor;

            this.btnBuscarArticulo.Enabled = valor;
            this.btnBuscarProveedor.Enabled = valor;
            this.btnAgregar.Enabled = valor;
            this.btnQuitar.Enabled = valor;

        }

        //Hablitar los botones
        private void Botones()
        {
            if (this.IsNuevo)
            {
                this.Habilitar(true);
                this.btnNuevo.Enabled = false;
                this.btnGuardar.Enabled = true;                
                this.btnCancelar.Enabled = true;
            }
            else
            {
                this.Habilitar(false);
                this.btnNuevo.Enabled = true;
                this.btnGuardar.Enabled = false;                
                this.btnCancelar.Enabled = false;
            }
        }

        //Metodo ocultar columnas
        private void OcultarColumnas()
        {
            this.dataListado.Columns[0].Visible = false;
            this.dataListado.Columns[0].Visible = false;
           
        }

        //Metodo mostrar Articulo
        private void Mostrar()
        {
            this.dataListado.DataSource = NIngreso.Mostrar();
            this.OcultarColumnas();
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataListado.Rows.Count);
        }

        //Buscar por fechas
        private void BuscarFechas()
        {
            this.dataListado.DataSource = NIngreso.BuscarFechas(this.dtFecha1.Value.ToString("dd/MM/yyyy"),
                this.dtFecha2.Value.ToString("dd/MM/yyyy"));
            this.OcultarColumnas();
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataListado.Rows.Count);
        }

        //Buscar por Mostrar Detalle
        private void MostrarDetalle()
        {
            this.datalistadoDetalle.DataSource = NIngreso.MostrarDetalle(this.txtIdIngreso.Text);
            
        }

        private void CrearTabla()
        {
            this.dtDetalle = new DataTable("Detalle");
            this.dtDetalle.Columns.Add("IdArticulo", System.Type.GetType("System.Int32"));
            this.dtDetalle.Columns.Add("Articulo", System.Type.GetType("System.String"));
            this.dtDetalle.Columns.Add("PrecioCompra", System.Type.GetType("System.Decimal"));
            this.dtDetalle.Columns.Add("PrecioVenta", System.Type.GetType("System.Decimal"));
            this.dtDetalle.Columns.Add("StockInicial", System.Type.GetType("System.Int32"));
            this.dtDetalle.Columns.Add("StockActual", System.Type.GetType("System.Int32"));
            this.dtDetalle.Columns.Add("FechaProduccion", System.Type.GetType("System.DateTime"));            
            this.dtDetalle.Columns.Add("FechaVencimiento", System.Type.GetType("System.DateTime"));
            this.dtDetalle.Columns.Add("SubTotal", System.Type.GetType("System.Decimal"));

            //Relacionar DatagridView con datatable
            this.datalistadoDetalle.DataSource = this.dtDetalle;





        }

        private void dateTimePicker2_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void frmIngreso_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            this.Mostrar();
            this.Habilitar(false);
            this.Botones();
            this.CrearTabla();
        }

        private void frmIngreso_FormClosing(object sender, FormClosingEventArgs e)
        {
            _Instancia = null;
        }

        private void btnBuscarProveedor_Click(object sender, EventArgs e)
        {
            frmVistaProveedor_Ingreso vista = new frmVistaProveedor_Ingreso();
            vista.ShowDialog();
        }

        private void btnBuscarArticulo_Click(object sender, EventArgs e)
        {
            frmVistaArtculo_Ingreso vista = new frmVistaArtculo_Ingreso();
            vista.ShowDialog();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.BuscarFechas();
        }

        private void dataListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == dataListado.Columns["Eliminar"].Index)
            {
                DataGridViewCheckBoxCell ChkEliminar = (DataGridViewCheckBoxCell)dataListado.Rows[e.RowIndex].Cells["Eliminar"];
                ChkEliminar.Value = !Convert.ToBoolean(ChkEliminar.Value);
            }
            Mostrar();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
                try
                {
                    DialogResult Opcion;
                    Opcion = MessageBox.Show("Realmente desea anular los registros", "Sistema de Ventas", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);

                    if (Opcion == DialogResult.OK)
                    {
                        string Codigo;
                        string Rpta = "";

                        foreach (DataGridViewRow row in dataListado.Rows)
                        {
                            if (Convert.ToBoolean(row.Cells[0].Value))
                            {
                                Codigo = Convert.ToString(row.Cells[1].Value);
                                Rpta = NIngreso.Anular(Convert.ToInt32(Codigo));

                                if (Rpta.Equals("OK"))
                                {
                                    this.MensajeOk("Se anulo correctamente el registro");
                                }
                                else
                                {
                                    this.MensajeError(Rpta);
                                }
                            }
                        }
                        this.Mostrar();
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message + ex.StackTrace);
                }
        }

        private void chkEliminar_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEliminar.Checked)
            {
                this.dataListado.Columns[0].Visible = true;
            }
            else
            {
                this.dataListado.Columns[0].Visible = false;
            }
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            this.IsNuevo = true;            
            this.Botones();
            this.Limpiar();
            this.Habilitar(true);
            this.txtSerie.Focus();
            this.LimpiarDetalle();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.IsNuevo = false;
            this.Botones();
            this.Limpiar();
            this.Habilitar(false);
            this.LimpiarDetalle();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string rpta = "";
                if (this.txtIdProveedor.Text == String.Empty || this.txtSerie.Text == String.Empty
                    || this.txtCorrelativo.Text == String.Empty || this.txtIVA.Text == String.Empty)
                {
                    MensajeError("Falta ingresar algunos datos, serán remarcados");
                    erroricono.SetError(txtIdProveedor, "Ingrese un valor");
                    erroricono.SetError(txtSerie, "Ingrese un valor");
                    erroricono.SetError(txtCorrelativo, "Ingrese un valor");
                    erroricono.SetError(txtIVA, "Ingrese un valor");
                }
                else
                {                  

                    if (this.IsNuevo)
                    {
                        rpta = NIngreso.Insertar(IdTrabajador, Convert.ToInt32(this.txtIdProveedor.Text),
                            dtFecha.Value,cbTipoComprobante.Text, txtSerie.Text, txtCorrelativo.Text,
                            Convert.ToDecimal(txtIVA.Text),"EMITIDO", dtDetalle);
                    }
                    
                    if (rpta.Equals("OK"))
                    {
                        if (this.IsNuevo)
                        {
                            this.MensajeOk("Se insertó de forma correcta el registro");
                        }
                       
                    }
                    else
                    {
                        this.MensajeError(rpta);
                    }
                    this.IsNuevo = false;
                    this.Botones();
                    this.Limpiar();
                    this.LimpiarDetalle();
                    this.Mostrar();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                string rpta = "";
                if (this.txtIdArticulo.Text == String.Empty || this.txtStock.Text == String.Empty
                    || this.txtPrecioCompra.Text == String.Empty || this.txtPrecioVenta.Text == String.Empty)
                {
                    MensajeError("Falta ingresar algunos datos, serán remarcados");
                    erroricono.SetError(txtIdArticulo, "Ingrese un valor");
                    erroricono.SetError(txtStock, "Ingrese un valor");
                    erroricono.SetError(txtPrecioCompra, "Ingrese un valor");
                    erroricono.SetError(txtPrecioVenta, "Ingrese un valor");
                }
                else
                {
                    bool Registrar = true;
                    foreach(DataRow row in dtDetalle.Rows)
                    {
                        if (Convert.ToInt32(row["IdArticulo"])==Convert.ToInt32(this.txtIdArticulo.Text))
                        {
                            Registrar = false;
                            this.MensajeError("Ya se encuentra el articulo en el detalle.");
                        }
                    }
                    if (Registrar)
                    {
                        decimal subtotal = Convert.ToDecimal(this.txtStock.Text) * Convert.ToDecimal(this.txtPrecioCompra.Text);
                        TotalPagado = TotalPagado + subtotal;
                        this.lblTotalPagado.Text = TotalPagado.ToString("·0.00#");

                        //Agregar detalle al datalistadodetalle
                        DataRow row = this.dtDetalle.NewRow();
                        row["IdArticulo"] = Convert.ToInt32(this.txtIdArticulo.Text);
                        row["Articulo"] = this.txtIdArticulo.Text;
                        row["PrecioCompra"] = Convert.ToDecimal(this.txtPrecioCompra.Text);
                        row["PrecioVenta"] = Convert.ToDecimal(this.txtPrecioVenta.Text);
                        row["StockInicial"] = Convert.ToInt32(this.txtStock.Text);
                        row["FechaProduccion"] = dtFechaProduccion.Value;
                        row["FechaVencimiento"] = dtFechaVencimiento.Value;
                        row["SubTotal"] = subtotal;
                        this.dtDetalle.Rows.Add(row);
                        this.LimpiarDetalle();
                    }

                    
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
        }

        private void btnQuitar_Click(object sender, EventArgs e)
        {
            try
            {
                int indicefila = this.datalistadoDetalle.CurrentCell.RowIndex;
                DataRow row = this.dtDetalle.Rows[indicefila];
                //Disminuir totalpagado
                this.TotalPagado = this.TotalPagado - Convert.ToDecimal(row["Subtotal"].ToString());
                this.lblTotalPagado.Text= TotalPagado.ToString("0.00#");
                //Remover fila
                this.dtDetalle.Rows.Remove(row);
            }
            catch(Exception Ex)
            {
                MensajeError("No hay fila para remover.");
            }
        }

        private void dataListado_DoubleClick(object sender, EventArgs e)
        {
            this.txtIdIngreso.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["IdIngreso"].Value);
            this.txtProveedor.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["Proveedor"].Value);
            this.dtFecha.Value = Convert.ToDateTime(this.dataListado.CurrentRow.Cells["Fecha"].Value);
            this.cbTipoComprobante.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["TipoComprobante"].Value);
            this.txtSerie.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["Serie"].Value);
            this.txtCorrelativo.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["Correlativo"].Value);
            this.lblTotalPagado.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["Total"].Value);
            this.MostrarDetalle();
            this.tabControl1.SelectedIndex = 1;



        }
    }
}
