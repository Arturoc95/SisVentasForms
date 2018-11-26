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
    public partial class frmVenta : Form
    {
        private bool IsNuevo = false;
        public int IdTrabajador;
        private DataTable dtDetalle;

        private decimal totalPagado = 0;

        private static frmVenta _instancia;

        public static frmVenta GetInstancia()
        {
            if (_instancia ==null)
            {
                _instancia = new frmVenta();
            }
            return _instancia;
        }
       
        public void setCliente(string idcliente, string nombre)
        {
            this.txtIdCliente.Text = idcliente;
            this.txtCliente.Text = nombre;
        }

        public void setArticulo(string iddetalleingreso, string nombre, decimal preciocompra, decimal precioventa,
            int stock, DateTime fechavencimiento)
        {
            this.txtIdArticulo.Text = iddetalleingreso;
            this.txtArticulo.Text = nombre;
            this.txtPrecioCompra.Text =Convert.ToString(preciocompra);
            this.txtPrecioVenta.Text = Convert.ToString(precioventa);
            this.txtStockActual.Text = Convert.ToString(stock);
            this.dtFechaVencimiento.Value = fechavencimiento;
        }
                     
        public frmVenta()
        {
            InitializeComponent();
            this.ttMensaje.SetToolTip(this.txtCliente, "Seleccione un cliente.");
            this.ttMensaje.SetToolTip(this.txtSerie, "Ingrese una serie de comprobante.");
            this.ttMensaje.SetToolTip(this.txtCorrelativo, "Ingrese un número de comprobante.");
            this.ttMensaje.SetToolTip(this.txtCantidad, "Ingrese la cantidad del artículo.");
            this.ttMensaje.SetToolTip(this.txtArticulo, "Seleccione un artículo.");
            this.txtIdCliente.Visible = false;
            this.txtIdArticulo.Visible = false;
            this.txtArticulo.ReadOnly = true;
            this.txtCliente.ReadOnly = true;
            this.dtFechaVencimiento.Enabled = false;
            this.txtPrecioCompra.ReadOnly = true;
            this.txtStockActual.ReadOnly = true;

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
            this.txtIdVenta.Text = string.Empty;
            this.txtIdCliente.Text = string.Empty;
            this.txtCliente.Text = string.Empty;
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
            this.txtStockActual.Text = string.Empty;
            this.txtCantidad.Text = string.Empty;
            this.txtPrecioCompra.Text = string.Empty;
            this.txtPrecioVenta.Text = string.Empty;
            this.txtDescuento.Text = string.Empty;

        }

        //Habilitar controles del formualrio
        private void Habilitar(bool valor)
        {
            this.txtIdVenta.ReadOnly = !valor;
            this.txtSerie.ReadOnly = !valor;
            this.txtCorrelativo.ReadOnly = !valor;
            this.txtIVA.Enabled = valor;
            this.dtFecha.Enabled = valor;
            this.cbTipoComprobante.Enabled = valor;
            this.txtCantidad.ReadOnly = !valor;
            this.txtPrecioCompra.ReadOnly = !valor;
            this.txtPrecioVenta.ReadOnly = !valor;            
            this.dtFechaVencimiento.Enabled = valor;
            this.txtStockActual.ReadOnly = !valor;

            this.btnBuscarArticulo.Enabled = valor;
            this.btnBuscarCliente.Enabled = valor;
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
            this.dataListado.Columns[1].Visible = false;

        }

        //Metodo mostrar Articulo
        private void Mostrar()
        {
            this.dataListado.DataSource = NVenta.Mostrar();
            this.OcultarColumnas();
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataListado.Rows.Count);
        }

        //Buscar por fechas
        private void BuscarFechas()
        {
            this.dataListado.DataSource = NVenta.BuscarFechas(this.dtFecha1.Value.ToString("dd/MM/yyyy"),
                this.dtFecha2.Value.ToString("dd/MM/yyyy"));
            this.OcultarColumnas();
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataListado.Rows.Count);
        }

        //Buscar por Mostrar Detalle
        private void MostrarDetalle()
        {
            this.datalistadoDetalle.DataSource = NVenta.MostrarDetalle(this.txtIdVenta.Text);

        }

        private void CrearTabla()
        {
            this.dtDetalle = new DataTable("Detalle");
            this.dtDetalle.Columns.Add("IdDetalleIngreso", System.Type.GetType("System.Int32"));
            this.dtDetalle.Columns.Add("Articulo", System.Type.GetType("System.String"));
            this.dtDetalle.Columns.Add("Cantidad", System.Type.GetType("System.Int32"));
            this.dtDetalle.Columns.Add("PrecioVenta", System.Type.GetType("System.Decimal"));
            this.dtDetalle.Columns.Add("Descuento", System.Type.GetType("System.Decimal"));                      
            this.dtDetalle.Columns.Add("SubTotal", System.Type.GetType("System.Decimal"));

            //Relacionar DatagridView con datatable
            this.datalistadoDetalle.DataSource = this.dtDetalle;





        }

        private void frmVenta_Load(object sender, EventArgs e)
        {
            this.Top = 0;
            this.Left = 0;
            this.Mostrar();
            this.Habilitar(false);
            this.Botones();
            this.CrearTabla();
        }

        private void frmVenta_FormClosing(object sender, FormClosingEventArgs e)
        {
            _instancia = null;
        }

        private void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            frmVistaCliente_Venta vista = new frmVistaCliente_Venta();
            vista.ShowDialog();
        }

        private void btnBuscarArticulo_Click(object sender, EventArgs e)
        {
            frmVistaArticulo_Venta vista = new frmVistaArticulo_Venta();
            vista.ShowDialog();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.BuscarFechas();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult Opcion;
                Opcion = MessageBox.Show("Realmente desea eliminar los registros", "Sistema de Ventas", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);

                if (Opcion == DialogResult.OK)
                {
                    string Codigo;
                    string Rpta = "";

                    foreach (DataGridViewRow row in dataListado.Rows)
                    {
                        if (Convert.ToBoolean(row.Cells[0].Value))
                        {
                            Codigo = Convert.ToString(row.Cells[1].Value);
                            Rpta = NVenta.Eliminar(Convert.ToInt32(Codigo));

                            if (Rpta.Equals("OK"))
                            {
                                this.MensajeOk("Se eliminó correctamente la venta.");
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

        private void dataListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == dataListado.Columns["Eliminar"].Index)
            {
                DataGridViewCheckBoxCell ChkEliminar = (DataGridViewCheckBoxCell)dataListado.Rows[e.RowIndex].Cells["Eliminar"];
                ChkEliminar.Value = !Convert.ToBoolean(ChkEliminar.Value);
            }
            
        }

        private void dataListado_DoubleClick(object sender, EventArgs e)
        {
            this.txtIdVenta.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["IdVenta"].Value);
            this.txtCliente.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["Cliente"].Value);
            this.dtFecha.Value = Convert.ToDateTime(this.dataListado.CurrentRow.Cells["Fecha"].Value);
            this.cbTipoComprobante.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["TipoComprobante"].Value);
            this.txtSerie.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["Serie"].Value);
            this.txtCorrelativo.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["Correlativo"].Value);
            this.lblTotalPagado.Text = Convert.ToString(this.dataListado.CurrentRow.Cells["Total"].Value);
            this.MostrarDetalle();
            this.tabControl1.SelectedIndex = 1;
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
            this.LimpiarDetalle();
            this.Habilitar(true);
            this.txtSerie.Focus();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.IsNuevo = false;
            this.Botones();
            this.Limpiar();
            this.LimpiarDetalle();
            this.Habilitar(false);
            
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string rpta = "";
                if (this.txtIdCliente.Text == String.Empty || this.txtSerie.Text == String.Empty
                    || this.txtCorrelativo.Text == String.Empty || this.txtIVA.Text == String.Empty)
                {
                    MensajeError("Falta ingresar algunos datos, serán remarcados");
                    erroricono.SetError(txtCliente, "Ingrese un valor");
                    erroricono.SetError(txtSerie, "Ingrese un valor");
                    erroricono.SetError(txtCorrelativo, "Ingrese un valor");
                    erroricono.SetError(txtIVA, "Ingrese un valor");
                }
                else
                {

                    if (this.IsNuevo)
                    {
                        rpta = NVenta.Insertar(Convert.ToInt32(this.txtIdCliente.Text),IdTrabajador,
                            dtFecha.Value, cbTipoComprobante.Text, txtSerie.Text, txtCorrelativo.Text,
                            Convert.ToDecimal(txtIVA.Text),dtDetalle);
                    }

                    if (rpta.Equals("OK"))
                    {
                        if (this.IsNuevo)
                        {
                            this.MensajeOk("Se insertó de forma correcta el registro.");
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
                if (this.txtIdArticulo.Text == String.Empty || this.txtCantidad.Text == String.Empty
                    || this.txtDescuento.Text == String.Empty || this.txtPrecioVenta.Text == String.Empty)
                {
                    MensajeError("Falta ingresar algunos datos, serán remarcados");
                    erroricono.SetError(txtIdArticulo, "Ingrese un valor");
                    erroricono.SetError(txtCantidad, "Ingrese un valor");
                    erroricono.SetError(txtDescuento, "Ingrese un valor");
                    erroricono.SetError(txtPrecioVenta, "Ingrese un valor");
                }
                else
                {
                    bool Registrar = true;
                    foreach (DataRow row in dtDetalle.Rows)
                    {
                        if (Convert.ToInt32(row["IdDetalleIngreso"]) == Convert.ToInt32(this.txtIdArticulo.Text))
                        {
                            Registrar = false;
                            this.MensajeError("Ya se encuentra el articulo en el detalle.");
                        }
                    }
                    if (Registrar && Convert.ToInt32(txtCantidad.Text)<=Convert.ToInt32(txtStockActual.Text))
                    {
                        decimal subTotal = Convert.ToDecimal(this.txtCantidad.Text) * Convert.ToDecimal(this.txtPrecioVenta.Text)-Convert.ToDecimal(txtDescuento.Text);
                        totalPagado = totalPagado + subTotal;
                        this.lblTotalPagado.Text = totalPagado.ToString("·0.00#");

                        //Agregar detalle al datalistadodetalle
                        DataRow row = this.dtDetalle.NewRow();
                        row["IdDetalleIngreso"] = Convert.ToInt32(this.txtIdArticulo.Text);
                        row["Articulo"] = this.txtIdArticulo.Text;
                        row["Cantidad"] = Convert.ToInt32(this.txtCantidad.Text);
                        row["PrecioVenta"] = Convert.ToDecimal(this.txtPrecioVenta.Text);
                        row["Descuento"] = Convert.ToDecimal(this.txtDescuento.Text);                        
                        row["SubTotal"] = subTotal;
                        this.dtDetalle.Rows.Add(row);
                        this.LimpiarDetalle();
                    }else
                    {
                        MensajeError("No hay Stock suficiente.");
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
                this.totalPagado = this.totalPagado - Convert.ToDecimal(row["Subtotal"].ToString());
                this.lblTotalPagado.Text = totalPagado.ToString("0.00#");
                //Remover fila
                this.dtDetalle.Rows.Remove(row);
            }
            catch (Exception Ex)
            {
                MensajeError("No hay fila para remover.");
            }
        }
    }
}
