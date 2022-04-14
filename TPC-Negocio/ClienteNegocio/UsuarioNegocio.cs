using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Database;
using TPC_Dominio;

namespace TPC_Negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> Listar()
        {
            List<Usuario> Lista = new List<Usuario>();
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT ID, USERNAME, PASSWORD, EMAIL, TIPO FROM USUARIOS");
                Datos.EjecutarLectura();

                while (Datos.Lector.Read())
                {
                    Usuario Objeto = new Usuario();

                    Objeto.Id = (int)(Datos.Lector["ID"]);
                    Objeto.Username = (string)Datos.Lector["USERNAME"];
                    Objeto.Password = (string)Datos.Lector["PASSWORD"];
                    Objeto.Email = (string)Datos.Lector["EMAIL"];
                    Objeto.Tipo = (bool)Datos.Lector["TIPO"];

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

        public Usuario BuscarCompleto(int Id) //Pasandole el ID del Usuario busca el objeto Persona completo.
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT U.ID, U.USERNAME, U.PASSWORD, U.TIPO, U.NOMBRE, U.APELLIDO, U.TELEFONO, U.EMAIL, D.CALLE, D.NUMERO, D.PROVINCIA, D.ID FROM USUARIOS AS U LEFT JOIN DOMICILIOS AS D ON U.ID_DOMICILIO = D.ID  WHERE U.ID =" + Id);
                Datos.EjecutarLectura();

                Usuario Objeto = new Usuario();

                if (Datos.Lector.Read())
                {
                    Objeto.Id = (int)Datos.Lector["ID"];
                    Objeto.Username = (string)Datos.Lector["USERNAME"];
                    Objeto.Password = (string)Datos.Lector["PASSWORD"];
                    Objeto.Tipo = (bool)Datos.Lector["TIPO"];
                    
                    if(Datos.Lector["NOMBRE"] != DBNull.Value)
                    {
                        Objeto.Nombre = (string)Datos.Lector["NOMBRE"];
                    }
                    if(Datos.Lector["APELLIDO"] != DBNull.Value)
                    {
                        Objeto.Apellido = (string)Datos.Lector["APELLIDO"];
                    }
                    if(Datos.Lector["TELEFONO"] != DBNull.Value)
                    {
                        Objeto.Telefono = (string)Datos.Lector["TELEFONO"];
                    }
                    if(Datos.Lector["EMAIL"] != DBNull.Value)
                    {
                        Objeto.Email = (string)Datos.Lector["EMAIL"];
                    }                

                    Objeto.Domicilio = new Domicilio();
                    if(Datos.Lector["ID"] != DBNull.Value)
                    {
                        Objeto.Domicilio.Id = (int)Datos.Lector["ID"];
                        if(Datos.Lector["CALLE"] != DBNull.Value)
                        {
                            Objeto.Domicilio.Calle = (string)Datos.Lector["CALLE"];
                        }
                        if (Datos.Lector["NUMERO"] != DBNull.Value)
                        {
                            Objeto.Domicilio.Numero = (string)Datos.Lector["NUMERO"];
                        }
                        if (Datos.Lector["PROVINCIA"] != DBNull.Value)
                        {
                            Objeto.Domicilio.Provincia = (string)Datos.Lector["PROVINCIA"];
                        }
                    }           
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
    
        public Usuario Buscar(int Id)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT ID, USERNAME, PASSWORD, EMAIL, NOMBRE, APELLIDO, TELEFONO, ID_DOMICILIO FROM USUARIOS WHERE ID =" + Id);
                Datos.EjecutarLectura();
                Usuario Objeto = new Usuario();

                if(Datos.Lector.Read())
                {
                    Objeto.Id = (int)(Datos.Lector["ID"]);
                    Objeto.Username = (string)Datos.Lector["USERNAME"];
                    Objeto.Password = (string)Datos.Lector["PASSWORD"];
                    Objeto.Email = (string)Datos.Lector["EMAIL"];
                    Objeto.Nombre = (string)Datos.Lector["NOMBRE"];
                    Objeto.Apellido = (string)Datos.Lector["APELLIDO"];
                    Objeto.Telefono = (string)Datos.Lector["TELEFONO"];

                    Objeto.Domicilio = new Domicilio();
                    if(Datos.Lector["ID_DOMICILIO"] != DBNull.Value)
                        Objeto.Domicilio.Id = (int)Datos.Lector["ID_DOMICILIO"];
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

        public bool BuscarDomicilio(int Id)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT ID, ID_DOMICILIO FROM USUARIOS WHERE ID =" + Id);
                Datos.EjecutarLectura();
                Usuario Objeto = new Usuario();

                if (Datos.Lector.Read())
                {
                    Objeto.Id = (int)(Datos.Lector["ID"]);

                    Objeto.Domicilio = new Domicilio();
                    if (Datos.Lector["ID_DOMICILIO"] != DBNull.Value)
                    {
                        Objeto.Domicilio.Id = (int)Datos.Lector["ID_DOMICILIO"];
                        return true;
                    }

                }
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

        public void Agregar(Usuario Usuario)
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("INSERT INTO USUARIOS (USERNAME, PASSWORD, EMAIL) VALUES (@USERNAME, @PASSWORD, @EMAIL)");

                Datos.SetParametro("@USERNAME", Usuario.Username);
                Datos.SetParametro("@PASSWORD", Usuario.Password);
                Datos.SetParametro("@EMAIL", Usuario.Email);

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

        public void Agregar(Usuario Usuario, int Id)
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("INSERT INTO USUARIOS (NOMBRE, APELLIDO , TELEFONO, USERNAME, PASSWORD, EMAIL, ID_DOMICILIO) VALUES (@NOMBRE, @APELLIDO , @TELEFONO, @USERNAME, @PASSWORD, @EMAIL, @ID_DOMICILIO)");

                Datos.SetParametro("@NOMBRE", Usuario.Nombre);
                Datos.SetParametro("@APELLIDO", Usuario.Apellido);
                Datos.SetParametro("@TELEFONO", Usuario.Telefono);
                Datos.SetParametro("@USERNAME", Usuario.Username);
                Datos.SetParametro("@PASSWORD", Usuario.Password);
                Datos.SetParametro("@EMAIL", Usuario.Email);
                Datos.SetParametro("@ID_DOMICILIO", Id);

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
        public bool Login(Usuario Usuario)
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("SELECT ID, TIPO FROM USUARIOS WHERE USERNAME = @USERNAME AND PASSWORD = @PASSWORD");       
                Datos.SetParametro("@USERNAME", Usuario.Username);
                Datos.SetParametro("@PASSWORD", Usuario.Password);
                Datos.EjecutarLectura();

                if (Datos.Lector.Read())
                {
                    Usuario.Id = (int)(Datos.Lector["ID"]);
                    Usuario.Tipo = (bool)Datos.Lector["TIPO"];
                    return true;
                }
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

        public void Modificar(Usuario Usuario, int IdDomicilio) 
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("UPDATE USUARIOS SET NOMBRE = '" + Usuario.Nombre + "', APELLIDO = '" + Usuario.Apellido + "', " + "EMAIL = '" + Usuario.Email + "', TELEFONO = '" + Usuario.Telefono + "', ID_DOMICILIO = '" + IdDomicilio + "' WHERE ID = '" + Usuario.Id + "'");

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

        public void ModificarSimple(Usuario Usuario)
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("UPDATE USUARIOS SET NOMBRE = '" + Usuario.Nombre + "', APELLIDO = '" + Usuario.Apellido + "', " + "EMAIL = '" + Usuario.Email + "', TELEFONO = '" + Usuario.Telefono + "', ID_DOMICILIO = '" + Usuario.Domicilio.Id + "' WHERE ID = '" + Usuario.Id + "'");

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

        public void ModificarPass(Usuario Usuario)
        { 
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("UPDATE USUARIOS SET PASSWORD = '" + Usuario.Password + "' WHERE ID = '" + Usuario.Id + "'");

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

        public void ModificarTipo(int Id, int Tipo)
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("UPDATE USUARIOS SET TIPO = '" + Tipo + "' WHERE ID = '" + Id + "'");
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

        public void Eliminar(int Id)
        {
            AccesoDatabase Datos = new AccesoDatabase();
            try
            {
                Datos.SetConsulta("DELETE FROM USUARIOS WHERE ID = '" + Id + "'");
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
