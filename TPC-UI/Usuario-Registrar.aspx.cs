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
    public partial class Usuario_Registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                Session.Add("Error", "Dirección incorrecta o inexistente, vuelva a intentarlo o póngase en contacto con Soporte Técnico.");
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Usuario Usuario = new Usuario();
            Usuario.Username = txtUsername.Text;
            Usuario.Password = txtPassword.Text;
            Usuario.Email = txtEmail.Text;

            UsuarioNegocio Negocio = new UsuarioNegocio();
            Negocio.Agregar(Usuario);
            Response.Redirect("Usuario-Ingresar.aspx");
        }
    }
}