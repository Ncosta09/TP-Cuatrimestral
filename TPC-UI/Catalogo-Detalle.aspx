<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalogo-Detalle.aspx.cs" Inherits="TPC_Ortiz_Costa.Catalogo_Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .card {
            border: none
        }

        .product {
            background-color: #eee
        }

        .brand {
            font-size: 13px
        }

        .act-price {
            color: rgb(179, 0, 0);
            font-weight: 700
        }

        .dis-price {
            text-decoration: line-through
        }

        .about {
            font-size: 14px
        }

        .color {
            margin-bottom: 10px
        }

        label.radio {
            cursor: pointer
        }

            label.radio input {
                position: absolute;
                top: 0;
                left: 0;
                visibility: hidden;
                pointer-events: none
            }

            label.radio span {
                padding: 2px 9px;
                border: 2px solid #ff0000;
                display: inline-block;
                color: #ff0000;
                border-radius: 3px;
                text-transform: uppercase
            }

            label.radio input:checked + span {
                border-color: rgb(179, 0, 0);
                background-color: rgb(179, 0, 0);
                color: #fff
            }

        .btn-danger {
            background-color: rgb(179, 0, 0) !important;
            border-color: rgb(179, 0, 0) !important
        }

            .btn-danger:hover {
                background-color: #da0606 !important;
                border-color: #da0606 !important
            }

            .btn-danger:focus {
                box-shadow: none
            }

        .cart i {
            margin-right: 10px
        }
    </style>

    <div style="padding-top: 6rem; padding-bottom: 6rem;">

        <div class="container mt-5 mb-5">
            <div class="row d-flex justify-content-center">
                <div class="col-md-10">
                    <div class="card shadow-sm border-1" style="border-radius: 15px !important;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="images p-3">
                                    <div class="text-center p-4">
                                        <img id="main-image" src="<%:Articulo.ImgUrl %>" width="250" />
                                    </div>
                                    <div class="thumbnail text-center">
                                        <img onclick="change_image(this)" src="<%:Articulo.ImgUrl2 %>" width="70">
                                        <img onclick="change_image(this)" src="<%:Articulo.ImgUrl %>" width="70">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 product" style="border-radius: 15px !important;">
                                <div class="p-4">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="d-flex align-items-center">
                                            <a href="Catalogo.aspx" class="btn btn-light shadow-sm" style="border-radius: 15px !important;">Volver</a> 
                                        </div>
                                        <i class="fa fa-shopping-cart text-muted"></i>
                                    </div>
                                    <div class="mt-4 mb-3">
                                        <span class="text-uppercase text-muted brand"><%:Articulo.Marca.Nombre %></span>
                                        <h5 class="text-uppercase"><%:Articulo.Nombre %></h5>
                                        <div class="price d-flex flex-row align-items-center">
                                            <span class="act-price">$<%:decimal.Round(Articulo.Precio) %></span>
                                            <%--<div class="ml-2"><small class="dis-price">$59</small> <span>40% OFF</span> </div>--%>
                                        </div>
                                    </div>
                                    <p class="about"><%:Articulo.Descripcion %></p>
                                    <div class="sizes mt-4 mb-5">
                                        <h6 class="form-text" style="font-size: 11px;">Talle disponible:</h6>
                                        <label class="radio">
                                            <input type="radio" name="size" checked>
                                            <span><%:Articulo.Talle.Medida %></span> </label>
                                    </div>
                                    <div class="cart mt-4 align-items-center">
                                        <a href="Carrito.aspx?Id=<%: Articulo.Id %>" class="btn btn-sm" style="text-decoration: none; color: inherit;">
                                            <img src="/Img/add.png" style="width: 40px;" />
                                        </a>
                                        <i class="fa fa-heart text-muted mx-2"></i><i class="fa fa-share-alt text-muted"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function change_image(image) {

            var container = document.getElementById("main-image");

            container.src = image.src;
        }

        document.addEventListener("DOMContentLoaded", function (event) {

        });
    </script>

</asp:Content>
