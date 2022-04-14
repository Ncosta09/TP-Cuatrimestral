using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Database;
using TPC_Dominio;

namespace TPC_Negocio
{
    public class DomicilioNegocio
    {
        public List<Domicilio> Listar()
        {
            AccesoDatabase Datos = new AccesoDatabase();
            List<Domicilio> Lista = new List<Domicilio>();
            try
            {
                Datos.SetConsulta("SELECT ID FROM DOMICILIOS");
                Datos.EjecutarLectura();

                while (Datos.Lector.Read())
                {
                    Domicilio Objeto = new Domicilio();

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

        public Domicilio Buscar(int Id)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT ID, CALLE, NUMERO, PROVINCIA FROM DOMICILIOS WHERE ID = '" + Id + "'");
                Datos.EjecutarLectura();

                Domicilio Objeto = new Domicilio();

                if (Datos.Lector.Read())
                {
                    Objeto.Id = (int)Datos.Lector["ID"];
                    if (Datos.Lector["CALLE"] != DBNull.Value)
                        Objeto.Calle = (string)Datos.Lector["CALLE"];
                    if (Datos.Lector["NUMERO"] != DBNull.Value)
                        Objeto.Numero = (string)Datos.Lector["NUMERO"];
                    if (Datos.Lector["PROVINCIA"] != DBNull.Value)
                        Objeto.Provincia = (string)Datos.Lector["PROVINCIA"];
                }
                return Objeto;
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

        public bool Existe(int Id)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT ID FROM DOMICILIOS WHERE ID = '" + Id + "'");
                Datos.EjecutarLectura();

                if (Datos.Lector.Read())
                    return true;
                return false;
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

        public void Agregar(Domicilio Domicilio)
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("INSERT INTO DOMICILIOS (CALLE, NUMERO, PROVINCIA) VALUES (@CALLE, @NUMERO, @PROVINCIA)");

                if (Domicilio.Calle == null)
                {
                    Datos.SetParametro("@CALLE", DBNull.Value);
                }
                else
                {
                    Datos.SetParametro("@CALLE", Domicilio.Calle);
                }
                if (Domicilio.Numero == null)
                {
                    Datos.SetParametro("@NUMERO", DBNull.Value);
                }
                else
                {
                    Datos.SetParametro("@NUMERO", Domicilio.Numero);
                }
                if (Domicilio.Provincia == null)
                {
                    Datos.SetParametro("@PROVINCIA", DBNull.Value);
                }
                else
                {
                    Datos.SetParametro("@PROVINCIA", Domicilio.Provincia);
                }
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
        public void Modificar(Domicilio Domicilio)
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("UPDATE DOMICILIOS SET CALLE = '" + Domicilio.Calle + "', NUMERO = '" + Domicilio.Numero + "', " + "PROVINCIA = '" + Domicilio.Provincia + "' WHERE ID = '" + Domicilio.Id + "'");
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
