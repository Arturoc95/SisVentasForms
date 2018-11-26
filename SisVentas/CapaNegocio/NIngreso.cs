using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class NIngreso
    {
        #region Insertar
        public static string Insertar(int idtrabajador, int idproveedor, DateTime fecha,
            string tipocomprobante, string serie, string correlativo, decimal iva, string estado,
            DataTable dtDetalles)
        {
            DIngreso Ingreso = new DIngreso();

            Ingreso.IdTrabajador = idtrabajador;
            Ingreso.IdProveedor = idproveedor;
            Ingreso.Fecha = fecha;
            Ingreso.TipoComprobante = tipocomprobante;
            Ingreso.Serie = serie;
            Ingreso.Correlativo = correlativo;
            Ingreso.IVA = iva;
            Ingreso.Estado = estado;
            List <DDetalleIngreso> detalles = new List<DDetalleIngreso>();

            foreach (DataRow row in dtDetalles.Rows)
            {             
                DDetalleIngreso detalle = new DDetalleIngreso();
                detalle.IdArticulo = Convert.ToInt32(row["IdArticulo"].ToString());
                detalle.PrecioCompra = Convert.ToDecimal(row["PrecioCompra"].ToString());
                detalle.PrecioVenta = Convert.ToDecimal(row["PrecioVenta"].ToString());
                detalle.StockInicial = Convert.ToInt32(row["StockInicial"].ToString());
                detalle.StockActual = Convert.ToInt32(row["StockInicial"].ToString());
                detalle.FechaProduccion = Convert.ToDateTime(row["FechaProduccion"].ToString());
                detalle.FechaVencimiento = Convert.ToDateTime(row["FechaVencimiento"].ToString());
                detalles.Add(detalle);
            }          

            return Ingreso.Insertar(Ingreso,detalles);
        }
        #endregion

        #region Anular
        public static string Anular(int idingreso)
        {
            DIngreso Ingreso = new DIngreso()
            {
                IdIngreso = idingreso
            };

            return Ingreso.Anular(Ingreso);
        }
        #endregion

        #region Mostrar
        public static DataTable Mostrar()
        {
            return new DIngreso().Mostrar();
        }
        #endregion

        #region BuscarFechas
        public static DataTable BuscarFechas(string textobuscar, string textobuscar2)
        {
            DIngreso Ingreso = new DIngreso();            

            return Ingreso.BuscarFechas(textobuscar,textobuscar2);
        }
        #endregion

        #region Mostrar Detalle
        public static DataTable MostrarDetalle(string textobuscar)
        {
            DIngreso Ingreso = new DIngreso();

            return Ingreso.MostrarDetalle(textobuscar);
        }
        #endregion

    }
}
