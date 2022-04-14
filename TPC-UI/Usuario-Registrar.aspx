<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario-Registrar.aspx.cs" Inherits="TPC_Ortiz_Costa.Usuario_Registrar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .button {
            transition: all .5s ease !important;
            border-radius: 15px !important;           
        }

            .button-green:hover {
                color: white !important;
                background-color: rgb(0,121,0) !important;
            }
    </style>

    <script>
        function Validar() {
            var User = document.getElementById("<%: txtUsername.ClientID %>");
            var Pass = document.getElementById("<%: txtPassword.ClientID %>");
            var Email = document.getElementById("<%: txtEmail.ClientID %>");
            var Flag = true;

            if (User.value === "" || User.value === null) {

                User.classList.remove("is-valid");
                User.classList.add("is-invalid");        
                Flag = false;
            }
            else {
                User.classList.remove("is-invalid");
                User.classList.add("is-valid");
                Flag = true;
            }
            if (Pass.value === "" || Pass.value === null) {

                Pass.classList.remove("is-valid");
                Pass.classList.add("is-invalid");
                Flag = false;
            }
            else {
                Pass.classList.remove("is-invalid");
                Pass.classList.add("is-valid");
                Flag = true;
            }
            if (Email.value === "" || Email.value === null) {

                Email.classList.remove("is-valid");
                Email.classList.add("is-invalid");
                Flag = false;
            }
            else {
                Email.classList.remove("is-invalid");
                Email.classList.add("is-valid");
                Flag = true;
            }
            return Flag;
        }
    </script>


    <div style="display: flex; justify-content: center; padding-bottom: 2rem !important; padding-top: 7rem !important;">
        <div class="card w-50 shadow-sm border-1" style="border-radius: 15px;">
            <div class="card-body">
                <div class="container mt-5">
                    <div class="col w-75 mx-auto mb-5">
                        <div class="mb-3">
                        </div>
                            <div class="mb-3 needs-validation">
                                <label for="validationServer01">Usuario</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtUsername" placeholder="Usuario" ClientIDMode="Static" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtUsername"
                                    ErrorMessage="* Obligatorio."
                                    ForeColor="Red" 
                                    Font-Italic="true" 
                                    Font-Size="XX-Small">
                                </asp:RequiredFieldValidator>                           
                            </div>

                            <div class="mb-3 needs-validation">
                                <label for="validationServer02">Contraseña</label>
                                <asp:TextBox runat="server" type="password" CssClass="form-control" ID="txtPassword" placeholder="Contraseña" ClientIDMode="Static" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtPassword"
                                    ErrorMessage="* Obligatorio."
                                    ForeColor="Red" 
                                    Font-Italic="true" 
                                    Font-Size="XX-Small">
                                </asp:RequiredFieldValidator>                               
                            </div>

                            <div class="mb-3 needs-validation">
                                <label for="validationServer03">Email</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" placeholder="Email" ClientIDMode="Static" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtEmail"
                                    ErrorMessage="* Obligatorio."
                                    ForeColor="Red" 
                                    Font-Italic="true" 
                                    Font-Size="XX-Small">
                                </asp:RequiredFieldValidator>                                
                            </div>

                            <label class="mb-3">
                                <input type="checkbox" name="subscribeNewsletter">
                                Subscribirse al Newsletter
                            </label>

                            <div class="mb-3">
                                <asp:Button Text="Crear" CssClass="btn button-green btn-light shadow-sm button" runat="server" ID="btnCrear" OnClientClick="return Validar();" OnClick="btnCrear_Click" />
                                <a class="btn btn-light shadow-sm button text-dark" href="Catalogo.aspx">Volver</a>
                            </div>

                            <hr>
                            <p class="mb-0">¿Olvidaste tu contraseña? <a href="Usuario-Restablecer.aspx" style="text-decoration: none; color: cornflowerblue;">Recuperar contraseña</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
