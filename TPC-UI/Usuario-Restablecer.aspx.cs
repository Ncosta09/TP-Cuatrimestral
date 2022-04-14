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
    public partial class Usuario_Restablecer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio Negocio = new UsuarioNegocio();
            Usuario Usuario = new Usuario();

            Usuario = Negocio.Listar().Find(x => x.Username == txtUsername.Text);
            if (Usuario != null && Usuario.Email == txtEmail.Text)
            {
                Session["Usuario"] = Usuario;
                Response.Redirect("Usuario-Restablecer.aspx");
            }
            Session.Add("Error", "Email y/o Usuario inexistente, vuelva a intentarlo o póngase en contacto con Soporte Técnico.");
            Response.Redirect("Error.aspx");
        }

        protected void btnRestablecer_Click(object sender, EventArgs e)
        {
            Usuario Usuario = new Usuario();
            Usuario = (Usuario)Session["Usuario"];

            if (txtRestablecer.Text == txtVerificar.Text)
            {
                Usuario.Password = txtRestablecer.Text;
                UsuarioNegocio Negocio = new UsuarioNegocio();
                Negocio.ModificarPass(Usuario);
                Session["Usuario"] = null;
                Response.Redirect("Catalogo.aspx");
            }
        }
    }
}