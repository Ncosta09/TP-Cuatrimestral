<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin-Usuarios.aspx.cs" Inherits="TPC_Ortiz_Costa.Admin_Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .icons i {
            color: #b5b3b3;
            border: 1px solid #b5b3b3;
            padding: 6px;
            margin-left: 4px;
            border-radius: 5px;
            cursor: pointer
        }

        .activity-done {
            font-weight: 600
        }

        .list-group li {
            margin-bottom: 12px
        }

        .list li {
            list-style: none;
            padding: 10px;
            border: 1px solid #e3dada;
            margin-top: 12px;
            border-radius: 5px;
            background: #fff
        }

        .checkicon {
            color: green;
            font-size: 19px
        }

        .date-time {
            font-size: 12px
        }

        .profile-image img {
            margin-left: 3px
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

    <div class="container mt-5" style="padding-top: 5rem !important; padding-bottom: 5rem !important;">
        <div class="card card-body shadow-sm border-1" style="border-radius: 15px !important;">
            <div class="row">
                <div class="col-md-12">
                    <div class="d-flex justify-content-between align-items-center activity">
                        <div><span class="activity-done">Usuarios: <%:Contador %></span></div>
                        <div class="icons"><i class="fa fa-search border-0"></i><i class="fa fa-ellipsis-h border-0"></i></div>
                    </div>
                    <div class="mt-3">
                        <ul class="list list-inline">

                            <%foreach (var Usuario in ListaUsuario)
                                { %>

                            <li class="d-flex justify-content-between shadow-sm border-1" style="border-radius: 15px !important;">
                                <div class="d-flex flex-row align-items-center">
                                    <i class="fa fa-check-circle checkicon mx-2"></i>
                                    <div class="ml-2">
                                        <h6 class="mb-0 text-black-50">Usuario: <b><%:Usuario.Username %></b></h6>
                                        <div class="d-flex flex-row mt-1 text-black-50 date-time">
                                            <div><i class="fa fa-calendar-o"></i><span class="ml-2">Email: <%:Usuario.Email %></span></div>
                                            <%if (Usuario.Tipo)
                                                {
                                                    Tipo = "Admin";
                                                }
                                                else
                                                {
                                                    Tipo = "Cliente";
                                                }%>
                                            <div class="ml-3"><i class="fa fa-clock-o"></i><span class="ml-2 mx-2">Categoría: <b><%:Tipo%></b></span></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex flex-row align-items-center">
                                    <div class="d-flex flex-row mr-2">
                                        <div>
                                            <a href="Admin-Usuarios.aspx?ID=<%:Usuario.Id %>&Tipo=<%:Convert.ToInt32(Usuario.Tipo) %>" class="btn btn-light shadow-sm button mx-2">Cambiar Categoría</a>
                                        </div>
                                        <%if (!Usuario.Tipo)
                                            {%>
                                        <div>
                                            <a href="Admin-Usuarios.aspx?Remove=<%:Usuario.Id %>" class="btn btn-light shadow-sm button mx-2">Eliminar</a>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </li>

                            <% } %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
