using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Dominio;

namespace TPC_Ortiz_Costa
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public int Cantidad { get; set; } = 0;
        public Usuario Usuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Articulo> Lista = new List<Articulo>();
            Lista = (List<Articulo>)Session["Cantidad"];

            if (Lista != null)
            {
                Cantidad = Lista.Count();
            }
            if (Session["Usuario"] != null)
            {
                Usuario = (Usuario)Session["Usuario"];
            }
        }
    }
}