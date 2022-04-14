<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPC_Ortiz_Costa.Carrito" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .size span {
            font-size: 11px
        }

        .color span {
            font-size: 11px
        }

        .product-deta {
            margin-right: 70px
        }

        .pay-button {
            color: #fff
        }

            .pay-button:hover {
                color: #fff
            }

            .pay-button:focus {
                color: #fff;
                box-shadow: none
            }

        .text-grey {
            color: #a39f9f
        }

        .qty i {
            font-size: 11px
        }

        .button {
            transition: all .5s ease !important;
            border-radius: 15px !important;
        }

            .button:hover {
                color: white !important;
                background-color: rgb(179, 0, 0) !important;
            }
    </style>

    <%if (Contenido != null && Contenido.Count() != 0)
        {
    %>
    <div class="container mt-5 mb-5" style="padding-top: 3rem !important;">
    <div class="card card-body shadow-sm border-1" style="border-radius: 15px !important;">
        <div class="d-flex justify-content-center row">
            <div class="col-md-8">

                <% 
                    foreach (var Articulo in Contenido)
                    {
                %>
                <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 shadow-sm border-1" style="border-radius: 15px !important;">
                    <div class="mr-1">
                        <img class="rounded" src="<%:Articulo.ImgUrl %>" width="70"></div>
                    <div class="d-flex flex-column align-items-center product-details">
                        <span class="font-weight-bold"><%:Articulo.Nombre %></span>
                        <div class="d-flex flex-row product-desc">
                            <div class="size mr-1 mx-2"><span class="text-grey">Talle: </span><span class="font-weight-bold"><%:Articulo.Talle.Medida %></span></div>
                            <div class="color"><span class="text-grey">Marca: </span><span class="font-weight-bold"><%:Articulo.Marca.Nombre %></span></div>
                        </div>
                    </div>
                    <div>
                        <h5 class="text-grey">$ <%:decimal.Round(Articulo.Precio) %></h5>
                    </div>
                    <a href="Carrito.aspx?Remove=<%:Articulo.Id %>" style="text-decoration: none;">
                        <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger"></i></div>
                    </a>
                </div>
                <%
                    }
                %>

                <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded card card-body shadow-sm border-0" style="border-radius: 15px !important;">
                    <p class="mx-auto my-auto">Precio: $<%:decimal.Round(Total) %></p>
                    <p class="mx-auto my-auto">Artículos: <%:Cantidad %></p>
                </div>

                <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white shadow-sm border-1" style="border-radius: 15px !important;">
                    <input type="text" class="form-control border-0 gift-card" placeholder="Código de Descuento / Gift Card">
                    <button class="btn btn-outline-danger btn-sm ml-2" style="border-radius: 15px !important;" type="button">Aplicar</button></div>

                <div>
                    <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
                        <div>
                            <a href="Catalogo.aspx" class="btn btn-light shadow-sm button  ml-2">Seguir Comprando</a> 
                            <a href="Pagar.aspx" class="btn btn-light shadow-sm button  ml-2 mx-2">Finalizar Compra</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
     <%}
         else
         {
             Response.Redirect("Catalogo.aspx");
         }%>

</asp:Content>
