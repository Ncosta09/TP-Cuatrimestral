<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin-Componentes.aspx.cs" Inherits="TPC_Ortiz_Costa.Admin_Componentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .Card {
            padding: 30px 40px;
            margin-bottom: 60px;
            border: none !important;
            box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2)
        }

        .blue-text {
            color: #00BCD4
        }

        .form-control-label {
            margin-bottom: 0
        }

        txtbox,
        textarea,
        button {
            padding: 8px 15px;
            border-radius: 5px !important;
            margin: 5px 0px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            font-size: 18px !important;
            font-weight: 300
        }

            input:focus,
            textarea:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                border: 1px solid #00BCD4;
                outline-width: 0;
                font-weight: 400
            }

        .btn-block {
            text-transform: uppercase;
            font-size: 15px !important;
            font-weight: 400;
            height: 43px;
            cursor: pointer
        }

            .btn-block:hover {
                color: #fff !important
            }

        button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0
        }

         .button {
            transition: all .5s ease !important;
            border-radius: 15px !important;           
        }

            .button-red:hover {
                color: white !important;
                background-color: rgb(179, 0, 0) !important;
            }
            .button-green:hover {
                color: white !important;
                background-color: rgb(0,121,0) !important;
            }

    </style>



    <div style="padding-top: 5rem !important; padding-bottom: 7rem !important;">
        <div class="container-fluid px-1 py-5 mx-auto">
            <div class="row d-flex justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                    <h3>Componentes</h3>
                    <p class="blue-text">
                        En caso de eliminar un componente<br>
                        en uso, se le asignara el componente "desconocido" al artículo afectado.
                    </p>
                    <div class="Card shadow-sm" style="border-radius: 15px;">
                        <%--<h5 class="text-center mb-4">Subtítulo.</h5>--%>
                        <div class="row justify-content-between text-left">

                            <div class="form-group col-sm-6 flex-column d-flex">
                                <label class="form-control-label px-3 py-1">Categoría<span class="text-danger"> *</span></label>
                                <asp:TextBox runat="server" CssClass="form-control px-3" ID="txtCategoria" />
                            </div>
                            <div class="form-group col-sm-6 flex-column d-flex">
                                <label class="form-control-label px-3 py-1">Categoría<span class="text-danger"> *</span></label>
                                <asp:DropDownList AppendDataBoundItems="true" runat="server" CssClass="form-select txtbox px-3" ID="ddlCategoria">
                                    <Items>
                                        <asp:ListItem Text="Seleccionar" Value="-1" />
                                    </Items>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row justify-content-between text-left">
                            <div class="form-group col-sm-6 flex-column d-flex">
                                <label class="form-control-label px-3 py-1">Marca<span class="text-danger"> *</span></label>
                                <asp:TextBox runat="server" CssClass="form-control px-3" ID="txtMarca" />
                            </div>
                            <div class="form-group col-sm-6 flex-column d-flex">
                                <label class="form-control-label px-3 py-1">Marca<span class="text-danger"> *</span></label>
                                <asp:DropDownList AppendDataBoundItems="true" runat="server" CssClass="form-select txtbox px-3" ID="ddlMarca">
                                    <Items>
                                        <asp:ListItem Text="Seleccionar" Value="-1" />
                                    </Items>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row justify-content-between text-left">
                            <div class="form-group col-sm-6 flex-column d-flex">
                                <label class="form-control-label px-3 py-1">Talle<span class="text-danger"> *</span></label>
                                <asp:TextBox runat="server" CssClass="form-control px-3" ID="txtTalle" />
                            </div>
                            <div class="form-group col-sm-6 flex-column d-flex">
                                <label class="form-control-label px-3 py-1">Talle<span class="text-danger"> *</span></label>
                                <asp:DropDownList AppendDataBoundItems="true" runat="server" CssClass="form-select txtbox px-3" ID="ddlTalle">
                                    <Items>
                                        <asp:ListItem Text="Seleccionar" Value="-1" />
                                    </Items>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row justify-content-between mt-3">
                            <div class="form-group col-sm-6">
                                <asp:Button Text="Agregar" CssClass="btn button button-green btn-light shadow-sm my-1" runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" />
                            </div>
                            <div class="form-group col-sm-6">
                                <asp:Button Text="Eliminar" runat="server" CssClass="btn button button-red btn-light shadow-sm my-1" ID="btnEliminar" OnClick="btnEliminar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
