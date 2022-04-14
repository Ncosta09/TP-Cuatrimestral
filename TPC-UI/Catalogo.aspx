<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TPC_Ortiz_Costa.Catalogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .zoom {
            border-radius: 15px;
            transition: transform .4s !important; /* Animation */
            box-shadow: 0 1px 2px rgba(0,0,0,0.15) !important;
        }
            .zoom:hover {               
                box-shadow: 0 5px 14px rgba(0,0,0,0.1) !important;
                transform: scale(1.05) !important; /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
            }

    </style>

    <div class="body-body">
        <div class="input-group rounded"></div>
        <div class="carousel" data-flickity='{ "wrapAround": true, "autoPlay": true, "imagesLoaded":true }'>

            <div class="carousel-cell">
                <img class="w3-image" style="width: 100%" src="/Img/nikeCarrusel.jpg">
            </div>
            <div class="carousel-cell">
                <img class="w3-image" style="width: 100%;" src="Img/vansCarruseel.jpg">
            </div>
            <%--        <div class="carousel-cell">
                <img class="w3-image" style="width: 100%" src="URL-IMAGEN!!">
            </div>--%>
        </div>


<section class="author-archive" style="padding-top: 5rem !important; padding-bottom: 0 !important;">
        <div class="container">
            <input type="radio" id="All" name="categories" value="All" checked>
            <input type="radio" id="Remeras" name="categories" value="Remeras">
            <input type="radio" id="Pantalones" name="categories" value="Pantalones">
            <input type="radio" id="Calzados" name="categories" value="Calzados">
            <input type="radio" id="Camperas" name="categories" value="Camperas">
            <input type="radio" id="Buzos" name="categories" value="Buzos">
            <input type="radio" id="Accesorios" name="categories" value="Accesorios">

            <ol class="filters">
                <li>
                    <%--<label for="All">All</label>--%>
                    <asp:Button ID="btnAll" for="All" Text="All" runat="server" CssClass="btn btn-light shadow-sm mx-2 my-1 button-green" style="border-radius: 15px;" />
                </li>
                <li>
                    <%--<label for="Remeras">Remeras</label>--%>
                    <asp:Button OnClick="btnRemeras_Click" ID="btnRemeras" for="Remeras" Text="Remeras" runat="server" CssClass="btn btn-light shadow-sm mx-2 my-1 button-green" style="border-radius: 15px;" />
                </li>
                <li>
                    <%--<label for="Pantalones">Pantalones</label>--%>
                    <asp:Button OnClick="btnPantalones_Click" ID="btnPantalones" for="Pantalones" Text="Pantalones" runat="server" CssClass="btn btn-light shadow-sm mx-2 my-1 button-green" style="border-radius: 15px;" />
                </li>
                <li>
                    <%--<label for="Calzados">Calzados</label>--%>
                    <asp:Button OnClick="btnCalzados_Click" ID="btnCalzados" for="Calzados" Text="Calzados" runat="server" CssClass="btn btn-light shadow-sm mx-2 my-1 button-green" style="border-radius: 15px;" />
                </li>
                <li>
                    <%--<label for="Camperas">Camperas</label>--%>
                    <asp:Button OnClick="btnCamperas_Click" ID="btnCamperas" for="Camperas" Text="Camperas" runat="server" CssClass="btn btn-light shadow-sm mx-2 my-1 button-green" style="border-radius: 15px;" />
                </li>
                <li>
                    <%--<label for="Buzos">Buzos</label>--%>
                    <asp:Button OnClick="btnBuzos_Click" ID="btnBuzos" for="Buzos" Text="Buzos" runat="server" CssClass="btn btn-light shadow-sm mx-2 my-1 button-green" style="border-radius: 15px;" />
                </li>
                <li>
                    <%--<label for="Accesorios">Accesorios</label>--%>
                    <asp:Button OnClick="btnAccesorios_Click" ID="btnAccesorios" for="Accesorios" Text="Accesorios" runat="server" CssClass="btn btn-light shadow-sm mx-2 my-1 button-green" style="border-radius: 15px;" />
                </li>
            </ol>
        </div>
    </section>

        <%if (Usuario != null && Usuario.Tipo == true)
            {%>
        <div>
            <a href="Admin-Articulos.aspx" style="text-decoration: none; color: inherit;">
                <div class="Agregar-btn shadow-sm mx-auto" style="width: 78% !important; border-radius: 15px; border: 1px solid; border-color: lightgray !important;">
                    <asp:ImageButton class="btn" Style="width: 60px;" ImageUrl="~/Img/upload.png" runat="server" ID="btnAlta" OnClick="btnAlta_Click" />
                </div>
            </a>
        </div>
        <%}%>

        <%if (Filtro)
            {%>
        <div class="my-3">
            <div class="card h-100 border-1 shadow-sm border-1 w-25 mx-auto" style="border-radius: 15px;">
                <div class="card-body">
                    <h5 class="my-auto text-center"><i>No hay artículos para mostrar!</i></h5>
                </div>
            </div>
        </div>
        <%} %>

        <div class="row row-cols-1 row-cols-md-3 g-4 mx-auto" style="width: 80% !important">
            <% foreach (var Articulo in ListaArticulos)
                {
            %>
            <div class="col">
                <div class="card border-1 shadow-sm zoom">
                    <%if (Usuario != null && Usuario.Tipo == true)
                        {%>
                    <div class="my-2">
                        <a href="Admin-Articulos.aspx?Modify=<%:Articulo.Id %>" class="btn shadow-sm border-1 shadow-sm mx-2" style="border-radius: 15px !important;">
                            <img src="/Img/edit.png" style="width: 25px;" />
                        </a>
                        <a href="Catalogo.aspx?Delete=<%:Articulo.Id %>" class="btn shadow-sm border-1 shadow-sm" style="border-radius: 15px !important;">
                            <img src="/Img/delete.png" style="width: 25px;" />
                        </a>
                    </div>
                    <%}%>
                    <a href="Catalogo-Detalle.aspx?Id=<%: Articulo.Id %>" style="text-decoration: none; color: inherit;">
                        <div class="card bg-transparent border-0">
                            <img class="card-img-top w-50 mx-auto" src="<%: Articulo.ImgUrl %>">
                            <div class="card-body">
                                <h5 class="card-title text-center"><%: Articulo.Nombre %></h5>
                                <p class="text-center text-black-50" style="font-size: 11px !important;"><i>Código: <%: Articulo.Codigo %></i></p>
                            </div>
                        </div>
                    </a>
                    <div class="card-footer">
                        <div class="d-flex justify-content-between w-100 position-relative top-40-percent">
                            <div >
                                <small class="text-muted">Precio: $<%: decimal.Round(Articulo.Precio) %></small><br>
                                <small class="text-muted">Talle: <%: Articulo.Talle.Medida %></small>
                            </div>
                            <a href="Carrito.aspx?Id=<%: Articulo.Id %>" class="btn btn-sm" style="text-decoration: none; color: inherit;">
                                <img src="/Img/add.png" style="width: 40px;" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>

    </div>
    <footer class="text-center text-lg-start text-muted" style="background-color: transparent !important; padding-top: 8rem !important; padding-bottom: 3rem !important;">
        <section>
            <hr class="text-black-50 w-75 mx-auto" />
            <div class="container text-center text-md-start mt-5">
                <div class="row mt-3" style="padding-left: 5rem !important;">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3"></i>Ecommerce
                        </h6>
                        <p>
                            Las mejores marcas de indumentaria y accesorios al alcance de la palma de tu mano.
                        </p>
                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold mb-4 mx-auto">Newsletter
                        </h6>
                        <p>
                            <a href="#!" class="text-reset" style="text-decoration: none !important;">Articulo 1</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset" style="text-decoration: none !important;">Articulo 2</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset" style="text-decoration: none !important;">Articulo 3</a>
                        </p>
                    </div>

                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold mb-4">Utilidades
                        </h6>
                        <p>
                            <a href="#!" class="text-reset" style="text-decoration: none !important;">Guía de Talles</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset" style="text-decoration: none !important;">Guía de Compra</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset" style="text-decoration: none !important;">FAQ</a>
                        </p>
                    </div>

                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <h6 class="text-uppercase fw-bold mb-4">Ubicación
                        </h6>
                        <p><i class="fas fa-home me-3"></i>Buenos Aires</p>
                        <p><i class="fas fa-envelope me-3"></i>info@eCommerce.com</p>
                    </div>
                </div>
            </div>
        </section>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
</asp:Content>
