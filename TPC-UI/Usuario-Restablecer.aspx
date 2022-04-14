<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario-Restablecer.aspx.cs" Inherits="TPC_Ortiz_Costa.Usuario_Restablecer" %>
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
        function ValidarBuscar() {
            var User = document.getElementById("<%: txtUsername.ClientID %>");
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

        function ValidarRestablecer() {
            var Restablecer = document.getElementById("<%: txtRestablecer.ClientID %>");
            var Verificar = document.getElementById("<%: txtVerificar.ClientID %>");
            var Flag = true;

            if ((Restablecer.value === "" || Restablecer.value === null) && (Restablecer.value === Pass.value)) {

                Restablecer.classList.remove("is-valid");
                Restablecer.classList.add("is-invalid");
                Flag = false;
            }
            else {
                Restablecer.classList.remove("is-invalid");
                Restablecer.classList.add("is-valid");
                Flag = true;
            }
            if ((Pass.value === "" || Pass.value === null) && (Restablecer.value === Pass.value)) {

                Verificar.classList.remove("is-valid");
                Verificar.classList.add("is-invalid");
                Flag = false;
            }
            else {
                Pass.classList.remove("is-invalid");
                Pass.classList.add("is-valid");
                Flag = true;
            }
            return Flag;
        }
    </script>

    <div style="display: flex; justify-content: center; padding-bottom: 3rem !important; padding-top: 7rem !important;">
        <div class="card w-50 shadow-sm border-1" style="border-radius: 15px;">
            <div class="card-body">

                <div class="container mt-5">
                    <div class="col w-75 mx-auto mb-5">
                        <div class="mb-3">
                        </div>

                        <%if (Session["Usuario"] == null)
                            {%>                        
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
                                <label for="validationServer02">Email</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" placeholder="Email" ClientIDMode="Static" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="txtEmail"
                                    ErrorMessage="* Obligatorio."
                                    ForeColor="Red" 
                                    Font-Italic="true" 
                                    Font-Size="XX-Small">
                                </asp:RequiredFieldValidator>                               
                            </div>

                            <div class="mb-3">
                                <asp:Button OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" CssClass="btn button-green btn-light shadow-sm button " ID="btnBuscar" Text="Buscar" runat="server" />
                                <a class="btn btn-light shadow-sm button text-dark" >Volver</a>
                            </div>
                            <hr>
                            <p class="mb-0">Ingrese los datos de su cuenta para poder localizarla en nuestro sistema.</p>                       
                        <%}
                            else
                            {%>                
                            <div class="mb-3 needs-validation">
                                <label for="validationServer03">Nueva Contraseña</label>
                                <asp:TextBox runat="server" class="form-control" ID="txtRestablecer" type="password" ClientIDMode="Static" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="txtRestablecer"
                                    ErrorMessage="* Obligatorio."
                                    ForeColor="Red" 
                                    Font-Italic="true" 
                                    Font-Size="XX-Small">
                                </asp:RequiredFieldValidator>                                     
                            </div>

                            <div class="mb-3 needs-validation">
                                <label for="validationServer04">Verificar Contraseña</label>
                                <asp:TextBox runat="server" class="form-control" ID="txtVerificar" type="password" ClientIDMode="Static" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="txtVerificar"
                                    ErrorMessage="* Obligatorio."
                                    ForeColor="Red" 
                                    Font-Italic="true" 
                                    Font-Size="XX-Small">
                                </asp:RequiredFieldValidator>                                     
                            </div>

                            <div class="mb-3">
                                <asp:Button OnClientClick="return ValidarRestablecer();" OnClick="btnRestablecer_Click" CssClass="btn btn-light shadow-sm button" ID="btnRestablecer" Text="Restablecer" runat="server" />
                                <a class="btn btn-light shadow-sm button" href="Catalogo.aspx">Volver</a>
                            </div>                     
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
