<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contactar.aspx.cs" Inherits="TPC_Ortiz_Costa.Contactar" %>
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
                background-color: rgb(0,121,0) !important;
            }
    </style>

    <div class="my-3" style="padding-top: 5rem !important;">
        <div class="card h-100 border-1 shadow-sm border-1 w-25 mx-auto" style="border-radius: 15px;">
            <div class="card-body">
                <h5 class="my-auto text-center"><i>Envíanos un mensaje!</i></h5>
            </div>
        </div>
    </div>

    <div class="card w-50 mx-auto border-1 shadow-sm" style="border-radius: 15px;">
        <div class="card-body">
            <div class="container w-75 mx-auto py-4">

                    <div class="mb-3">
                        <label class="form-label" for="name">Nombre</label>
                        <input class="form-control" id="name" type="text" placeholder="Nombre" data-sb-validations="required" />
                        <div class="invalid-feedback" data-sb-feedback="name:required">El nombre es requerido.</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="emailAddress">Email</label>
                        <input class="form-control" id="emailAddress" type="email" placeholder="Email" data-sb-validations="required, email" />
                        <div class="invalid-feedback" data-sb-feedback="emailAddress:required">El Email es requerido.</div>
                        <div class="invalid-feedback" data-sb-feedback="emailAddress:email">El Email es invalido.</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="message">Mensaje</label>
                        <textarea class="form-control" id="message" type="text" placeholder="Mensaje" style="height: 10rem;" data-sb-validations="required"></textarea>
                        <div class="invalid-feedback" data-sb-feedback="message:required">El mensaje es requerido.</div>
                    </div>

                    <div class="d-none" id="submitSuccessMessage">
                        <div class="text-center mb-3">Mensaje enviado correctamente.</div>
                    </div>

                    <div class="d-none" id="submitErrorMessage">
                        <div class="text-center text-danger mb-3">Error enviando mensaje.</div>
                    </div>

                    <div class="d-grid">
                        <button class="btn btn-light button mx-auto shadow-sm" id="submitButton" type="submit" style="width: 20% !important; border-radius: 30px;">Enviar</button>
                    </div>

            </div>
        </div>
    </div>

    <footer style="padding-bottom: 4rem !important;">
        <section>
            <div class="my-3" style="display: flex; justify-content: center;">
                <span class="mx-4"><i>Contáctanos en nuestras Redes Sociales: </i></span>
                <a href="#" class="me-4 text-reset" style="text-decoration: none !important;">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#" class="me-4 text-reset" style="text-decoration: none !important;">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#" class="me-4 text-reset" style="text-decoration: none !important;">
                    <i class="fab fa-instagram"></i>
                </a>
            </div>
        </section>
    </footer>

</asp:Content>
