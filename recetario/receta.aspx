<%@ Page Title="" Language="C#" MasterPageFile="~/maestra.Master" AutoEventWireup="true" CodeBehind="receta.aspx.cs" Inherits="recetario.receta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1><asp:Label runat="server" ID="titulo">Titulo receta</asp:Label></h1>
     <h3>Autor: <asp:Label runat="server" ID="autor">Autor</asp:Label></h3>
    <br />
    <div>
        <h4>Ingredientes</h4>
        <asp:BulletedList runat="server" ID="ingredientes" BulletStyle="Disc" DisplayMode="Text">

        </asp:BulletedList>
        <h4>Procedimiento</h4>
        <asp:Label runat="server" ID="procedimiento" />
    </div>

</asp:Content>
