<%@ Page Title="" Language="C#" MasterPageFile="~/_Site.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="TPC_Ortiz_Costa.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card"></div>


    <div class="my-3" style="padding-top: 7rem !important;">
        <div class="card h-100 border-1 border-dark shadow-lg w-25 mx-auto">
            <div class="card-body">
                <h5 class="my-auto text-center"><b>¡Envíanos un mensaje!</b></h5>
            </div>
        </div>
    </div>



    <div class="card w-75 shadow-lg mx-auto border-1 border-dark">
        <div class="card-body">
            <div class="container py-4">

                <form id="contactForm" data-sb-form-api-token="API_TOKEN">

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
                        <button class="btn btn-dark mx-auto shadow-lg border-1 border-white" id="submitButton" type="submit" style="width: 26% !important; border-radius: 40px;">Enviar</button>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <footer>
        <section>

            <div style="display: flex; justify-content: center; margin: 10px;">
                <span><i>Contáctanos en nuestras Redes Sociales:</i></span>
            </div>

            <div style="display: flex; justify-content: center;">
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
