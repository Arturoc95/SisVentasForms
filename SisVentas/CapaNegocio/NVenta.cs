using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class NVenta
    {
        #region Insertar
        public static string Insertar(int idcliente, int idtrabajador, DateTime fecha,
            string tipocomprobante, string serie, string correlativo, decimal iva,
            DataTable dtDetalles)
        {
            DVenta Venta = new DVenta();

            Venta.IdCliente = idcliente;
            Venta.IdTrabajador = idtrabajador;            
            Venta.Fecha = fecha;
            Venta.TipoComprobante = tipocomprobante;
            Venta.Serie = serie;
            Venta.Correlativo = correlativo;
            Venta.IVA = iva;            
            List<DDetalleVenta> detalles = new List<DDetalleVenta>();

            foreach (DataRow row in dtDetalles.Rows)
            {
                DDetalleVenta detalle = new DDetalleVenta();
                detalle.IdDetalleIngreso = Convert.ToInt32(row["IdDetalleIngreso"].ToString());
                detalle.Cantidad = Convert.ToInt32(row["Cantidad"].ToString());
                detalle.PrecioVenta = Convert.ToDecimal(row["PrecioVenta"].ToString());
                detalle.Descuento = Convert.ToDecimal(row["Descuento"].ToString());                
                detalles.Add(detalle);
            }
            return Venta.Insertar(Venta, detalles);
        }
        #endregion

        #region Eliminar
        public static string Eliminar(int idventa)
        {
            DVenta Venta = new DVenta()
            {
                IdVenta = idventa
            };

            return Venta.Eliminar(Venta);
        }
        #endregion

        #region Mostrar
        public static DataTable Mostrar()
        {
            return new DVenta().Mostrar();
        }
        #endregion

        #region BuscarFechas
        public static DataTable BuscarFechas(string textobuscar, string textobuscar2)
        {
            DVenta Venta = new DVenta();

            return Venta.BuscarFechas(textobuscar, textobuscar2);
        }
        #endregion

        #region Mostrar Detalle
        public static DataTable MostrarDetalle(string textobuscar)
        {
            DVenta Venta = new DVenta();

            return Venta.MostrarDetalle(textobuscar);
        }
        #endregion

        #region Mostrar Articulo Venta Nombre
        public static DataTable MostrarArticuloVentaNombre(string textobuscar)
        {
            DVenta Venta = new DVenta();

            return Venta.MostrarArticuloVentaNombre(textobuscar);
        }
        #endregion

         #region Mostrar Articulo Venta Codigo
        public static DataTable MostrarArticuloVentaCodigo(string textobuscar)
        {
            DVenta Venta = new DVenta();

            return Venta.MostrarArticuloVentaCodigo(textobuscar);
        }
        #endregion



    }
}
