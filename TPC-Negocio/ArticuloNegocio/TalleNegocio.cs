using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Database;
using TPC_Dominio;

namespace TPC_Negocio
{
    public class TalleNegocio
    {
        public List<Talle> Listar()
        {
            List<Talle> Lista = new List<Talle>();
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT ID, MEDIDA, ESTADO FROM TALLES");
                Datos.EjecutarLectura();

                while (Datos.Lector.Read())
                {
                    Talle Objeto = new Talle();
                    Objeto.Id = (int)(Datos.Lector["ID"]);
                    Objeto.Medida = (string)Datos.Lector["MEDIDA"];
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

        public void BajaLogica(int Id)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("UPDATE TALLES SET ESTADO = '" + 0 + "'" + " WHERE ID = '" + Id + "'");

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

        public void Agregar(Talle Talle)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("INSERT INTO TALLES (MEDIDA) values (@MEDIDA)");
                Datos.SetParametro("@MEDIDA", Talle.Medida);
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
                Datos.SetConsulta("SELECT ID FROM TALLES WHERE MEDIDA = '" + Nombre + "'");
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

