<%@ Page AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="recetario.Home" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
     <title>Home</title>
    <style>
        .container{
            width: 100%;
            background-color: azure;
            display: flex;
            flex-wrap: wrap;
        }

        .caja{
            width: 200px;
            height: 160px;
            border: solid 1px black;
            text-align: center;
            line-height: 60px;
            margin: 10px;
        }

        .imagen{
            width: 90px;
            height: 90px;
            position: center;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contenido">
     <div>
            <h1>Check the trends</h1>
            <asp:Label Text="User Name" runat="server" />
            <div class="container">
                <div class="caja caja1">
                    <div class="imagen"> <asp:Image id="Image4" runat="server" Height="90px" ImageUrl="~/Imagenes/platillo.jpg" Width="200px" AlternateText="Imagen no disponible" ImageAlign="TextTop" /></div>
                    <asp:Label ID="Label1" Text="The perfect recipe for tamales" runat="server" />
                    <asp:Button Text="Check" runat="server" />
                </div>
                <div class="caja caja2">
                    <div class="imagen"> <asp:Image id="Image5" runat="server" Height="90px" ImageUrl="~/Imagenes/platillo.jpg"  Width="200px" AlternateText="Imagen no disponible" ImageAlign="TextTop" /></div>
                    <asp:Label ID="Label2" Text="Tostadas in 5 minutes" runat="server" />
                    <br />
                    <asp:Button Text="Check" runat="server" />
                </div>
                <div class="caja caja3">
                    <div class="imagen"> <asp:Image id="Image6" runat="server" Height="90px" ImageUrl="~/Imagenes/platillo.jpg" Width="200px" AlternateText="Imagen no disponible" ImageAlign="TextTop" /></div>
                    <asp:Label ID="Label3" Text="Something for breakfast?" runat="server" />
                    <asp:Button Text="Check" runat="server" />
                </div>
            </div>
            <h1>Watch our video tutorial</h1>
        </div>
</asp:Content>