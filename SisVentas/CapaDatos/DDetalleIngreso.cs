using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class DDetalleIngreso
    {
        //Variables
        private int _IdDetalleIngreso;
        private int _IdIngreso;
        private int _IdArticulo;
        private decimal _PrecioCompra;
        private decimal _PrecioVenta;
        private int _StockInicial;
        private int _StockActual;
        private DateTime _FechaProduccion;
        private DateTime _FechaVencimiento;

        //Propiedades
        public int IdDetalleIngreso { get => _IdDetalleIngreso; set => _IdDetalleIngreso = value; }
        public int IdIngreso { get => _IdIngreso; set => _IdIngreso = value; }
        public int IdArticulo { get => _IdArticulo; set => _IdArticulo = value; }
        public decimal PrecioCompra { get => _PrecioCompra; set => _PrecioCompra = value; }
        public decimal PrecioVenta { get => _PrecioVenta; set => _PrecioVenta = value; }
        public int StockInicial { get => _StockInicial; set => _StockInicial = value; }
        public int StockActual { get => _StockActual; set => _StockActual = value; }
        public DateTime FechaProduccion { get => _FechaProduccion; set => _FechaProduccion = value; }
        public DateTime FechaVencimiento { get => _FechaVencimiento; set => _FechaVencimiento = value; }

        //Constructores
        public DDetalleIngreso()
        {

        }

        public DDetalleIngreso(int iddetalleingreso,int idingreso, int idarticulo, decimal preciocompra,
            decimal precioventa, int stockinicial, int stockactual,
            DateTime fechaproducion, DateTime fechavencimiento)
        {
            this.IdDetalleIngreso = iddetalleingreso;
            this.IdIngreso = idingreso;
            this.IdArticulo = idarticulo;
            this.PrecioCompra = preciocompra;
            this.PrecioVenta = precioventa;
            this.StockInicial = stockinicial;
            this.StockActual = stockactual;
            this.FechaProduccion = fechaproducion;
            this.FechaVencimiento = fechavencimiento;
        }

        //Metodo Insertar

        public string Insertar(DDetalleIngreso DetalleIngreso, ref SqlConnection SqlCon,
            ref SqlTransaction SqlTra)
        {
            string rpta = "";
            
            try
            {
               
                // Establecer Comando
                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.Transaction = SqlTra;
                SqlCmd.CommandText = "spinsertardetalle_ingreso";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter ParIdDetalleIngreso = new SqlParameter();
                ParIdDetalleIngreso.ParameterName = "@IdDetalleIngreso";
                ParIdDetalleIngreso.SqlDbType = SqlDbType.Int;
                ParIdDetalleIngreso.Direction = ParameterDirection.Output;
                SqlCmd.Parameters.Add(ParIdDetalleIngreso);

                SqlParameter ParIdIngreso = new SqlParameter();
                ParIdIngreso.ParameterName = "@IdIngreso";
                ParIdIngreso.SqlDbType = SqlDbType.Int;                
                ParIdIngreso.Value = DetalleIngreso.IdIngreso;
                SqlCmd.Parameters.Add(ParIdIngreso);

                SqlParameter ParIdArticulo = new SqlParameter();
                ParIdArticulo.ParameterName = "@IdArticulo";
                ParIdArticulo.SqlDbType = SqlDbType.Int;
                ParIdArticulo.Value = DetalleIngreso.IdArticulo;
                SqlCmd.Parameters.Add(ParIdArticulo);

                SqlParameter ParPrecioCompra = new SqlParameter();
                ParPrecioCompra.ParameterName = "@PrecioCompra";
                ParPrecioCompra.SqlDbType = SqlDbType.Money;                
                ParPrecioCompra.Value = DetalleIngreso.PrecioCompra;
                SqlCmd.Parameters.Add(ParPrecioCompra);

                SqlParameter ParPrecioVenta = new SqlParameter();
                ParPrecioVenta.ParameterName = "@PrecioVenta";
                ParPrecioVenta.SqlDbType = SqlDbType.Money;
                ParPrecioVenta.Value = DetalleIngreso.PrecioVenta;
                SqlCmd.Parameters.Add(ParPrecioVenta);

                SqlParameter ParStockInicial = new SqlParameter();
                ParStockInicial.ParameterName = "@StockInicial";
                ParStockInicial.SqlDbType = SqlDbType.Int;
                ParStockInicial.Value = DetalleIngreso.StockInicial;
                SqlCmd.Parameters.Add(ParStockInicial);

                SqlParameter ParStockActual = new SqlParameter();
                ParStockActual.ParameterName = "@StockActual";
                ParStockActual.SqlDbType = SqlDbType.Int;
                ParStockActual.Value = DetalleIngreso.StockActual;
                SqlCmd.Parameters.Add(ParStockActual);

                SqlParameter ParFechaProduccion = new SqlParameter();
                ParFechaProduccion.ParameterName = "@FechaProduccion";
                ParFechaProduccion.SqlDbType = SqlDbType.Date;
                ParFechaProduccion.Value = DetalleIngreso.FechaProduccion;
                SqlCmd.Parameters.Add(ParFechaProduccion);

                SqlParameter ParFechaVencimiento = new SqlParameter();
                ParFechaVencimiento.ParameterName = "@FechaVencimiento";
                ParFechaVencimiento.SqlDbType = SqlDbType.Date;
                ParFechaVencimiento.Value = DetalleIngreso.FechaVencimiento;
                SqlCmd.Parameters.Add(ParFechaVencimiento);

                //Ejecutamos Comando

                rpta = SqlCmd.ExecuteNonQuery() == 1 ? "OK" : "No se ingreso el registro.";

            }
            catch (Exception ex)
            {
                rpta = ex.Message;
            }
            
            return rpta;

        }
    }
}
