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
    public partial class Catalogo : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }

        public Usuario Usuario { get; set; }

        public bool Filtro { get; set; } = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["Logout"] != null)
            {
                Session["Usuario"] = null;
                Response.Redirect("Catalogo.aspx");
            }

            if (Session["Usuario"] != null)
            {
                Usuario = (Usuario)Session["Usuario"];
            }

            if (Request.QueryString["Delete"] != null)
            {
                int Id = int.Parse(Request.QueryString["Delete"]);
                ArticuloNegocio Objeto = new ArticuloNegocio();
                Objeto.Eliminar(Id);
            }

            ArticuloNegocio ArticuloNegocio = new ArticuloNegocio();
            ListaArticulos = ArticuloNegocio.Listar();
         
        }

        protected void btnAlta_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Admin-Articulos.aspx");
        }

        protected void btnRemeras_Click(object sender, EventArgs e)
        {
            ListaArticulos = ListaArticulos.FindAll(x => x.Categoria.Nombre == "Remera");
            if(ListaArticulos.Count() == 0)
            {
                Filtro = true;
            }
        }

        protected void btnPantalones_Click(object sender, EventArgs e)
        {
            ListaArticulos = ListaArticulos.FindAll(x => x.Categoria.Nombre == "Pantalón");
            if (ListaArticulos.Count() == 0)
            {
                Filtro = true;
            }
        }

        protected void btnCalzados_Click(object sender, EventArgs e)
        {
            ListaArticulos = ListaArticulos.FindAll(x => x.Categoria.Nombre == "Calzado");
            if (ListaArticulos.Count() == 0)
            {
                Filtro = true;
            }
        }

        protected void btnCamperas_Click(object sender, EventArgs e)
        {
            ListaArticulos = ListaArticulos.FindAll(x => x.Categoria.Nombre == "Campera");
            if (ListaArticulos.Count() == 0)
            {
                Filtro = true;
            }
        }

        protected void btnBuzos_Click(object sender, EventArgs e)
        {
            ListaArticulos = ListaArticulos.FindAll(x => x.Categoria.Nombre == "Buzo");
            if (ListaArticulos.Count() == 0)
            {
                Filtro = true;
            }
        }

        protected void btnAccesorios_Click(object sender, EventArgs e)
        {
            ListaArticulos = ListaArticulos.FindAll(x => x.Categoria.Nombre == "Accesorio");
            if (ListaArticulos.Count() == 0)
            {
                Filtro = true;
            }
        }
    }
}