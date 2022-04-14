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
    public partial class Catalogo_Detalle : System.Web.UI.Page
    {
        public Articulo Articulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(Request.QueryString["Id"]);
            ArticuloNegocio Datos = new ArticuloNegocio();
            Articulo = Datos.Buscar(Id);

            if (Articulo.Marca.Estado == false)
            {
                Articulo.Marca.Nombre = "Desconocida";
            }
            else if (Articulo.Categoria.Estado == false)
            {
                Articulo.Categoria.Nombre = "Desconocida";
            }
            else if (Articulo.Talle.Estado == false)
            {
                Articulo.Talle.Medida = "Desconocido";
            }
        }
    }
}