using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Ortiz_Costa
{
    public partial class Error : System.Web.UI.Page
    {
        public string Mensaje { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Error"] == null)
            {
                Response.Redirect("Catalogo.aspx");
            }
            else
            {
                Mensaje = Session["Error"].ToString();
            }
        }
    }
}