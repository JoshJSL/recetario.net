<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="recetario.ValidarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>WELCOME CHEF!</h1>
            <p>Id</p>
            <asp:TextBox runat="server" id="txtId" />
            <p>Password:</p>
            <asp:TextBox runat="server" id="txtPassword" TextMode="Password"/> <br /><br />
            <asp:Button runat="server" id="btn_Login" Text="Login" OnClick="btn_validar_usuario"/>
            <p>¿No tienes cuenta? </p>
            <asp:Button runat="server" id="btn_Registro" Text="Registrar" OnClick="btn_registrar_usuario"/>
            

        </div>
    </form>
</body>
</html>