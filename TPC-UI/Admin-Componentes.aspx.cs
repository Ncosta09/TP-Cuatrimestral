using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Negocio;
using TPC_Dominio;

namespace TPC_Ortiz_Costa
{
    public partial class Admin_Componentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Session.Add("Error", "Dirección incorrecta o inexistente, vuelva a intentarlo o póngase en contacto con Soporte Técnico.");
                Response.Redirect("Error.aspx");
            }

            if (Session["Usuario"] != null)
            {
                Usuario User = (Usuario)Session["Usuario"];
                if (!User.Tipo)
                {
                    Session.Add("Error", "Usted no cuenta con los permisos necesarios para ingresar en esta sección.");
                    Response.Redirect("Error.aspx");
                }
            }

            if (!IsPostBack)
            {
                MarcaNegocio MarcaNegocio = new MarcaNegocio();
                ddlMarca.DataSource = MarcaNegocio.Listar().FindAll(x => x.Estado == true);
                ddlMarca.DataTextField = "Nombre";
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataBind();

                TalleNegocio TalleNegocio = new TalleNegocio();
                ddlTalle.DataSource = TalleNegocio.Listar().FindAll(x => x.Estado == true);
                ddlTalle.DataTextField = "Medida";
                ddlTalle.DataValueField = "Id";
                ddlTalle.DataBind();

                CategoriaNegocio CategoriaNegocio = new CategoriaNegocio();
                ddlCategoria.DataSource = CategoriaNegocio.Listar().FindAll(x => x.Estado == true);
                ddlCategoria.DataTextField = "Nombre";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (int.Parse(ddlMarca.SelectedItem.Value) != -1)
            {
                MarcaNegocio Negocio = new MarcaNegocio();
                int Id = int.Parse(ddlMarca.SelectedItem.Value);
                Negocio.BajaLogica(Id);
            }

            if (int.Parse(ddlTalle.SelectedItem.Value) != -1)
            {
                TalleNegocio Negocio = new TalleNegocio();
                int Id = int.Parse(ddlTalle.SelectedItem.Value);
                Negocio.BajaLogica(Id);
            }

            if (int.Parse(ddlCategoria.SelectedItem.Value) != -1)
            {
                CategoriaNegocio Negocio = new CategoriaNegocio();
                int Id = int.Parse(ddlCategoria.SelectedItem.Value);
                Negocio.BajaLogica(Id);
            }
            Response.Redirect("Admin-Componentes.aspx");
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (txtMarca.Text != "")
            {
                Marca Marca = new Marca();
                Marca.Nombre = txtMarca.Text;
                MarcaNegocio Negocio = new MarcaNegocio();
                Negocio.Agregar(Marca);
                txtMarca.Text = "";
            }

            if (txtTalle.Text != "")
            {
                Talle Talle = new Talle();
                Talle.Medida = txtTalle.Text;
                TalleNegocio Negocio = new TalleNegocio();
                Negocio.Agregar(Talle);
                txtTalle.Text = "";
            }

            if (txtCategoria.Text != "")
            {
                Categoria Categoria = new Categoria();
                Categoria.Nombre = txtCategoria.Text;
                CategoriaNegocio Negocio = new CategoriaNegocio();
                Negocio.Agregar(Categoria);
                txtCategoria.Text = "";
            }
            Response.Redirect("Admin-Componentes.aspx");
        }
    }
}