using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using System.Data;
using System.Data.SqlClient;

namespace CapaNegocio
{
    public class NArticulo
    {
        #region Insertar
        public static string Insertar(string codigo, string nombre, string descripcion, byte[] imagen,int idcategoria, int idpresentacion)
        {
            DArticulo Obj = new DArticulo()
            {
                Codigo = codigo,
                Nombre = nombre,
                Descripcion = descripcion,                
                Imagen = imagen,
                IdCategoria = idcategoria,
                IdPresentacion = idpresentacion
            };

            return Obj.Insertar(Obj);
        }
        #endregion


        #region Editar
        public static string Editar(int idarticulo,string codigo, string nombre, string descripcion, byte[] imagen, 
                                    int idcategoria, int idpresentacion)
        {
            DArticulo Obj = new DArticulo()
            {
                IdArticulo = idarticulo,
                Codigo = codigo,
                Nombre = nombre,
                Descripcion = descripcion,
                Imagen = imagen,
                IdCategoria = idcategoria,
                IdPresentacion = idpresentacion
            };


            return Obj.Editar(Obj);
        }
        #endregion


        #region Eliminar
        public static string Eliminar(int idarticulo)
        {
            DArticulo Obj = new DArticulo()
            {
                IdArticulo = idarticulo
            };


            return Obj.Eliminar(Obj);
        }
        #endregion


        #region Mostrar
        public static DataTable Mostrar()
        {
            return new DArticulo().Mostrar();
        }
        #endregion


        #region BuscarNombre
        public static DataTable BuscarNombre(string textobuscar)
        {
            DArticulo Obj = new DArticulo()
            {
                TextoBuscar = textobuscar
            };

            return Obj.BuscarNombre(Obj);
        }
        #endregion



    }
}
