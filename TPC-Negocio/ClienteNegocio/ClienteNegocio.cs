using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Database;
using TPC_Dominio;

namespace TPC_Negocio
{
    public class ClienteNegocio
    {
        public List<Cliente> Listar()
        {
            AccesoDatabase Datos = new AccesoDatabase();
            List<Cliente> Lista = new List<Cliente>();
            try
            {
                Datos.SetConsulta("SELECT ID FROM CLIENTES");
                Datos.EjecutarLectura();

                while (Datos.Lector.Read())
                {
                    Cliente Objeto = new Cliente();

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

        public void Agregar(Cliente Cliente, int IdDomicilio)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("INSERT INTO CLIENTES (NOMBRE, APELLIDO, EMAIL, TELEFONO, ID_DOMICILIO) VALUES (@NOMBRE, @APELLIDO, @EMAIL, @TELEFONO, @ID_DOMICILIO)");

                Datos.SetParametro("@NOMBRE", Cliente.Nombre);
                Datos.SetParametro("@APELLIDO", Cliente.Apellido);
                Datos.SetParametro("@EMAIL", Cliente.Email);
                Datos.SetParametro("@TELEFONO", Cliente.Telefono);
                Datos.SetParametro("@ID_DOMICILIO", IdDomicilio);

                Datos.EjecutarAccion();
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
    }
}
