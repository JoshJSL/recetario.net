<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="recetario.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Check the trends</h1>
            <asp:Label Text="User Name" runat="server" />
            <div class="container">
                <div class="caja caja1">
                    <div class="imagen"> <asp:Image id="Image1" runat="server" Height="90px" ImageUrl="~/Imagenes/platillo.jpg" runat="server" Width="200px" AlternateText="Imagen no disponible" ImageAlign="TextTop" /></div>
                    <asp:Label ID="receta1" Text="The perfect recipe for tamales" runat="server" />
                    <asp:Button Text="Check" runat="server" />
                </div>
                <div class="caja caja2">
                    <div class="imagen"> <asp:Image id="Image2" runat="server" Height="90px" ImageUrl="~/Imagenes/platillo.jpg" runat="server" Width="200px" AlternateText="Imagen no disponible" ImageAlign="TextTop" /></div>
                    <asp:Label ID="receta2" Text="Tostadas in 5 minutes" runat="server" />
                    <br />
                    <asp:Button Text="Check" runat="server" />
                </div>
                <div class="caja caja3">
                    <div class="imagen"> <asp:Image id="Image3" runat="server" Height="90px" ImageUrl="~/Imagenes/platillo.jpg" runat="server" Width="200px" AlternateText="Imagen no disponible" ImageAlign="TextTop" /></div>
                    <asp:Label ID="receta3" Text="Something for breakfast?" runat="server" />
                    <asp:Button Text="Check" runat="server" />
                </div>
            </div>
            <h1>Watch our video tutorial</h1>
        </div>
    </form>
</body>
</html>
