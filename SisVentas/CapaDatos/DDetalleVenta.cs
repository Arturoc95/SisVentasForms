using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class DDetalleVenta
    {
        private int _IdDetalleVenta;
        private int _IdVenta;
        private int _IdDetalleIngreso;
        private int _Cantidad;
        private decimal _PrecioVenta;
        private decimal _Descuento;

        public int IdDetalleVenta { get => _IdDetalleVenta; set => _IdDetalleVenta = value; }
        public int IdVenta { get => _IdVenta; set => _IdVenta = value; }
        public int IdDetalleIngreso { get => _IdDetalleIngreso; set => _IdDetalleIngreso = value; }
        public int Cantidad { get => _Cantidad; set => _Cantidad = value; }
        public decimal PrecioVenta { get => _PrecioVenta; set => _PrecioVenta = value; }
        public decimal Descuento { get => _Descuento; set => _Descuento = value; }

        //Constructor Vacio
        public DDetalleVenta()
        {

        }

        public DDetalleVenta(int iddetalleventa, int idventa, int iddetalleingreso, int cantidad,
            decimal precioventa, decimal descuento)
        {
            this.IdDetalleVenta = iddetalleventa;
            this.IdVenta = idventa;
            this.IdDetalleIngreso = iddetalleingreso;
            this.Cantidad = cantidad;
            this.PrecioVenta = precioventa;
            this.Descuento = descuento;

        }

        //Metodo Insertar

        public string Insertar(DDetalleVenta DetalleVenta, ref SqlConnection SqlCon,
            ref SqlTransaction SqlTra)
        {
            string rpta = "";

            try
            {

                // Establecer Comando
                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.Transaction = SqlTra;
                SqlCmd.CommandText = "spinsertardetalle_venta";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter ParIdDetalleVenta = new SqlParameter();
                ParIdDetalleVenta.ParameterName = "@IdDetalleVenta";
                ParIdDetalleVenta.SqlDbType = SqlDbType.Int;
                ParIdDetalleVenta.Direction = ParameterDirection.Output;
                SqlCmd.Parameters.Add(ParIdDetalleVenta);

                SqlParameter ParIdVenta = new SqlParameter();
                ParIdVenta.ParameterName = "@IdVenta";
                ParIdVenta.SqlDbType = SqlDbType.Int;
                ParIdVenta.Value = DetalleVenta.IdVenta;
                SqlCmd.Parameters.Add(ParIdVenta);

                SqlParameter ParIdDetalleIngreso = new SqlParameter();
                ParIdDetalleIngreso.ParameterName = "@IdDetalleIngreso";
                ParIdDetalleIngreso.SqlDbType = SqlDbType.Int;
                ParIdDetalleIngreso.Value = DetalleVenta.IdDetalleIngreso;
                SqlCmd.Parameters.Add(ParIdDetalleIngreso);

                SqlParameter ParCantidad = new SqlParameter();
                ParCantidad.ParameterName = "@Cantidad";
                ParCantidad.SqlDbType = SqlDbType.Int;
                ParCantidad.Value = DetalleVenta.Cantidad;
                SqlCmd.Parameters.Add(ParCantidad);

                SqlParameter ParPrecioVenta = new SqlParameter();
                ParPrecioVenta.ParameterName = "@PrecioVenta";
                ParPrecioVenta.SqlDbType = SqlDbType.Money;
                ParPrecioVenta.Value = DetalleVenta.PrecioVenta;
                SqlCmd.Parameters.Add(ParPrecioVenta);

                SqlParameter ParDescuento = new SqlParameter();
                ParDescuento.ParameterName = "@Descuento";
                ParDescuento.SqlDbType = SqlDbType.Money;
                ParDescuento.Value = DetalleVenta.Descuento;
                SqlCmd.Parameters.Add(ParDescuento);


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
