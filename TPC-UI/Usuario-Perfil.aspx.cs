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
    public partial class Usuario_Perfil : System.Web.UI.Page
    {
        public Usuario Usuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Session.Add("Error", "Dirección incorrecta o inexistente, vuelva a intentarlo o póngase en contacto con Soporte Técnico.");
                Response.Redirect("Error.aspx");
            }
            Usuario = (Usuario)Session["Usuario"];

            UsuarioNegocio UsuarioNegocio = new UsuarioNegocio();
            Usuario.Domicilio = new Domicilio();
            Usuario = UsuarioNegocio.BuscarCompleto(Usuario.Id);


            if (!IsPostBack)
            {
                if (Usuario.Nombre != null && Usuario.Nombre != "")
                {
                    txtNombre.Text = Usuario.Nombre;
                }
                if (Usuario.Apellido != null && Usuario.Apellido != "")
                {
                    txtApellido.Text = Usuario.Apellido;
                }
                if (Usuario.Email != null && Usuario.Email != "")
                {
                    txtEmail.Text = Usuario.Email;
                }
                if (Usuario.Telefono != null && Usuario.Telefono != "")
                {
                    txtTelefono.Text = Usuario.Telefono;
                }

                if (Usuario.Domicilio != null)
                {
                    if (Usuario.Domicilio.Calle != null && Usuario.Domicilio.Calle != "")
                    {
                        txtCalle.Text = Usuario.Domicilio.Calle;
                    }
                    if (Usuario.Domicilio.Numero != null && Usuario.Domicilio.Numero != "")
                    {
                        txtNumero.Text = Usuario.Domicilio.Numero;
                    }
                    if (Usuario.Domicilio.Provincia != null && Usuario.Domicilio.Provincia != "")
                    {
                        txtProvincia.Text = Usuario.Domicilio.Provincia;
                    }
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtNombre.ReadOnly == true)
                return;

            if (txtNombre.Text != null)
            {
                Usuario.Nombre = txtNombre.Text;
            }
            if (txtApellido.Text != null)
            {
                Usuario.Apellido = txtApellido.Text;
            }
            if (txtEmail.Text != null)
            {
                Usuario.Email = txtEmail.Text;
            }
            if (txtTelefono.Text != null)
            {
                Usuario.Telefono = txtTelefono.Text;
            }

            if (txtCalle.Text != null)
            {
                Usuario.Domicilio.Calle = txtCalle.Text;
            }
            if(txtNumero.Text != null)
            {
                Usuario.Domicilio.Numero = txtNumero.Text;
            }
            if(txtProvincia.Text != null)
            {
                Usuario.Domicilio.Provincia = txtProvincia.Text;               
            }

            DomicilioNegocio DomicilioNegocio = new DomicilioNegocio();
            if (DomicilioNegocio.Existe(Usuario.Domicilio.Id))
            {
                DomicilioNegocio.Modificar(Usuario.Domicilio);
            }
            else
            {
                DomicilioNegocio.Agregar(Usuario.Domicilio);
            }

            UsuarioNegocio UsuarioNegocio = new UsuarioNegocio();
            UsuarioNegocio.ModificarSimple(Usuario);

            txtNombre.ReadOnly = true;
            txtApellido.ReadOnly = true;
            txtTelefono.ReadOnly = true;
            txtEmail.ReadOnly = true;
            txtCalle.ReadOnly = true;
            txtNumero.ReadOnly = true;
            txtProvincia.ReadOnly = true;
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtNombre.ReadOnly)
            {
                txtNombre.ReadOnly = false;
                txtApellido.ReadOnly = false;
                txtTelefono.ReadOnly = false;
                txtEmail.ReadOnly = false;
                txtCalle.ReadOnly = false;
                txtNumero.ReadOnly = false;
                txtProvincia.ReadOnly = false;
            }
            else
            {
                txtNombre.ReadOnly = true;
                txtApellido.ReadOnly = true;
                txtTelefono.ReadOnly = true;
                txtEmail.ReadOnly = true;
                txtCalle.ReadOnly = true;
                txtNumero.ReadOnly = true;
                txtProvincia.ReadOnly = true;
            }
        }

        protected void btnPass_Click(object sender, EventArgs e)
        { 
            Response.Redirect("Usuario-Restablecer.aspx");
        }

        protected void btnHistorial_Click(object sender, EventArgs e)
        {

        }
    }
}