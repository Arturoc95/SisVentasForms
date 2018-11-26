using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using System.Data;

namespace CapaNegocio
{
    public class NProveedor
    {
        #region Insertar
        public static string Insertar(string razonsocial, string sectorcomercial, string tipodocumento, string numdocumento, 
                                    string direccion, string telefono, string email, string url)
        {
            DProveedor Obj = new DProveedor()
            {
                RazonSocial=razonsocial,
                SectorComercial=sectorcomercial,
                TipoDocumento=tipodocumento,
                NumDocumento=numdocumento,
                Direccion=direccion,
                Telefono=telefono,
                Email=email,
                URL=url                
            };

            return Obj.Insertar(Obj);
        }
        #endregion


        #region Editar
        public static string Editar(int idproveedor,string razonsocial, string sectorcomercial, string tipodocumento, string numdocumento,
                                    string direccion, string telefono, string email, string url)
        {
            DProveedor Obj = new DProveedor()
            {
                IdProveedor = idproveedor,
                RazonSocial = razonsocial,
                SectorComercial = sectorcomercial,
                TipoDocumento = tipodocumento,
                NumDocumento = numdocumento,
                Direccion = direccion,
                Telefono = telefono,
                Email = email,
                URL = url
            };


            return Obj.Editar(Obj);
        }
        #endregion


        #region Eliminar
        public static string Eliminar(int idproveedor)
        {
            DProveedor Obj = new DProveedor()
            {
                IdProveedor = idproveedor
            };
            
            return Obj.Eliminar(Obj);
        }
        #endregion


        #region Mostrar
        public static DataTable Mostrar()
        {
            return new DProveedor().Mostrar();
        }
        #endregion


        #region BuscarRazonSocial
        public static DataTable BuscarRazonSocial (string textobuscar)
        {
            DProveedor Obj = new DProveedor()
            {
                TextoBuscar = textobuscar
            };

            return Obj.BuscarRazonSocial(Obj);
        }
        #endregion

        
        public static DataTable BuscarNumDocumento(string textobuscar)
        {
            DProveedor Obj = new DProveedor()
            {
                TextoBuscar = textobuscar
            };

            return Obj.BuscarNumDocumento(Obj);
        }


    }
}
