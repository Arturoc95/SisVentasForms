using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocio
{
    public class NCategoria
    {
        #region Insertar
        public static string Insertar(string nombre, string descripcion)
        {
            DCategoria Categoria = new DCategoria()
            {
                Nombre = nombre,
                Descripcion = descripcion
            };

            return Categoria.Insertar(Categoria);
        }
        #endregion


        #region Editar
        public static string Editar(int idcategoria, string nombre, string descripcion)
        {
            DCategoria Categoria = new DCategoria()
            {
                IdCategoria = idcategoria,
                Nombre = nombre,
                Descripcion = descripcion
            };


            return Categoria.Editar(Categoria);
        }
        #endregion


        #region Eliminar
        public static string Eliminar(int idcategoria)
        {
            DCategoria Categoria = new DCategoria()
            {
                IdCategoria = idcategoria
            };


            return Categoria.Eliminar(Categoria);
        }
        #endregion


        #region Mostrar
        public static DataTable Mostrar()
        {
            return new DCategoria().Mostrar();
        }
        #endregion


        #region BuscarNombre
        public static DataTable BuscarNombre(string textobuscar)
        {
            DCategoria Categoria = new DCategoria()
            {
                TextoBuscar = textobuscar
            };

            return Categoria.BuscarNombre(Categoria);
        }
        #endregion

    }
}
