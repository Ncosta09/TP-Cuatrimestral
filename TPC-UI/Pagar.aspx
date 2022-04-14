<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pagar.aspx.cs" Inherits="TPC_Ortiz_Costa.Comprar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .button {
            transition: all .5s ease !important;
            border-radius: 15px !important;           
        }

            .button:hover {
                color: white !important;
                background-color: rgb(179, 0, 0) !important;
            }
    </style>




    <div style="padding-top: 7rem; padding-bottom: 3rem">
        <div class="card card-body shadow-sm mx-auto" style="width: 80% !important; border-radius: 15px !important;">
            <div class="container">
                <div class="row">

                    <%--Carrito--%>
                    <div class="col-md-4 order-md-2 mb-4">
                        <h4 class="d-flex justify-content-between align-items-center mb-2 mx-3">
                            <span class="text-muted"><b>Carrito</b></span>
                            <span class="badge-pill"><%:Contenido %></span>
                        </h4>
                        <ul class="list-group mb-3">

                            <% foreach (var Articulo in Carrito)
                                {%>                             
                            <li class="list-group-item d-flex justify-content-between lh-condensed border-0 shadow-sm mt-1"  style="border-radius: 15px !important;">
                                <div>
                                    <h6 class="my-0"><%:Articulo.Nombre %></h6>
                                    <small class="text-muted">Talle: <%:Articulo.Talle.Medida %></small>
                                </div>
                                <span class="text-muted">$<%:decimal.Round(Articulo.Precio) %></span>
                            </li>
                            <%} %>

                            <li class="list-group-item d-flex justify-content-between my-3 shadow-sm" style="border-radius: 15px !important;">
                                <span>Total ($)</span>
                                <strong>$<%:decimal.Round(Precio) %></strong>
                            </li>
                        </ul>

                        <div class="card p-2 bg-transparent border-0">
                            <div class="input-group">
                                <div class="input-group-append mx-auto">
                                    <asp:Button OnClick="btnSucursal_Click" ID="btnSucursal" style="z-index: 0" class="btn btn-light text-dark shadow-sm button" Text="Retiro en Sucursal" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Direccion del Comprador--%>
                    <div class="col-md-8 order-md-1">
                        <h4 class="mb-3"><b>Información del Envío</b></h4>
                        <div class="needs-validation" novalidate="">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName">Nombre</label>
                                    <asp:TextBox ID="txtNombre" placeholder="Nombre" CssClass="form-control" runat="server" />

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Apellido</label>
                                    <asp:TextBox ID="txtApellido" placeholder="Apellido" CssClass="form-control" runat="server" />

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="email">Email<span class="text-muted"> (Requerido)</span></label>
                                    <asp:TextBox ID="txtEmail" placeholder="email@ejemplo.com" CssClass="form-control" runat="server" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email">Teléfono</label>
                                    <asp:TextBox ID="txtTelefono" placeholder="(+54) 011 XXXX XXXX" CssClass="form-control" runat="server" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="address">Calle</label>
                                    <asp:TextBox ID="txtCalle" placeholder="Av. 9 de Julio" CssClass="form-control" runat="server" />

                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="address">Número</label>
                                    <asp:TextBox ID="txtNumero" placeholder="2550" CssClass="form-control" runat="server" />
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="address">Provincia</label>
                                    <asp:TextBox ID="txtProvincia" placeholder="Buenos Aires" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                        </div>

                        <%if (Usuario != null)
                            {%>
                        <hr class="mb-4">
                        <div class="custom-control custom-checkbox">
                            <asp:CheckBox ID="cbxUsuario" CssClass="custom-control-label" runat="server" />
                            <label class="custom-control-label" for="same-address">Actualizar datos personales en mi perfil.</label>
                        </div>
                        <%} %>
                            <hr class="mb-4">

                            <%--Forma de pago--%>
                            <h4 class="mb-3"><b>Método de Pago</b></h4>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio w-25">
                                    <asp:DropDownList ID="ddlPago" AppendDataBoundItems="true" runat="server" CssClass="form-select">
                                        <Items>
                                            <asp:ListItem Text="Seleccionar" Value="-1" />
                                            <asp:ListItem Text="Efectivo" />
                                            <asp:ListItem Text="Débito" />
                                            <asp:ListItem Text="Crédito" />
                                        </Items>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <hr class="mb-4">

                            <%--Datos de la tarjeta--%>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="cc-name">Títular</label>
                                    <input type="text" class="form-control" id="cc-name" placeholder="">
                                    <small class="text-muted">Nombre completo de la persona títular.</small>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="cc-number">Número</label>
                                    <input type="text" class="form-control" placeholder="">

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">Vencimiento</label>
                                    <input type="text" class="form-control" id="Fecha" placeholder="">

                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">CVV</label>
                                    <input type="text" class="form-control" id="Código de seguridad" placeholder="">

                                </div>
                                <div class="col-md-3 mb-3 my-auto">
                                    <asp:DropDownList ID="ddlCuotas" AppendDataBoundItems="true" runat="server" class="form-select">
                                        <Items>
                                            <asp:ListItem Text="Cuotas" Value="-1" />
                                            <asp:ListItem value="1" Text="1" />
                                            <asp:ListItem value="3" Text="3 s/interés" />
                                            <asp:ListItem value="6" Text="6 s/interés" />
                                            <asp:ListItem value="12" Text="12 s/interés" />
                                        </Items>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <hr class="mb-4">
                            <asp:Button ID="btnFinalizar" OnClick="btnFinalizar_Click" Text="Finalizar Compra" CssClass="btn btn-light shadow-sm button btn-block" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>
