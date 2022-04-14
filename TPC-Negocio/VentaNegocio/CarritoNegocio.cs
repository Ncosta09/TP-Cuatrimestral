using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Database;
using TPC_Dominio;

namespace TPC_Negocio
{
    public class CarritoNegocio
    {
        public List<Carrito> Listar()
        {
            AccesoDatabase Datos = new AccesoDatabase();
            List<Carrito> Lista = new List<Carrito>();
            try
            {
                Datos.SetConsulta("SELECT ID FROM CARRITOS");
                Datos.EjecutarLectura();

                while (Datos.Lector.Read())
                {
                    Carrito Objeto = new Carrito();

                    Objeto.Id = (int)(Datos.Lector["ID"]);

                    Lista.Add(Objeto);
                }

                return Lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Datos.CerrarConexion();
            }
        }


        public void Agregar(List<Articulo> Carrito, int Id)
        {
            //Agregar al carrito una vez la venta ya este grabada

            //Ojo con la primary key que es compuesta
            try
            {
                foreach (var Articulo in Carrito)
                {
                    AccesoDatabase Datos = new AccesoDatabase();
                    Datos.SetConsulta("INSERT INTO CARRITOS (ID_VENTA, ID_ARTICULO) VALUES (@ID_VENTA, @ID_ARTICULO)");
                    Datos.SetParametro("@ID_ARTICULO", Articulo.Id);
                    Datos.SetParametro("@ID_VENTA", Id);
                    Datos.EjecutarAccion();
                    Datos.CerrarConexion();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
