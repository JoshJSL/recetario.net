<%@ Page AutoEventWireup="true" CodeBehind="Credenciales.aspx.cs" Inherits="recetario.Credenciales" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contenido">
    <div>
            <h1>Felicidades, ahora eres miembro</h1>
            <p>Estas son tus credenciales para que puedas ingresar: </p><br />
            <asp:Label ID="Id" runat="server" Text="Id"></asp:Label><br />
            <p>Ahora logeate y comienza a compartir</p><br />
            <asp:Button runat="server" id="btn_Login" Text="Login" OnClick="btn_login"/>
        </div>
</asp:Content>