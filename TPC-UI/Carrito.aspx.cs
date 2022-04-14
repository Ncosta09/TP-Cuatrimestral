using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Dominio;
using TPC_Negocio;

namespace TPC_Ortiz_Costa
{
    public partial class Carrito : System.Web.UI.Page
    {
        public List<Articulo> Contenido { get; set; }

        public decimal Total { get; set; }

        public int Cantidad { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["Id"] == null && Session["Carrito"] == null)
                return;
            
            if (Request.QueryString["Id"] != null)
            {
                int Id = int.Parse(Request.QueryString["Id"]);

                ArticuloNegocio Negocio = new ArticuloNegocio();
                Articulo Articulo = new Articulo();

                Articulo = Negocio.Buscar(Id);

                if (Session["Carrito"] == null)
                {
                    List<Articulo> Carrito = new List<Articulo>();
                    Carrito.Add(Articulo);
                    Session["Carrito"] = Carrito;
                }
                else
                {
                    List<Articulo> Carrito = new List<Articulo>();
                    Carrito = (List<Articulo>)Session["Carrito"];
                    Carrito.Add(Articulo);
                    Session["Carrito"] = Carrito;
                }
            }
            else if (Request.QueryString["Remove"] != null)
            {
                int Id = int.Parse(Request.QueryString["Remove"]);

                Contenido = (List<Articulo>)Session["Carrito"];
                foreach (var Articulo in Contenido)
                {
                    if (Articulo.Id == Id)
                    {
                        Contenido.Remove(Articulo);
                        if (Contenido.Count() == 0)
                        {
                            Response.Redirect("Catalogo.aspx");
                        }
                        break;
                    }
                }
                Session["Carrito"] = Contenido;
            }
            Contenido = (List<Articulo>)Session["Carrito"];
            Session["Cantidad"] = (List<Articulo>)Session["Carrito"];


            List<Articulo> Lista = new List<Articulo>();
            Lista = (List<Articulo>)Session["Carrito"];

            foreach (var item in Lista)
            {
                Total += item.Precio;
                Cantidad++;
            }
        }
    }
}
