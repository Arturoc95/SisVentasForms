using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class NCliente
    {
        //Metodos comunicacion  con la capa datos

        #region Insertar
        public static string Insertar(string nombre, string apellidos,string sexo,DateTime fechanacimiento,
                                        string tipodocumento, string numdocumento,
                                        string direccion, string telefono, string email)
        {
            DCliente Obj = new DCliente()
            {
                Nombre = nombre,
                Apellidos = apellidos,
                Sexo = sexo,
                FechaNacimiento=fechanacimiento,            
                TipoDocumento = tipodocumento,
                NumDocumento = numdocumento,
                Direccion = direccion,
                Telefono = telefono,
                Email = email                
            };

            return Obj.Insertar(Obj);
        }
        #endregion


        #region Editar
        public static string Editar(int idcliente, string nombre, string apellidos, string sexo, DateTime fechanacimiento,
                                        string tipodocumento, string numdocumento,
                                        string direccion, string telefono, string email)
        {
            DCliente Obj = new DCliente()
            {
                IdCliente=idcliente,
                Nombre = nombre,
                Apellidos = apellidos,
                Sexo = sexo,
                FechaNacimiento = fechanacimiento,
                TipoDocumento = tipodocumento,
                NumDocumento = numdocumento,
                Direccion = direccion,
                Telefono = telefono,
                Email = email
            };


            return Obj.Editar(Obj);
        }
        #endregion


        #region Eliminar
        public static string Eliminar(int idcliente)
        {
            DCliente Obj = new DCliente()
            {
                IdCliente = idcliente
            };

            return Obj.Eliminar(Obj);
        }
        #endregion


        #region Mostrar
        public static DataTable Mostrar()
        {
            return new DCliente().Mostrar();
        }
        #endregion


        #region BuscarApellidos
        public static DataTable BuscarApellidos(string textobuscar)
        {
            DCliente Obj = new DCliente()
            {
                TextoBuscar = textobuscar
            };

            return Obj.BuscarApellidos(Obj);
        }
        #endregion


        public static DataTable BuscarNumDocumento(string textobuscar)
        {
            DCliente Obj = new DCliente()
            {
                TextoBuscar = textobuscar
            };

            return Obj.BuscarNumDocumento(Obj);
        }




    }
}
