<%@ Page AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="recetario.AgregarUsuario" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>
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
            <asp:Label runat="server" ID="Id"/>
            <h1>Register</h1>
            <p>Nombre</p>
            <asp:TextBox runat="server" id="txtNombre" />
            <p>Apellido Paterno</p>
            <asp:TextBox runat="server" ID="txtApaterno" />
            <p>Apellido Materno</p>
            <asp:TextBox runat="server" ID="txtAmaterno" />
            <p>Password:</p>
            <asp:TextBox runat="server" id="txtPassword" TextMode="Password"/> <br /><br />
            <asp:Button runat="server" id="btn_Guardar" Text="Guardar" OnClick="btn_guardar_usuario"/>
            <p>¿Ya tienes cuenta?</p>
            <asp:Button runat="server" id="btn_login" Text="Logear" OnClick="btn_logear_usuario"/>
        </div>
</asp:Content>