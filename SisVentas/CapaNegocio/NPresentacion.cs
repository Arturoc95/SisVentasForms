using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using System.Data;


namespace CapaNegocio
{
    public class NPresentacion
    {
        #region Insertar
        public static string Insertar(string nombre, string descripcion)
        {
            DPresentacion Obj= new DPresentacion()
            {
                Nombre = nombre,
                Descripcion = descripcion
            };

            return Obj.Insertar(Obj);
        }
        #endregion


        #region Editar
        public static string Editar(int idpresentacion, string nombre, string descripcion)
        {
            DPresentacion Obj = new DPresentacion()
            {
                IdPresentacion = idpresentacion,
                Nombre = nombre,
                Descripcion = descripcion
            };


            return Obj.Editar(Obj);
        }
        #endregion


        #region Eliminar
        public static string Eliminar(int idpresentacion)
        {
            DPresentacion Obj = new DPresentacion()
            {
                IdPresentacion = idpresentacion
            };


            return Obj.Eliminar(Obj);
        }
        #endregion


        #region Mostrar
        public static DataTable Mostrar()
        {
            return new DPresentacion().Mostrar();
        }
        #endregion


        #region BuscarNombre
        public static DataTable BuscarNombre(string textobuscar)
        {
            DPresentacion Obj= new DPresentacion()
            {
                TextoBuscar = textobuscar
            };

            return Obj.BuscarNombre(Obj);
        }
        #endregion

    }
}
