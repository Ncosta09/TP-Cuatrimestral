using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Database;
using TPC_Dominio;

namespace TPC_Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> Listar()
        {
            List<Categoria> Lista = new List<Categoria>();
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT ID, NOMBRE, ESTADO FROM CATEGORIAS");
                Datos.EjecutarLectura();

                while (Datos.Lector.Read())
                {
                    Categoria Objeto = new Categoria();
                    Objeto.Id = (int)(Datos.Lector["ID"]);
                    Objeto.Nombre = (string)Datos.Lector["NOMBRE"];
                    Objeto.Estado = (bool)Datos.Lector["ESTADO"];
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
        public void Agregar(Categoria Categoria)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("INSERT INTO CATEGORIAS (NOMBRE) values (@NOMBRE)");
                Datos.SetParametro("@NOMBRE", Categoria.Nombre);
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

        public void BajaLogica(int Id)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("UPDATE CATEGORIAS SET ESTADO = '" + 0 + "'" + " WHERE ID = '" + Id + "'");

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

        public int BuscarPorString(string Nombre)
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("SELECT ID FROM CATEGORIAS WHERE NOMBRE = '" + Nombre + "'");
                Datos.EjecutarLectura();
                Datos.Lector.Read();

                int Id = (int)(Datos.Lector["ID"]);

                return Id;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Datos.CerrarConexion();
            }

        }
    }
}
