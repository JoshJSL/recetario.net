<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Credenciales.aspx.cs" Inherits="recetario.Credenciales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Felicidades, ahora eres miembro</h1>
            <p>Estas son tus credenciales para que puedas ingresar: </p><br />
            <asp:Label ID="Id" runat="server" Text="Id"></asp:Label><br />
            <p>Ahora logeate y comienza a compartir</p><br />
            <asp:Button runat="server" id="btn_Login" Text="Login" OnClick="btn_login"/>
        </div>
    </form>
</body>
</html>
