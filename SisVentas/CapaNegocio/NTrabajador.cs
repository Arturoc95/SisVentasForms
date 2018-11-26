using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class NTrabajador
    {

        //Metodos comunicacion  con la capa datos

        #region Insertar
        public static string Insertar(string nombre, string apellidos, string sexo, DateTime fechanacimiento,
                                        string numdocumento,
                                        string direccion, string telefono, string email, string acceso, string usuario,
                                        string password)
        {
            DTrabajador Obj = new DTrabajador()
            {
                Nombre = nombre,
                Apellidos = apellidos,
                Sexo = sexo,
                FechaNacimiento = fechanacimiento,                
                NumDocumento = numdocumento,
                Direccion = direccion,
                Telefono = telefono,
                Email = email,
                Acceso = acceso,
                Usuario = usuario,
                Password = password


            };

            return Obj.Insertar(Obj);
        }
        #endregion


        #region Editar
        public static string Editar(int idtrabajador, string nombre, string apellidos, string sexo, DateTime fechanacimiento,
                                        string numdocumento,
                                        string direccion, string telefono, string email, string acceso, string usuario,
                                        string password)
        {
            DTrabajador Obj = new DTrabajador()
            {
                IdTrabajador = idtrabajador,
                Nombre = nombre,
                Apellidos = apellidos,
                Sexo = sexo,
                FechaNacimiento = fechanacimiento,                
                NumDocumento = numdocumento,
                Direccion = direccion,
                Telefono = telefono,
                Email = email,
                Acceso = acceso,
                Usuario = usuario,
                Password = password
            };


            return Obj.Editar(Obj);
        }
        #endregion


        #region Eliminar
        public static string Eliminar(int idtrabajador)
        {
            DTrabajador Obj = new DTrabajador()
            {
                IdTrabajador = idtrabajador
            };

            return Obj.Eliminar(Obj);
        }
        #endregion


        #region Mostrar
        public static DataTable Mostrar()
        {
            return new DTrabajador().Mostrar();
        }
        #endregion


        #region BuscarApellidos
        public static DataTable BuscarApellidos(string textobuscar)
        {
            DTrabajador Obj = new DTrabajador()
            {
                TextoBuscar = textobuscar
            };

            return Obj.BuscarApellidos(Obj);
        }
        #endregion


        #region BuscarNumApellidos
        public static DataTable BuscarNumDocumento(string textobuscar)
        {
            DTrabajador Obj = new DTrabajador()
            {
                TextoBuscar = textobuscar
            };

            return Obj.BuscarNumDocumento(Obj);
        }
        #endregion


        #region Login
        public static DataTable Login(string usuario,string password)
        {
            DTrabajador Obj = new DTrabajador()
            {
                Usuario = usuario,
                Password = password
            };

            return Obj.Login(Obj);
        }

        #endregion








    }
}
