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
    public partial class Admin_Articulos : System.Web.UI.Page
    {
        public bool Modificar { get; set; }
        public int Id { get; set; }
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
                CategoriaNegocio CategoriaNegocio = new CategoriaNegocio();
                ddlCategoria.DataSource = CategoriaNegocio.Listar().FindAll(x => x.Estado == true);
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataTextField = "Nombre";
                ddlCategoria.DataBind();

                MarcaNegocio MarcaNegocio = new MarcaNegocio();
                ddlMarca.DataSource = MarcaNegocio.Listar().FindAll(x => x.Estado == true);
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataTextField = "Nombre";
                ddlMarca.DataBind();

                TalleNegocio TalleNegocio = new TalleNegocio();
                ddlTalle.DataSource = TalleNegocio.Listar().FindAll(x => x.Estado == true);
                ddlTalle.DataValueField = "Id";
                ddlTalle.DataTextField = "Medida";
                ddlTalle.DataBind();
            }
            if (Request.QueryString["Modify"] != null)
            {
                Modificar = true;
                Id = int.Parse(Request.QueryString["Modify"]);
            }
            if ((Request.QueryString["Modify"] != null) && !IsPostBack)
            {
                ArticuloNegocio Negocio = new ArticuloNegocio();
                Articulo Articulo = new Articulo();
                Articulo = Negocio.Buscar(Id);

                txtCodigo.Text = Articulo.Codigo;
                txtNombre.Text = Articulo.Nombre;
                txtDescripcion.Text = Articulo.Descripcion;
                txtPrecio.Text = (decimal.Round(Articulo.Precio)).ToString();
                txtStock.Text = Articulo.Stock.ToString();
                txtImg.Text = Articulo.ImgUrl;
                txtImg2.Text = Articulo.ImgUrl2;

                if (Articulo.Marca.Estado)
                {
                    ddlMarca.SelectedItem.Value = Articulo.Marca.Id.ToString();
                    ddlMarca.SelectedItem.Text = Articulo.Marca.Nombre;
                }
                else
                {
                    ddlMarca.Items.Insert(0, new ListItem("Seleccionar", "-1"));
                }

                if (Articulo.Talle.Estado)
                {
                    ddlTalle.SelectedItem.Value = Articulo.Talle.Id.ToString();
                    ddlTalle.SelectedItem.Text = Articulo.Talle.Medida;
                }
                else
                {
                    ddlTalle.Items.Insert(0, new ListItem("Seleccionar", "-1"));
                }

                if (Articulo.Categoria.Estado)
                {
                    ddlCategoria.SelectedItem.Value = Articulo.Categoria.Id.ToString();
                    ddlCategoria.SelectedItem.Text = Articulo.Categoria.Nombre;
                }
                else
                {
                    ddlCategoria.Items.Insert(0, new ListItem("Seleccionar", "-1"));
                }
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Articulo Articulo = new Articulo();
            Articulo.Codigo = txtCodigo.Text;
            Articulo.Nombre = txtNombre.Text;
            Articulo.Descripcion = txtDescripcion.Text;
            Articulo.Precio = decimal.Parse(txtPrecio.Text);
            Articulo.Stock = Convert.ToInt32(txtStock.Text);
            Articulo.ImgUrl = txtImg.Text;
            Articulo.ImgUrl2 = txtImg2.Text;

            Articulo.Marca = new Marca();
            Articulo.Marca.Id = int.Parse(ddlMarca.SelectedItem.Value);
            Articulo.Marca.Nombre = ddlMarca.SelectedItem.Text;

            Articulo.Categoria = new Categoria();
            Articulo.Categoria.Id = int.Parse(ddlCategoria.SelectedItem.Value);
            Articulo.Categoria.Nombre = ddlCategoria.SelectedItem.Text;

            Articulo.Talle = new Talle();
            Articulo.Talle.Id = int.Parse(ddlTalle.SelectedItem.Value);
            Articulo.Talle.Medida = ddlTalle.SelectedItem.Text;

            ArticuloNegocio Negocio = new ArticuloNegocio();

            if (Modificar)
            {
                Articulo.Id = Id;
                Negocio.Modificar(Articulo);
            }
            else
            {
                Negocio.Agregar(Articulo);
            }
            Response.Redirect("Catalogo.aspx");
        }
    }
}
