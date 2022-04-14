<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin-Articulos.aspx.cs" Inherits="TPC_Ortiz_Costa.Admin_Articulos" %>
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

    <div style="padding-bottom: 4rem !important; padding-top: 7rem !important;">
        <div class="card w-50 mx-auto shadow-sm border-1" style="border-radius: 15px !important;">
            <div class="card-body">
                <div class="container mt-4 d-flex justify-content-between">

                    <div class="col mx-3">
                            <div class="mb-3">
                                <label>Código</label>
                                <asp:TextBox ID="txtCodigo" class="form-control" placeholder="Código" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label>Nombre</label>
                                <asp:TextBox ID="txtNombre" class="form-control" placeholder="Nombre" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label>Descripción</label>
                                <asp:TextBox ID="txtDescripcion" class="form-control" placeholder="Descripción" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label>Precio</label>
                                <asp:TextBox ID="txtPrecio" class="form-control" placeholder="Precio" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label>Stock</label>
                                <asp:TextBox ID="txtStock" class="form-control" placeholder="Stock" runat="server"></asp:TextBox>
                            </div>
                    </div>

                    <div class="col mx-3">
                        <div class="mb-3">
                            <label for="disabledSelect">Categoría</label>
                            <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="disabledSelect">Marca</label>
                            <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="disabledSelect">Talle</label>
                            <asp:DropDownList ID="ddlTalle" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label>Imagén</label>
                            <asp:TextBox ID="txtImg" class="form-control" placeholder="Url" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>Segunda Imagén</label>
                            <asp:TextBox ID="txtImg2" class="form-control" placeholder="Url" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Button Text="Agregar" ID="btnAgregar" class="btn btn-light shadow-sm button d-flex justify-content-center mx-auto my-3" runat="server" OnClick="btnAgregar_Click" />
        </div>
    </div>

</asp:Content>
