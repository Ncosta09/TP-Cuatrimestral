using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Database;
using TPC_Dominio;

namespace TPC_Negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> Listar()
        {
            List<Articulo> Lista = new List<Articulo>();
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT A.CODIGO, A.ID, A.NOMBRE, A.DESCRIPCION, A.PRECIO, A.STOCK, A.IMG_URL, A.IMG_URL2, A.ESTADO, T.MEDIDA AS TALLE, C.NOMBRE AS CATEGORIA, M.NOMBRE AS MARCA, A.ID_MARCA, A.ID_TALLE, A.ID_CATEGORIA FROM ARTICULOS AS A JOIN TALLES AS T ON A.ID_TALLE = T.ID JOIN CATEGORIAS AS C ON A.ID_CATEGORIA = C.ID JOIN MARCAS AS M ON A.ID_MARCA = M.ID");
                Datos.EjecutarLectura();

                while (Datos.Lector.Read())
                {
                    Articulo Objeto = new Articulo();

                    Objeto.Codigo = (string)Datos.Lector["CODIGO"];
                    Objeto.Id = (int)(Datos.Lector["ID"]);
                    Objeto.Nombre = (string)Datos.Lector["NOMBRE"];
                    Objeto.Descripcion = (string)Datos.Lector["DESCRIPCION"];
                    Objeto.Precio = (decimal)Datos.Lector["PRECIO"];
                    Objeto.Stock = (int)(Datos.Lector["STOCK"]);

                    if (!(Datos.Lector["IMG_URL"] is DBNull))
                        Objeto.ImgUrl = (string)Datos.Lector["IMG_URL"];

                    if (!(Datos.Lector["IMG_URL2"] is DBNull))
                        Objeto.ImgUrl2 = (string)Datos.Lector["IMG_URL2"];

                    Marca Marca = new Marca();
                    Objeto.Marca = Marca;
                    Objeto.Marca.Id = (int)(Datos.Lector["ID_MARCA"]);
                    Objeto.Marca.Nombre = (string)Datos.Lector["MARCA"];

                    Categoria Categoria = new Categoria();
                    Objeto.Categoria = Categoria;
                    Objeto.Categoria.Id = (int)(Datos.Lector["ID_CATEGORIA"]);
                    Objeto.Categoria.Nombre = (string)Datos.Lector["CATEGORIA"];

                    Talle Talle = new Talle();
                    Objeto.Talle = Talle;
                    Objeto.Talle.Id = (int)(Datos.Lector["ID_TALLE"]);
                    Objeto.Talle.Medida = (string)Datos.Lector["TALLE"];

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

        public Articulo Buscar(int Id)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("SELECT A.CODIGO, A.ID, A.NOMBRE, A.DESCRIPCION, A.PRECIO, A.STOCK, A.IMG_URL, A.IMG_URL2, A.ESTADO, T.ESTADO AS T_ESTADO, T.MEDIDA AS TALLE, C.ESTADO AS C_ESTADO, C.NOMBRE AS CATEGORIA, M.ESTADO AS M_ESTADO, M.NOMBRE AS MARCA, A.ID_MARCA, A.ID_TALLE, A.ID_CATEGORIA FROM ARTICULOS AS A JOIN TALLES AS T ON A.ID_TALLE = T.ID JOIN CATEGORIAS AS C ON A.ID_CATEGORIA = C.ID JOIN MARCAS AS M ON A.ID_MARCA = M.ID WHERE A.ID = '" + Id + "'");
                Datos.EjecutarLectura();

                Datos.Lector.Read();
                Articulo Objeto = new Articulo();

                Objeto.Codigo = (string)Datos.Lector["CODIGO"];
                Objeto.Id = (int)(Datos.Lector["ID"]);
                Objeto.Nombre = (string)Datos.Lector["NOMBRE"];
                Objeto.Descripcion = (string)Datos.Lector["DESCRIPCION"];
                Objeto.Precio = (decimal)Datos.Lector["PRECIO"];
                Objeto.Stock = (int)(Datos.Lector["STOCK"]);

                if (!(Datos.Lector["IMG_URL"] is DBNull))
                    Objeto.ImgUrl = (string)Datos.Lector["IMG_URL"];

                if (!(Datos.Lector["IMG_URL2"] is DBNull))
                    Objeto.ImgUrl2 = (string)Datos.Lector["IMG_URL2"];

                Objeto.Talle = new Talle();
                Objeto.Talle.Id = (int)Datos.Lector["ID_TALLE"];
                Objeto.Talle.Medida = (string)Datos.Lector["TALLE"];
                Objeto.Talle.Estado = (bool)Datos.Lector["T_ESTADO"];

                Objeto.Categoria = new Categoria();
                Objeto.Categoria.Id = (int)Datos.Lector["ID_CATEGORIA"];
                Objeto.Categoria.Nombre = (string)Datos.Lector["CATEGORIA"];
                Objeto.Categoria.Estado = (bool)Datos.Lector["C_ESTADO"];

                Objeto.Marca = new Marca();
                Objeto.Marca.Id = (int)Datos.Lector["ID_MARCA"];
                Objeto.Marca.Nombre = (string)Datos.Lector["MARCA"];
                Objeto.Marca.Estado = (bool)Datos.Lector["M_ESTADO"];

                Objeto.Estado = (bool)Datos.Lector["ESTADO"];
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

        public void Agregar(Articulo Articulo)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, ID_TALLE, ID_CATEGORIA, ID_MARCA) VALUES (@CODIGO, @NOMBRE, @DESCRIPCION, @PRECIO, @STOCK, @IMG, @ID_TALLE, @ID_CATEGORIA, @ID_MARCA)");

                Datos.SetParametro("@CODIGO", Articulo.Codigo);
                Datos.SetParametro("@NOMBRE", Articulo.Nombre);
                Datos.SetParametro("@DESCRIPCION", Articulo.Descripcion);
                Datos.SetParametro("@PRECIO", Articulo.Precio);
                Datos.SetParametro("@STOCK", Articulo.Stock);
                Datos.SetParametro("@IMG", Articulo.ImgUrl);
                Datos.SetParametro("@ID_TALLE", Articulo.Talle.Id);
                Datos.SetParametro("@ID_CATEGORIA", Articulo.Categoria.Id);
                Datos.SetParametro("@ID_MARCA", Articulo.Marca.Id);

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
                Datos.SetConsulta("DELETE FROM ARTICULOS WHERE ID = '" + Id + "'");

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
        public void Modificar(Articulo Articulo)
        {
            AccesoDatabase Datos = new AccesoDatabase();

            try
            {
                Datos.SetConsulta("UPDATE ARTICULOS SET CODIGO = '" + Articulo.Codigo + "', NOMBRE = '" + Articulo.Nombre + "', " + "DESCRIPCION = '" + Articulo.Descripcion + "', STOCK = '" + Articulo.Stock + "', PRECIO = '" + Articulo.Precio + "', ID_CATEGORIA = '" + Articulo.Categoria.Id + "', ID_TALLE = '" + Articulo.Talle.Id + "', ID_MARCA = '" + Articulo.Marca.Id + "', IMG_URL = '" + Articulo.ImgUrl + "' " + " WHERE ID = '" + Articulo.Id + "'");

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



