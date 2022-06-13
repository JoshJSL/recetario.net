<%@ Page AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="recetario.ValidarUsuario" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>
<asp:Content ID="Content" runat="server" ContentPlaceHolderID="head">
<style>
.container {
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
}
</style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contenido">
     <div class="container">
            <h1>WELCOME CHEF!</h1>
            <asp:Label runat="server" ID="msg" />
            <p>Id</p>
            <asp:TextBox runat="server" id="txtId" />
            <p>Password:</p>
            <asp:TextBox runat="server" id="txtPassword" TextMode="Password"/> <br /><br />
            <asp:Button runat="server" id="btn_Login" Text="Login" OnClick="btn_validar_usuario"/>
            <p>¿No tienes cuenta? </p>
            <asp:Button runat="server" id="btn_Registro" Text="Registrar" OnClick="btn_registrar_usuario"/>  

        </div>
</asp:Content>
