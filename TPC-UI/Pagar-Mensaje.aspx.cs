using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Ortiz_Costa
{
    public partial class Pagar_Finalizado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Venta"] == null)
            {
                Session.Add("Error", "Dirección incorrecta o inexistente, vuelva a intentarlo o póngase en contacto con Soporte Técnico.");
                Response.Redirect("Error.aspx");
            }
            Session["Carrito"] = null;
            Session["Cantidad"] = null;
        }
    }
}